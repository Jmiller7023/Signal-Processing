function m = PeriodDetector_noise(X,e)
% inputs are the string X and the number of bursts e
% output is the estimated period 'T' f it is periodic
% and output is length(X) if aperiodic

minSignals = 2 * e + 1;
sizeX = size(X);
numvalues = sizeX(2);
numErrors = 0;

for i = 1:numvalues
    
    %if test period is not an integer multiple of data skip it.
    if(rem(numvalues, i) ~= 0)
       continue;
    end
    
    %if test period is larger than half the data set return length of X
    if((i == (numvalues / 2) + 1) || (i == ((numvalues + 1) / 2) + 1))
       m = numvalues;
       break;
    end
    
    %if number of cycles is smaller than 2e + 1 return length of X
    if(numvalues / i < minSignals)
       m = numvalues;
       break;
    end
    differ = zeros(numvalues/i, 1);

    %find all sections of period i that aren't the same as the first.
    for j = 1:i
        index = 1;
        for k = j:i:numvalues
            %prevent indexing past end
            if(k > numvalues)
               break; 
            end

            %check to find errors.
            if(X(j) ~= X(k))
                differ(index) = 1;
            end
            index = index + 1;
        end
    end

    for j = 1:(numvalues/i)
       if(differ(j) ~= 0)
           numErrors = numErrors + 1;
       end
    end
    
    if(numErrors <= e)
       m = i;
       break;
    end
    
    numErrors = 0;
end

end
