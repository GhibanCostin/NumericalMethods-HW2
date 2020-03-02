function task2(image)
  A = double(imread(image));
  k = [1:19 20:20:99 100:30:min(size(A))];
  y = zeros(length(k),1);
  err = zeros(length(k),1);
  for i = 1:length(k)
    Ak = task1(image, k(i));
    y(i) = sum(svd(Ak)) / sum(svd(A));
    [m n] = size(A);
    suma = 0;
    for l = 1:m
      for j = 1:n
        suma += (A(l,j) - Ak(l,j)) ^ 2;
      end
    end
    err(i) = suma / (m * n);
  end
  %figura 1 - toate valorile singulare, in ordine descrescatoare
  figure(1);
  plot(svd(A))
  %figura 2 - informatia data de primele k valori singulare
  figure(2);
  plot(k, y);
  %figura 3 - eroarea aproximarii
  figure(3);
  plot(k,err);
  
  %figura 4 - rata de compresie a imaginii
  compres = (m * k + n * k + k) / (m * n);
  figure(4);
  plot(k, compres);
end
