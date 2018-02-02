function [m] = PowerSpectrumRowWise(M)

transposed = transpose(M);
freqTransposed = autocorr(transposed);
magnitude = abs(freqTransposed);
powerTransposedaudiorecords = magnitude.^2;
m = transpose(powerTransposedaudiorecords);
end