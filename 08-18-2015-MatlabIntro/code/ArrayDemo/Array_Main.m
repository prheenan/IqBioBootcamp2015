% create an array of numbers
MyNumArray = [8 6 7 5 3 0 9];
% get the length of the array
MyLength = length(MyNumArray);
% print the entire array
disp(MyLength);
% should print the *first* element
% (Matlab starts counting from 1)
disp(MyNumArray(1)); 
% should print the *last* element
disp(MyNumArray(MyLength));
% Make a new array
OtherNumbersILike = [2 4 6 0 1 2 3];
% concatenate the two array into a longer, 1D list
LongerList = [MyNumArray OtherNumbersILike ];
fprintf('LongerList: %d\n',LongerList)
disp(LongerList)
% concatenate the two arrays into a *2D* list
% before, we said:
% [ [8 6 7 5 3 0 9] [2 4 6 0 1 2 3] ] = 
%  [8 6 7 5 3 0 9 2 4 6 0 1 2 3]
% now, we will have two rows, like:
% [ [8 6 7 5 3 0 9] [2 4 6 0 1 2 3] ] = 
% [ [8 6 7 5 3 0 9] [2 4 6 0 1 2 3] ]
% Note the use of the ';'
TwoDList = [MyNumArray ; OtherNumbersILike ];
fprintf('TwoDList: %d\n',TwoDList);
disp(TwoDList);
% We can also make 2D slices
FirstNumOfFirstList = TwoDList(1,1);
fprintf('First number of first list is %d.\n',FirstNumOfFirstList);
% The colon lets you specify an entire dimension.
% so, if we wanted the entire first list back, we could
% get all the columns (numbers) in the first row (list)
FirstListAgain = TwoDList(1,:);
disp(FirstListAgain);
% if We wanted the third number in each list,
% it is similar. This time, we want the third 
% column (third number) in all rows (all lists)
AllThirds = TwoDList(:,3);
disp(AllThirds);
% Lastly: normal math
% Addition and Subtraton work like youd expect
Add = OtherNumbersILike + MyNumArray - 2;
disp('Math');
disp(Add)
% multiplication, subtraction, exponentiation do *not*
% this next line is *broken*
 Multiplication = OtherNumbersILike .* MyNumArray;
% Need to use *elementwise* operations, like
% '.*' for multiplication or './' for division
% Unless you are doing linear algebra, just
% *always* use elementwise operations
Multiplication = OtherNumbersILike ./ MyNumArray;
disp(Multiplication);