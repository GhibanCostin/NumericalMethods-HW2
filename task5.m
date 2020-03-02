function task5(image)
  A = double(imread(image));
  [m n] = size(A);
  k = [1:19 20:20:99 100:30:min(size(A))];
  y = zeros(length(k), 1);
  err = zeros(length(k), 1);
  for i = 1:length(k)
    [Ak S] = task3(image, k(i));
    y(i) = sum(diag(S)(1:k(i))) / sum(diag(S));
    suma = 0;
    for l = 1:m
      for j = 1:n
        suma += (A(l,j) - Ak(l,j)) ^ 2;
      end
    end
    err(i) = suma / (m * n);
  end
  %pentru fig1 nu conteaza valoarea lui k, S-ul fiind calculat
  %independent de acesta
  %[Ak S] = task3(image, k(1)); 
  figure(1);
  plot(diag(S));
  figure(2);
  plot(k, y);
  figure(3);
  plot(k, err);
  compres = (2 * k + 1) / n;
  figure(4);
  plot(k, compres);
end
