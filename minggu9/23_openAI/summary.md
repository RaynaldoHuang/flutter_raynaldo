3 poin yang saya pelajari pada materi ini:
1.Untuk mengintegrasikan sebuah OpenAI pada sebuah project tentunya kita perlu sebuah library yang dapat digunakan untuk memanfaatkan teknologi Ai contohnya yang disediakan oleh OpenAI.
2.Alasan penggunaan OpenAI sendiri dikarenakan dapat digunakan di berbagai perangkat, gratis, mudah di aplikasikan ke dalam project dan jumlah parameternya yang fantastis yaitu 175 Miliar.
3.Untuk penggunaan OpenAI sendiri harus menginstal HTTP terlebih dahulu ke dalam dependencies pubspec.yaml, dan mengirimkan sebuah permintaan ke API Open AI. contoh:
String apiKey = 'API_KEY PRIBADI';
String endpoint = 'https://api.openai.com/v1/engines/davinci/completions';
