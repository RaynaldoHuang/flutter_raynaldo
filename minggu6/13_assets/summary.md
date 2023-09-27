Tugas		: Assets

3 poin yang saya pelajari pada materi ini:
    1. Asset merupakan suatu file yang di bundled dan di deployed bersamaan dengan aplikasi. Artinya berkas-berkas yang terdapat menjadi bagian dari asset akan menjadi bagian integral dari aplikasi dan akan tersedia di saat aplikasi tersebut diinstal dan dijalankan pada perangkat pengguna. Asset sendiri merujuk pada berkas-berkas seperti gambar, font, atau file lain yang diperlukan pada aplikasi.

    2. Untuk memasukkan berkas-berkas yang diperlukan, masukkan kedalam pubspec.yaml. Cara memasukkannya:
    assets:
    - assets/background.jpg

    apabila ingin menambahkan keseluruhan file, misal: ingin menambahkan semua images caranya:

    assets:
    - assets/images/

    3. Pada assets juga bisa menambahkan packages yang berasal dari internet, seperti google font. Untuk menambahkan packages font google, inisialisasikan ke pubspec.yaml atau dapat di import dengan ketikan:
    import ‘package:google_fonts/google_fonts.dart;