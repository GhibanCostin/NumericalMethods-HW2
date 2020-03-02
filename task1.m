function A_k = task1(image, k)
  A = double(imread(image));
  figure(1);
  imshow(uint8(A));
  [U S V] = svd(A);
  A_k = U(:,1:k) * S(1:k,1:k) * (V(:,1:k))';  
  figure(2);
  imshow(uint8(A_k));
end
