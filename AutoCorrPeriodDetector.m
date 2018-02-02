function [m] = PP5AutoCorrPeriodDetector(Y)

%%% PLEASE FILL THIS CODE WITH YOUR IMPLEMENTATION %%%

% Y: input vector containing signal values
% m: output variable containing estimateed period of signal

C = PP5xcorr(Y,Y);
numvalues = length(C);
%preallocate memory
peaks = zeros(1, numvalues);
peakvals = zeros(1, numvalues);
peaknum = 1;

%calculate where the peaks are.
for i = 1:numvalues
    if(i == 1)
       if(C(i) > C(i + 1))
           continue;
       end
    end
    
     if(i == numvalues)
       if(C(i) > C(i - 1))
           continue;
       end
    end
    
    if(C(i) > C(i-1) && C(i) > C(i+1))
          peaks(peaknum) = i;
          peakvals(peaknum) = C(i);
          peaknum = peaknum + 1;
          continue;
    end
end

%preallocate memory.
maxpeaks = zeros(1, peaknum - 1);
maxpeakvals = zeros(1, peaknum -1);
maxval = max(peakvals);

maxpeaknum = 1;
for i = 1:peaknum - 1
    if(peakvals(i) + .2*maxval >= maxval && peakvals(i) - .2*maxval <= maxval)
       maxpeaks(maxpeaknum) = peaks(i);
       maxpeakvals(maxpeaknum) = peakvals(i);
       maxpeaknum = maxpeaknum + 1;
    end
end
multiplier = 1;

for i = 1:2:maxpeaknum - 1
    if(i + 2 >= maxpeaknum)
        break;
    end
    
    if(~(maxpeakvals(i) + .1*maxval >= maxpeakvals(i+2) && (maxpeakvals(i) - .1*maxval<= maxpeakvals(i+2))))
        multiplier = 2;
    end
end

if(maxpeaknum - 1 <= 1)
    m = numvalues;
    return;
end

diff = maxpeaks(2) - maxpeaks(1);
error = 0;

for i = 2:maxpeaknum - 1
    if(i+1 >= maxpeaknum-1)
       break; 
    end
    if(~(diff <= (maxpeaks(i+1) - maxpeaks(i)) + 1 && diff >= (maxpeaks(i+1) - maxpeaks(i)) - 1))
        m = numvalues;
        error = 1;
        break;
    end
end

if(error == 0)
    m = abs(diff)*multiplier;
end

end
