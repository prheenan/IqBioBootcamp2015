% Creating strings in multiple ways:
% concatenation:
HelloByList = [ 'h' 'e' 'l' 'l' 'o'];
% just listing them
HelloByStr = 'hello';
% display the strings
disp('Our strings are');
disp(HelloByList);
disp(HelloByStr);
disp('Are they equal?')
AreEqual = strcmp(HelloByStr,HelloByList);
if (AreEqual)
    disp('Yes');
else
    disp('No')
end
%
% We can *format printing* using fprintf
%
% we have 'special' formatting characters:
% '\n': 'Add a newline (space/enter) here'
% '%s': 'Replace me with a string when printing'
% '%d': 'Replace me with a number when printing'
fprintf('\n\n****Using formatted print****\n\n\n');
fprintf('Our Strings are %s\n%s\n',HelloByList,HelloByStr);
fprintf('Are they equal?\n %d\n',AreEqual);
fprintf('The %drd character of %s is %s\n',3,HelloByList,HelloByList(3));