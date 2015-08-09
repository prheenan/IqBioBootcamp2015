clear,clc

%Navigate to "ImageFolders" and set as current directory
curdir=pwd;

%Add folder path that contains a function we will use
cd('..')
addpath(pwd)
cd(curdir)

firstpoint=0;
timepoints=34;

w=waitbar(0);
for t=firstpoint:timepoints
    try w=waitbar(t/37,w);end
    
    %First section is to load empty wells for flatfield correction
    AveF=0;AveC=AveF;i=1;
    y=1;
    for x=2:3
        %Row identifies what letter the well should be
        Row=char(y+64);
        %Column identifies what number the well should be
        Column=int2strz(x,2);
        
        foldername=['well ',Row,Column];
        cd(foldername)
        
        %load image
        imname=['wavelength * t',int2strz(t,2),'.tif'];
        imdir=dir(imname);
        FRT=imread(imdir(1).name);
        CFP=imread(imdir(2).name);
        
        %Blend image
        FRT2=imopen(FRT,strel('disk',5));
        CFP2=imopen(CFP,strel('disk',5));
        
        %Generate weighted average of like images
        AveF=AveF*(i-1)/i+double(FRT2)/i;
        AveC=AveC*(i-1)/i+double(CFP2)/i;
        i=i+1;
        cd(curdir)
    end
    FRTback=uint16(AveF);
    CFPback=uint16(AveC);
    
    %Y signifies the row (E F G)
    for y=5:7
        %X signifies the column (3->11)
        for x=3:11
            Row=char(y+64);
            Column=int2strz(x,2);
            foldername=['well ',Row,Column];
            %Skip if well folder does not exist in specified range
            try
                cd(foldername)
            catch
                continue
            end
            
            imname=['wavelength * t',int2strz(t,2),'.tif'];
            
            %load image
            imdir=dir(imname);
            FRT=imread(imdir(1).name);
            CFP=imread(imdir(2).name);
            
            %flatfield correction
            FRT2=uint16(double(FRT)./double(FRTback)*mean(mean(FRTback)));
            CFP2=uint16(double(CFP)./double(CFPback)*mean(mean(CFPback)));
            
            %background correction
            FRTsort=sort(reshape(FRT2,1,numel(FRT2)));
            CFPsort=sort(reshape(CFP2,1,numel(CFP2)));
            background=.2;
            FRTb=mean(FRTsort(1:numel(FRTsort)*background));
            CFPb=mean(CFPsort(1:numel(CFPsort)*background));
            FRT3=FRT2-FRTb;
            CFP3=CFP2-CFPb;
            
            %Intensity Segmentation
            CFP4=CFP3;
            FRT4=FRT3;
            thresh=750;
            CFP4(CFP3<thresh)=0;
            FRT4(CFP3<thresh)=0;
            CFP4(FRT3<thresh)=0;
            FRT4(FRT3<thresh)=0;
            bw=im2bw(CFP4,0);
            bw2=bwareaopen(bw,15);
            CFP4(bw2==0)=0;
            FRT4(bw2==0)=0;
            
            %calculation
            Ratio=double(FRT4)./double(CFP4);
            Ratio(isnan(Ratio))=0;
            %Saves the values based on loop #, so that each timepoint is a
            %snapshot of the plate: y as row, x as column
            ratio(y,x,t+(1-firstpoint))=sum(sum(Ratio))/nnz(Ratio);
            
            %Set to 1 if you want to save ratio images
            if 0
            cd('..')
            
            try
                cd('Ratios')
            catch
                mkdir('Ratios')
                cd('Ratios')
            end
            savename=['Ratio ',Row,Column,'.tif'];
            if t==0
                imwrite(uint16(Ratio*1000),savename)
            else
                imwrite(uint16(Ratio*1000),savename,'WriteMode','append')
            end
            end
            cd(curdir)
       
        end
    end
end
try,close(w),end
save(int2str(clock))
%%

for x=2:10
    Ave(:,x)=mean(ratio(5:7,x+1,:));
    Err(:,x)=std(ratio(5:7,x+1,:));
end
xax(:,1)=[-1/60*5 ,[firstpoint:timepoints-1]*.5];
%%
%Plot all timepoints and conditions
figure
for x=2:10
    two=errorbar(xax(:,1),Ave(:,x),Err(:,x));
    set(two,'color',[x/12 0 x/12])
    hold all
end
axis([-.5 16.5 1 1.7])
xlabel('Time (hr)')
ylabel('Nuclear ERK Activity (FRET/CFP)')
legend('0 nM','1','5','10','50','100','250','500','1000')
title('PMA Titration on HeLa Cells')

%%

%Choose a timepoint to generate an EC50 curve
hour=2;

conc=[0 1 5 10 50 100 250 500 1000];
timepoint=(hour*2)+2;

xData=shiftdim(conc);
yData=shiftdim(Ave(timepoint,2:end));

% Set up fittype and options.
ft = fittype( '-a*exp(-b*x)+c', 'independent', 'x', 'dependent', 'y' );

%Set bounds and starting points for curve
opts = fitoptions( ft );
opts.Display = 'Off';
opts.Lower = [0 -Inf yData(end)*0.5];
opts.StartPoint = [yData(1)-yData(end) .55 max(yData)];
opts.Upper = [2 Inf yData(end)*1.5];

% Fit curve to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

%Solve for EC50
values=coeffvalues(fitresult);
halfmax=mean([values(3) yData(1)]);
syms x
EC50=double(solve(-values(1)*exp(-values(2)*x)+values(3)==halfmax));

%Plot result
figure
plot(xData,yData,'k.');
hold all
plot(fitresult)
legend(['EC50 = ',num2str(EC50),' nM'])
set(gca,'xscale','log')
xlabel('PMA (nM)')
ylabel('Nuclear ERK Activity (FRET/CFP)')
title(['PMA Titration: ',num2str(hour),' hours']) 

