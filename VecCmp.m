function [m] = VecCmp(V1, V2)

size = length(V1);
size2 = length(V2);

if(size ~= size2)
   print("Vectors must be of same length"); 
   m = -1;
   return;
end

count = 0;

for i = 1:size
    if(V1(i) == V2(i))
        count = count + 1;
    end
end

m = count / size;
end
