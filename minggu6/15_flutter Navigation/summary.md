Tugas		: Flutter Navigation

3 poin yang saya pelajari pada materi ini:
    1. Navigation ialah suatu fungsi untuk berpindah dari halaman satu ke halaman lain. Ada beberapa fungsi navigation dasar seperti Navigator.push() dan Navigator.pop().
    Terdapat perbedaan pada 2 navigator dasar push dan pop:
    Perbedaannya : saat melakukan push artinya menambahkan halaman baru kedalam tumpukan navigasi, sedangkan pop halaman yang sedang dibuka akan dihapus dari tumpukan, dan aplikasi akan kembali ke halaman sebelumnya. Dan pada umumnya pop diguanakn untuk kembali ke halaman awal.

    2. Navigation ini juga dapat digunakan saat splash screen aplikasi, dimana saat user sudah login kedalam aplikasi, tampilan setelah splash screen akan berubah atau akan dilanjutkan langsung ke halaman utama.

    3. Contoh code navigation push dan pop:
    Push:
    Navigator.removeUntil(
    context,
    ModalRoute.withName('/halamanUtama'),
    (route) => false, // Fungsi ini akan selalu menghapus halaman
    );

    Pop:
    Navigator.pop(context);