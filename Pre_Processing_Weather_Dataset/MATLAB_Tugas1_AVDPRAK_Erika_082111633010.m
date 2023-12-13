% DATA DAN PRE-PROCESSING

% Nama : Erika Dwi Puspitasari
% NIM : 082111633010
% Kelas : I3

% Membaca data
data = readtable('day.csv')

% Menginput 3 record dari data dan menyimpannya dalam variabel baru.
data_day = data(1:3, :);
disp("data day = ")
disp(data_day)

% Mengambil 3 atribut dari data 
selected_atribut = data_day(:, [14, 15, 16]);
disp(selected_atribut);


% PRE-PROCESSING

% Deteksi outlier
outlier = isoutlier(selected_atribut)

% Penanganan Outlier
% Mengganti outlier dengan 0
data_outlier_cleaned = filloutliers(selected_atribut, 0) 

% Mengganti outlier dengan data terdekat
data_outlier_cleaned2 = filloutliers(selected_atribut, 'nearest', 'DataVariables', {'casual', 'registered'})

% Menghilangkan data outlier
data_outlier_cleaned3 = rmoutliers(selected_atribut)

% Deteksi Missing Value
missing1 = ismissing(data_outlier_cleaned)

missing2 = ismissing(data_outlier_cleaned3)


% NORMALISASI
% Normalisasi pada data data yang sudah oke
normalisasi = normalize(data_outlier_cleaned, 'zscore')

