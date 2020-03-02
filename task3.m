function [Ak S] = task3(image, k)
  A = double(imread(image));
  [m n] = size(A);
  miu = zeros(m,1);
  for i = 1:m 
    miu(i) = sum(A(i,:)) / n;
    A(i,:) -= miu(i);
  end
  Z = A' / sqrt(n-1);
  [U S V] = svd(Z);
  W = V(:,1:k);
  Y = W' * A;
  Ak = W * Y + miu;
end