v1 = VideoReader('409410119.mp4');
v1Frame = read(v1,1);
imshow(v1Frame);
imwrite(v1Frame,'me.jpg');

v2 = VideoReader('408125029.mp4');
v2Frame = read(v2,v2.NumFrames);
imshow(v2Frame);
imwrite(v2Frame,'you.jpg');