function [mean_r, mean_g, mean_b, var_r, var_g, var_b, skew_r, skew_g, skew_b, kur_r, kur_g, kur_b] = ekstrasiCiri(berkas)
  citradou = double(imread(berkas));
  [baris, kolom, keping] = size(citradou);
  jum_piksel = baris * kolom;

  jum_r=0;
  jum_g=0;
  jum_b=0;

  jum_var_r = 0;
  jum_var_g = 0;
  jum_var_b = 0;

  jum_skew_r = 0;
  jum_skew_g = 0;
  jum_skew_b = 0;

  jum_kur_r = 0;
  jum_kur_g = 0;
  jum_kur_b = 0;

  for i = 1 : baris
    for j = 1 : kolom
          jum_r = jum_r + citradou(i, j, 1);
          jum_g = jum_g + citradou(i, j, 2);
          jum_b = jum_b + citradou(i, j, 3);
    end
  end

  mean_r = jum_r / jum_piksel;
  mean_g = jum_g / jum_piksel;
  mean_b = jum_b / jum_piksel;
  
 for i = 1 : baris
    for j = 1 : kolom  
          jum_var_r = jum_var_r + (citradou(i, j,1) - mean_r)^2;
          jum_var_g = jum_var_g + (citradou(i, j,2) - mean_g)^2;
          jum_var_b = jum_var_b + (citradou(i, j,3) - mean_b)^2;

          jum_skew_r = jum_skew_r + (citradou(i, j,1) - mean_r)^3;
          jum_skew_g = jum_skew_g + (citradou(i, j,2) - mean_g)^3;
          jum_skew_b = jum_skew_b + (citradou(i, j,3) - mean_b)^3;

          jum_kur_r = jum_kur_r + (citradou(i, j,1) - mean_r)^4;
          jum_kur_g = jum_kur_g + (citradou(i, j,2) - mean_g)^4;
          jum_kur_b = jum_kur_b + (citradou(i, j,3) - mean_b)^4;
      end
 end
 
  var_r = sqrt(jum_var_r/jum_piksel);
  var_g = sqrt(jum_var_g/jum_piksel);
  var_b = sqrt(jum_var_b/jum_piksel);
  
  skew_r = jum_skew_r/ (jum_piksel * (var_r^3));
  skew_g = jum_skew_g/ (jum_piksel * (var_g^3));
  skew_b = jum_skew_b/ (jum_piksel * (var_b^3));
  
  kur_r = jum_kur_r / (jum_piksel * (var_r^4)) - 3;
  kur_g = jum_kur_g / (jum_piksel * (var_g^4)) - 3;
  kur_b = jum_kur_b / (jum_piksel * (var_b^4)) - 3;
end