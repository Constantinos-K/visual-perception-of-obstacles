function meanArray=csvMeanArray(file)

B=csvread(file);

% Rescale entries from [0, 1] to [0, 255]
B=rescale(B,0,255);

g=mat2cell(B(:,:,1),[16 16 16 16 16 16 16 16 16 16 16 16 16 16], [16 16 16 16 16 16 16 16 16 16 16 16 16 16]);

% Calculate the mean value for region
meanArray = zeros(14, 14);
for iIdx = 1:14
    for jIdx = 1:14
       meanArray(iIdx,jIdx) = mean2(g{iIdx,jIdx});
    end
end
