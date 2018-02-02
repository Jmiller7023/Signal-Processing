function [out] = StringmatchApprox(P,S,t)
%%%%% inputs 
% S : The string in which we want to find the number of times our pattern P appears
 % P : Pattern that we wish to search for inside S
 %t : number of errors allowed

%%%%% output 
% out : the number of times P occurs in S within a hamming distance of t
out = 0;
numErrors = 0;

%get the size of P and S
substrlength = strlength(P);
stringlength = strlength(S);

%convert to a character array to allow indexing
str = char(S); 
substr = char(P);

for i = 1:stringlength - substrlength + 1
    for j = 1:substrlength
        if(str(i + j - 1) ~= substr(j))
           numErrors = numErrors + 1;
        end
        if(numErrors > t)
           break;
        end
    end
    if(numErrors <= t)
       out = out + 1; 
    end
    numErrors = 0;
end

end
