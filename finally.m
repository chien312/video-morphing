video = VideoWriter('myvideo','MPEG-4'); %create the video object
video.FrameRate = 30;
open(video); %open the file for writing


for i=0:29
filename = "output/you_to_me_" + i + ".jpg";
I = imread(filename); %read the next image
writeVideo(video,I); %write the image to file
end
close(video); %close the file