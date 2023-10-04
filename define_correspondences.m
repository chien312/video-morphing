function [im1_pts, im2_pts, tri] = define_correspondences(...
    im1, im2, im1_pts_path, im2_pts_path)


if exist(im1_pts_path, 'file')~=2 || exist(im2_pts_path, 'file')~=2
    [im1_pts, im2_pts] = cpselect(im1, im2, 'Wait', true);
    %append four corners, so as to cover entire image with triangles
    im1_pts = [im1_pts; [1,1]; [size(im1,2),1]; ...
        [size(im1,2),size(im1,1)]; [1,size(im1,1)]];
    im2_pts = [im2_pts; [1,1]; [size(im2,2),1]; ...
        [size(im2,2),size(im2,1)]; [1,size(im2,1)]];
    save(im1_pts_path, 'im1_pts');
    save(im2_pts_path, 'im2_pts');
else    
    im1_pts_mat = load(im1_pts_path, 'im1_pts');
    im2_pts_mat = load(im2_pts_path, 'im2_pts');
    im1_pts = im1_pts_mat(1).im1_pts;
    im2_pts = im2_pts_mat(1).im2_pts;
    % load the predefined points
    [im1_pts, im2_pts] = cpselect(im1, im2,im1_pts, im2_pts, 'Wait', true);
    save(im1_pts_path, 'im1_pts');
    save(im2_pts_path, 'im2_pts');
end
% mean of the two point sets
pts_mean = (im1_pts + im2_pts) / 2;
% The triangulation of mean points that will be used for entire morphing process.
% Each row of tri specifies a triangle defined by indices with respect to the points
tri = delaunay(pts_mean);
triplot(tri, pts_mean(:,1), pts_mean(:,2)); % displays the triangles
end
