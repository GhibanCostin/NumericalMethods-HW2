function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  pkg load image;
  t = double(rgb2gray(imread(image_path)));
  [tl tc] = size(t);
  T = [];
  for j = 1:tl
    T = [T t(j,:)];
  end
  T = T';
  A_im = T - m;
  pr_test_img = eigenfaces' * A_im;
  min_dist = norm(pr_img(:,1) - pr_test_img);
  output_img_index = 1;
  for i = 2:columns(pr_img)
    if (norm(pr_img(:,i) - pr_test_img) < min_dist) 
      min_dist = norm(pr_img(:,i) - pr_test_img);
      output_img_index = i;
  end
end

