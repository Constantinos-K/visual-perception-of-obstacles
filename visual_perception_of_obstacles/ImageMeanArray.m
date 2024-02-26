function meanArray=ImageMeanArray(img)
I=imread(img);

% Resize matrix to 224x224
% B = imresize(I,0.207);
B = imresize(I, [224, 224]);

% Split matrix to 14x14 regions of size 16x16
g = mat2cell(B(:,:,1),[16 16 16 16 16 16 16 16 16 16 16 16 16 16], [16 16 16 16 16 16 16 16 16 16 16 16 16 16]);

% Calculate the mean value for region
meanArray = zeros(14, 14);
for iIdx = 1:14
    for jIdx = 1:14
       meanArray(iIdx,jIdx) = mean2(g{iIdx,jIdx});
    end
end



