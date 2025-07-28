
# 📱 Spam Detection Chat App

Aplikasi **Deteksi Pesan Spam Berbasis Android** yang dikembangkan menggunakan **Flutter**, memanfaatkan **model klasifikasi teks berbasis PyTorch** untuk mengidentifikasi pesan **spam** dalam konteks **percakapan chatting**. Proyek ini bertujuan untuk membantu pengguna menyaring pesan yang berpotensi berbahaya atau mengganggu secara otomatis.

---

## 🚀 Fitur Utama

* 💬 **Antarmuka Chatting**
  Simulasi percakapan antara pengguna dengan sistem atau chatbot.

* 🧠 **Deteksi Spam Otomatis**
  Menggunakan model machine learning berbasis PyTorch untuk mendeteksi spam secara real-time.

* 📊 **Klasifikasi Spam / Non-Spam**
  Pesan yang masuk akan langsung diklasifikasi sebagai **Spam** atau **Not Spam** berdasarkan prediksi model.

* 📱 **Optimasi Android**
  Aplikasi dibangun dengan Flutter dan sepenuhnya dioptimalkan untuk perangkat Android.

---

## 🛠 Teknologi yang Digunakan

| Teknologi           | Deskripsi                                                              |
| ------------------- | ---------------------------------------------------------------------- |
| **Flutter**         | Framework UI cross-platform                                            |
| **Dart**            | Bahasa pemrograman utama aplikasi                                      |
| **Provider / Bloc** | (Opsional) Untuk manajemen state                                       |
| **PyTorch**         | Framework machine learning untuk model                                 |
| **TorchScript**     | Untuk konversi model PyTorch ke format yang bisa dijalankan di Android |
| **Android SDK**     | Untuk menjalankan dan membangun aplikasi                               |

---

## 📦 Instalasi & Menjalankan Aplikasi

### 1. Clone Proyek

```bash
git clone https://github.com/username/spamdetectionapps.git
cd spamdetectionapps
```

### 2. Cek JDK & Flutter

```bash
java -version     # Pastikan menggunakan JDK 17
flutter doctor    # Cek apakah environment Flutter telah siap
```

### 3. Install Dependency

```bash
flutter pub get
```

### 4. Jalankan Aplikasi

```bash
flutter run
```

> ⚠️ Pastikan emulator Android aktif atau perangkat Android sudah terhubung.

---

## 🤖 Tentang Model Deteksi Spam

* Model dibuat menggunakan **PyTorch** dan dilatih dengan dataset pesan teks (SMS/chat).
* Setelah pelatihan, model dikonversi ke format **TorchScript** agar dapat dijalankan secara efisien di Android.
* Klasifikasi dilakukan antara dua label: **Spam** dan **Not Spam**.

---

## 🧪 Contoh Kasus Penggunaan

| Pesan Masuk                                       | Deteksi      |
| ------------------------------------------------- | ------------ |
| “Selamat! Anda memenangkan undian. Klik link ini” | **Spam**     |
| “Halo, kita ketemu jam berapa besok?”             | **Not Spam** |
| “Gratis kuota 50GB hanya hari ini. Ayo klaim!”    | **Spam**     |

---

## 🔗 Model Deep Learning (API)

Model deteksi spam ini dikembangkan menggunakan PyTorch dan tersedia di GitHub:

👉 [Model Deteksi Spam - GitHub Repository](https://github.com/muhammadzuama/modelDeteksiSpamSMS.git)

---
