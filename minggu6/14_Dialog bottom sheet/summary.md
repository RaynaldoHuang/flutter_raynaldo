Tugas		: Dialog Bottom Sheets

3 poin yang saya pelajari pada materi ini:
    1. Untuk menginformasikan pengguna tentang situasi tertentu bisa menggunakan AlertDialog. AlertDialog ini akan menampilkan pesan atau pemberitahuan kepada pengguna, bentuknya biasanya muncul sebagai jendela pop-up atau dialog yang menyoroti pesan penting. 

    2. Contoh code AlertDialog seperti berikut:
    onPressed: () {
                showDialog(
                context: context,
                builder: (BuildContext context) {
                    return AlertDialog(
                    title: Text('Contoh Alert Dialog'),
                    content: Text('Ini adalah bentuk alert dialog.'),
                    actions: <Widget>[
                        TextButton(
                        child: Text('OK'),
                        onPressed: () {
                            Navigator.of(context).pop();
                        },
                        ),
                    ],
                    );
                },
                );
            },

    3. Bottom sheet seperti dialog tetapi muncul pop up dari bawah layar aplikasi. Bottom sheet sendiri biasanya dapat ditemukan atau digunakan untuk menampilkan opsi tambahan, seperti rincian dari sebuah produk. Untuk menggunakannya, dengan menggunakan fungsi showModalBottomSheet:
    ElevatedButton(
    onPressed: () {
        showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
            return Container(
            height: 200.0, // Sesuaikan tinggi sesuai kebutuhan Anda
            color: Colors.blue,
            child: Center(
                child: Text('This is a Modal Bottom Sheet'),
            ),
            );
        },
        );
    },
    child: Text('Show Modal Bottom Sheet'),
    )