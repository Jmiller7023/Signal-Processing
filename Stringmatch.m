function [out] = Stringmatch(P,S)
%%%%% inputs 
% S : The string in which we want to find the number of times our pattern P appears
 % P : Pattern that we wish to search for inside S

%%%%% output 
% out : the number of times P occurs in S
out = 0;
numMatches = 0;

%get the size of P and S
substrlength = strlength(P);
stringlength = strlength(S);

%convert to a character array to allow indexing
str = char(S); 
substr = char(P);

%Case where substr is te same as str.
if(substrlength == stringlength)
   for i = 1:stringlength
      if(str(i) == substr(i))
          numMatches = numMatches + 1;
      end
   end
   if(numMatches == stringlength)
      out = out + 1; 
   end
   numMatches = 0;
end

for i = 1:stringlength - substrlength
    for j = 1:substrlength
        if(str(i + j - 1) == substr(j))
           numMatches = numMatches + 1;
        end
    end
    if(numMatches == substrlength)
       out = out + 1;
    end
    numMatches = 0;
end


end
