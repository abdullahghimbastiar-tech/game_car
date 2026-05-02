# Racing Game - Flutter with Flame Engine

Sebuah game racing "Endless Racer" sederhana yang dibuat dengan **Flutter** dan **Flame Engine** 2D. Pemain mengontrol mobil untuk menghindari rintangan yang datang dari atas layar.

## 🎮 Fitur Game

- **Kontrol Sederhana**: Tap atau gunakan keyboard arrow untuk bergerak ke kiri/kanan
- **Spawn Obstacle Otomatis**: Rintangan muncul secara acak dari atas layar
- **Collision Detection**: Sistem deteksi tabrakan real-time dengan Flame's built-in physics
- **Score System**: Skor meningkat seiring waktu bermain
- **Game Over & Restart**: Logika game over ketika terjadi tabrakan
- **Parallax Road Effect**: Efek jalan yang bergerak dengan lane markings

## 📁 Struktur Proyek

```
lib/
├── main.dart                 # Entry point aplikasi
├── racing_game.dart          # Main game logic dan orchestration
└── components/
    ├── player.dart           # Komponen mobil pemain
    ├── obstacle.dart         # Komponen mobil rintangan
    ├── road.dart             # Komponen jalan dengan parallax effect
    └── score_text.dart       # Komponen tampilan score
```

## 🚀 Cara Menjalankan

### Prerequisites

- Flutter SDK terinstall (>= 3.0.0)
- Dart SDK (included dengan Flutter)

### Install Dependencies

```bash
flutter pub get
```

### Run Game

```bash
flutter run
```

### Run di Emulator/Device Spesifik

```bash
flutter run -d <device_id>
```

Untuk melihat device yang tersedia:

```bash
flutter devices
```

## 🕹️ Cara Bermain

- **Tap Screen**: Tap di sisi kiri untuk bergerak ke kiri, tap di sisi kanan untuk bergerak ke kanan
- **Keyboard (Desktop/Web)**: Gunakan `Arrow Left` dan `Arrow Right` untuk bergerak
- **Hindari Rintangan**: Mobil kuning yang datang dari atas
- **Maintain Score**: Semakin lama bertahan, semakin besar score
- **Game Over**: Saat terjadi tabrakan, tap untuk restart game

## 📝 Komponen Utama

### Player

Mobil merah yang dikendalikan pemain. Memiliki collision detection dan smooth movement.

### Obstacle

Mobil kuning yang muncul sebagai rintangan. Bergerak dari atas ke bawah layar.

### Road

Latar belakang jalan dengan lane markings untuk efek parallax/movement.

### Game Logic

- Automatic obstacle spawning setiap 2 detik
- Score calculation berbasis waktu bermain
- Collision handling dengan game over state
- Reset functionality untuk restart game

## 🔧 Pengembangan Lebih Lanjut

### Tambahkan Sprite/Assets

1. Buat folder `assets/images/` di root proyek
2. Uncomment bagian `assets:` di `pubspec.yaml`
3. Load sprite di komponen:

```dart
sprite = await gameRef.loadSprite('car_player.png');
```

### Tambahkan Efek Suara

- Tambah dependency: `flame_audio: ^1.8.0`
- Load dan play sound di game events

### Tambahkan Animasi

- Gunakan `SpriteAnimationComponent` untuk animated sprites
- Implement state management dengan `AnimationController`

### Improve Difficulty

- Tingkatkan `spawnInterval` gradually seiring waktu
- Increase obstacle `speed` per level

## 📦 Dependencies

- **flutter**: Framework UI
- **flame**: 2D Game Engine untuk Flutter
- **cupertino_icons**: Icon assets

## 📄 License

MIT License - Feel free to use dan modify untuk keperluan Anda.

---

**Happy Coding! 🎮✨**
"# game_" 
