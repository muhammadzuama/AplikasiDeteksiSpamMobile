---

# 📱 Spam Detection Chat App

Aplikasi **Deteksi Pesan Spam Berbasis Android** yang dikembangkan dengan **Flutter**, memanfaatkan **metode klasifikasi** berbasis teks untuk mengidentifikasi pesan **spam** dalam konteks **percakapan chatting**. Proyek ini ditujukan untuk membantu pengguna memfilter pesan yang berpotensi berbahaya atau mengganggu.

---

## 🚀 Fitur Utama

* 💬 **Antarmuka Chatting**: Simulasi percakapan pengguna dengan sistem atau chatbot.
* 🧠 **Deteksi Spam Otomatis**: Model machine learning mendeteksi pesan yang mengandung spam secara real-time.
* 📊 **Klasifikasi Spam / Non-Spam**: Pesan diklasifikasi dan ditandai berdasarkan hasil prediksi model.
* 📱 **Dukungan Android Penuh**: Dikembangkan dan dioptimalkan untuk platform Android.

---

## 🛠 Teknologi yang Digunakan

| Teknologi       | Deskripsi                             |
| --------------- | ------------------------------------- |
| Flutter         | Framework UI cross-platform           |
| Dart            | Bahasa pemrograman utama aplikasi     |
| Provider / Bloc | (Opsional) Untuk state management     |
| Android SDK     | Untuk menjalankan dan build aplikasi  |

---

## 📦 Instalasi & Menjalankan Aplikasi

### 1. Clone Proyek

```bash
git clone https://github.com/username/spamdetectionapps.git
cd spamdetectionapps
```

### 2. Pastikan JDK dan Flutter Sudah Siap

```bash
java -version  # Pastikan menggunakan JDK 17
flutter doctor # Periksa environment Flutter
```

### 3. Install Dependencies

```bash
flutter pub get
```

### 4. Jalankan Aplikasi

```bash
flutter run
```

> ⚠️ Pastikan emulator Android aktif atau perangkat terhubung.


---

## 🤖 Tentang Model Deteksi Spam

* Model didesain untuk klasifikasi pesan menjadi **Spam** atau **Not Spam**
* Dataset pelatihan menggunakan kumpulan data pesan SMS/chatting
* Dibangun menggunakan TensorFlow dan dikonversi ke format `.tflite` untuk efisiensi mobile

---

## 🧪 Contoh Kasus Penggunaan

| Pesan Masuk                                       | Deteksi  |
| ------------------------------------------------- | -------- |
| “Selamat! Anda memenangkan undian. Klik link ini” | Spam     |
| “Halo, kita ketemu jam berapa besok?”             | Not Spam |
| “Gratis kuota 50GB hanya hari ini. Ayo klaim!”    | Spam     |

---

