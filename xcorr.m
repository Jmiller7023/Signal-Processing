function [C] = PP5xcorr(x,y)

%%% PLEASE FILL THIS CODE WITH YOUR IMPLEMENTATION %%%

% x,y: input vectors containing signal values for the two input signals
% C: output vector containing the circular cross-correlation of the two
% vectors x,y

val = size(x);
N = val(2);
%preallocate for performance
C = zeros(1,N);

for n = 1:N
    sum = 0;
    for m = 1:N
        rem = mod((n+m - 2), N);
        sum = sum + x(m) * y(rem + 1); %arrays starting at 1 requires rem be added by 1.
    end
    C(n) = sum;
end
