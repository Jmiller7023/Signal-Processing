function [m] = bandLength(M)

test = zeros(900,1);
for i = 1:900
   test(i) = powerbw(M(i,:), 8000); 
end

m = test;
end