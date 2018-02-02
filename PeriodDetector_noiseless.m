function [m] = PP1PeriodDetector(Y)

%%% PLEASE FILL THIS CODE WITH YOUR IMPLEMENTATION %%%

% Y: input vector containing signal values
% m: output variable containing estimateed period of signal

x = size(Y);
numVals = x(2);
minVal = min(Y);

repeated = 0;

for i = 1:numVals
   if(minVal == Y(i))
       repeated = repeated + 1;
   end
end

if(repeated > 1)
    j = 1;
    %get first index
    while(Y(j) ~= minVal)
        j = j + 1;
    end
    repeated = repeated - 1;
    %calculate estimated period
    k = j + 1;
    while(Y(k) ~= minVal)
        k = k + 1;
    end
    repeated = repeated - 1;
    l = k - j;
    n = k;
    k = k + 1;
    
    %make sure the estimated period is accurate.
    while(repeated > 0)
       while(Y(k) ~= minVal)
          k = k + 1;
       end
       repeated = repeated - 1;

      h = k - n;
      if(h == l)
          repeated = -1; %period is accurate.
      else
          n = k; %New mark set.
          k = k + l + 1; %increment k.
          l = h + l; %storing the modified larger period.
      end     
    end
    m = l; %m should now be the correct period if it is periodic.
    
    %check values inbetween to see if its truly periodic.
    for a = 1:m
        if(a + m < numVals) %preventing an index past the end.
       if(Y(a) ~= Y(a + m))
          %This is not periodic, but the period could be wrong.
          m = numVals;
       end
        end
    end
else
   m = numVals; 
end
