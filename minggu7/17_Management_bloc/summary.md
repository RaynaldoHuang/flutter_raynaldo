Tugas		: Flutter State Management (BLoC)

3 poin yang saya pelajari pada materi ini:
    1. Dalam Flutter sendiri memiliki suatu sifat declarative yang dimana flutter membangun tampilan UI nya pada screen untuk mencerminkan keadaan state yang digunakan saat ini.

    2. Ephemeral State pada Flutter merujuk pada sebuah state yang hanya dapat bertahan sementara, dan biasanya hanya digunakan pada widget tertentu dan tidak perlu tindakan penyimpanan dalam state global atau persistent.

    3. BLoC bertujuan untuk memisahakn logika bisnis dari tampilan UI sehingga membuat code yang dirancang lebih terstruktur. Cara kerjanya sendiri:
    >> Menerima event sebagai input lalu dilakukan analisa dan dikelola didalam BLoC, kemudian outputnya berupa state.