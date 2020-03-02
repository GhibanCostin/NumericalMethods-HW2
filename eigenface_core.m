function [m A eigenfaces pr_img] = eigenface_core(database_path)
  %pkg load image;
  T = [];
  [images err msg] = readdir(database_path);
  %vom scadea 2, deoarece readdir returneaza si subdirectoarele . si ..
  for i = 1:(rows(images) - 2)
    t = double(rgb2gray(imread([database_path "/" num2str(i) ".jpg"])));
    [tl tc] = size(t);
    aux = [];
    for j = 1:tl
      %transform matricea in vector coloana
      aux = [aux t(j,:)];
    end
    T = [T aux'];
  end
  m = zeros(rows(T), 1);
  for i = 1:rows(T)
    m(i) = mean(T(i,:));
  end
  A = T - m;
  [V l] = eig(A' * A); 
  Vaux = [];
  for i=1:rows(diag(l>1))
    if (diag(l>1)(i) == 1)
      Vaux = [Vaux V(:, i)];
    end
  end
  V = Vaux;
  eigenfaces = A * V;
  pr_img = eigenfaces' * A;
end