3 poin yang saya pelajari pada materi ini:
1.Pada Rest API bagian tampilan dengan proses bisnis berkirim data melalui HTTP Request.
2.Proses pengiriman data seperti berikut:
 Client mengirimkan data melalui proses Get,Post,Put,Delete dikirim melalui Rest API dan kemudian di teruskan ke server, dan di dalam server diolah lalu di kirim dalam bentuk JSON melalui Rest API kembali dan client menerima data tadi dalam bentuk JSON.
3.Proses Serialisasi JSON:
Mengubah data Map/List menjadi bentuk JSON dengan menggunakan fungsi jsonEncode, yang diimport dari dart:convert.

Sedangkan proses Deserialisasi JSON ialah mengubah data JSON ke bentuk struktur data Map/List dengan menggunakan Fungsi jsonDecode dari package dart:convert.
