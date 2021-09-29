for i = 1:40 
A=imread('eye.JPG');
G= imresize(A,[256 256]); 
In=rgb2gray(G); 
figure;imshow(In);
imwrite(In,'resizeeye.jpg') ;
npg=arr(g,dtype='f');
    nph=arr(h,dtype='f');
k=l*2500;
m=0;
end
while m<2500
    i = randi([16 240],1);
    j= randi([16 240],1);
       if arr[i,j]==0;
 %new=npg[i-16:i+16,j-16:j+16,:]
 result1 = Image.fromarray((new).astype(np.uint8))
 
           k=k+1;
            m=m+1;

       end



end
