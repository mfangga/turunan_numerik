funcprot(0);

// Fungsi Utama
function turunan_numerik
    printf("SELAMAT DATANG PADA PROGRAM METODE NUMERIK: TURUNAN\n\n");
    printf("Halaman Utama : \n\n");
    printf("1. Hitung Turunan Numerik\n");
    printf("2. Panduan Penggunaan Program\n");
    printf("3. Tentang Program\n");
    printf("4. Keluar Program\n\n");
    choice = input("Pilih Menu: ");
    if choice == 1 then hitung_turunan;
    elseif choice == 2 then panduan_program;
    elseif choice == 3 then tentang_program;
    elseif choice == 4 then printf("Terima kasih sudah menggunakan program ini.\n");
    else
        printf("Pilihan tidak valid. Coba lagi.\n\n");
        turunan_numerik;
    end
endfunction

// Fungsi untuk membuat tabel selisih Newton
function delta = compute_newton_diff_table(y)
    n = length(y);         // Jumlah data
    delta = zeros(n, n);   // Matriks kosong untuk tabel selisih
    delta(:, 1) = y';      // Kolom pertama adalah data y

    for j = 2:n
        for i = 1:(n - j + 1)
            delta(i, j) = delta(i + 1, j - 1) - delta(i, j - 1);
        end
    end
endfunction

//Fungsi Newton Mundur
function df = newton_backward_derivative(delta, u, h)
    n = size(delta, 1);      // Panjang tabel delta
    df = delta(n - 1, 2);    
    term = 1;                // Inisialisasi untuk suku tambahan

    for i = 2:(n - 1)
        term = term * (u + (i - 2));    // u(u+1)(u+2) ...
        df = df + (term * delta(n - i, i)) / factorial(i - 1) ; 
    end
    df = df / h;
endfunction


// Fungsi untuk Menghitung Turunan Numerik 
function hitung_turunan
    printf("HITUNG TURUNAN NUMERIK\n\n");    
    x = input("Masukkan nilai x:  ");
    y = input("Masukkan nilai y:  ");
    xg = input ("Masukkan nilai yang akan dicari: ");
    
    if length(x) ~= length(y) then 
        error("Jumlah elemen pada x dan y harus sama.");
    end

    h = x(2) - x(1);
    if sum(diff(x) ~= h)>0 then
        error("Nilai x harus memiliki jarak yang sama untuk menggunakan metode ini.");
    end
    
    if xg < x(1) || xg > x($) then 
        error("Nilai xg harus berada dalam rentang nilai x.");
    end
    
    printf("Tabel selisih Newton adalah sebagai berikut: \n");
    delta = compute_newton_diff_table(y);
    disp(delta);
    
    u = (xg - x($)) / h;  // u untuk Newton Mundur
    df = newton_backward_derivative(delta, u, h);
        printf("Turunan dengan metode Selisih Mundur adalah: %f\n", df);
       
    printf("\n1. Kembali ke Menu Utama\n");
    printf("2. Keluar Program\n\n");
    choice = input("Pilih Menu: ");
    if choice == 1 then turunan_numerik;
    elseif choice == 2 then 
        printf("Terima kasih sudah menggunakan program ini.\n");
    else 
        printf("Pilihan tidak valid.\n");
    end
endfunction

 
// Fungsi Panduan Penggunaan Program
function panduan_program
    printf("PANDUAN PENGGUNAAN PROGRAM\n\n");
    printf("- Pilih opsi di menu utama dengan mengetik angka 1-4.\n");
    printf("- Pada opsi 1 (Turunan Numerik):\n");
    printf("    Masukkan titik x,titik y, dan titik yang akan dicari.\n");
    printf("    Selanjutnya akan muncul tabel selisih newton.\n")
    printf("    Selanjutnya akan muncul hasil turunan dari x yang diinginkan.\n\n");
    printf("- Pada opsi 2 akan muncul panduan program.\n");
    printf("- Pada opsi 3 akan muncul tentang program.\n");
    printf("- Pada opsi 4 akan keluar program1.\n");
    printf("1. Kembali ke Menu Utama\n");
    choice = input("Pilih Menu: ");
    if choice == 1 then turunan_numerik;
    else 
        printf("Pilihan tidak valid. Kembali ke menu utama.\n");
        turunan_numerik;
    end
endfunction

// Fungsi Tentang Program
function tentang_program
    printf("TENTANG PROGRAM\n\n");
    printf("Program ini dirancang untuk menghitung turunan numerik dengan metode Newton Mundur.\n");
    printf(" Program dibuat oleh Kelompok 5 Metode Numerik Kelas C.\n");
    printf(" Anggota Kelompok 5:\n");
    printf(" a. Muhammad Febby Angga  (K1320047)\n");
    printf(" b. Anita Khoiru Nisa       (K1322015)\n");
    printf(" c. Devira Hutna Putri      (K1322030)\n");
    printf(" d. Faticha Ashfa Ashfia    (K1322039)\n");
    printf("1. Kembali ke Menu Utama\n");
    choice = input("Pilih Menu: ");
    if choice == 1 then turunan_numerik;
    else 
        printf("Pilihan tidak valid. Kembali ke menu utama.\n");
        turunan_numerik;
    end
endfunction

// Jalankan Program
turunan_numerik;
