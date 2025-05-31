
# 🚍 QBCore Bus Job Script By Rifaldi

Sebuah script pekerjaan bus untuk framework **QBCore** di FiveM. Pemain dapat memilih salah satu dari tiga rute bus, menjemput penumpang di setiap titik, dan mengembalikan bus untuk menerima hadiah.

---

## ✨ Fitur

- 🎯 3 Rute Bus: Kota, Sandy Shores, dan Paleto Bay
- 🚌 Spawn bus otomatis sesuai rute yang dipilih
- 🗺️ Blip tujuan otomatis di setiap pemberhentian
- 🔄 Interaksi di setiap halte dan titik akhir rute
- 💰 Hadiah uang tunai dan item setelah menyelesaikan rute
- 📦 Integrasi dengan `ox_lib` dan `ox_inventory`

---

## 🧾 Requirements

- [qb-core](https://github.com/qbcore-framework/qb-core)
- [ox_lib](https://overextended.dev)
- [ox_inventory](https://overextended.dev)
- [oxmysql](https://github.com/overextended/oxmysql)

---

## 📁 Instalasi

1. **Download ** repo ini ke dalam folder `resources/[local]`:

2. **Tambahkan ke `server.cfg`:**

```cfg
ensure qb-busjob
```

3. **Pastikan dependencies sudah terpasang:**

- `ox_lib` harus di-*start* sebelum script ini.
- Tambahkan ke `shared.lua` kamu jika perlu:
  ```lua
  exports('GetCoreObject', function()
      return QBCore
  end)
  ```

---

## 🎮 Cara Menggunakan

- Pergi ke titik koordinat pemilihan rute:  
  📍 `436.5467, -646.0215, 28.7423`

- Tekan `E` untuk membuka menu pilihan rute
- Pilih salah satu rute (Kota / Sandy / Paleto)
- Bus akan muncul dan kamu akan langsung masuk ke dalamnya
- Ikuti marker dan layani penumpang di setiap titik
- Kembalikan bus di titik akhir untuk menerima hadiah

---

## ⚙️ Konfigurasi

Semua konfigurasi ada di file [`config.lua`](./config.lua), termasuk:

- Titik pemilihan rute
- Titik spawn bus
- Data rute & pemberhentian
- Hadiah per rute

Contoh:

```lua
Config.Rewards = {
    city = { money = 30000, item = { name = 'bus_ticket', count = 1 } },
    sandy = { money = 45000, item = { name = 'bus_ticket', count = 2 } },
    paleto = { money = 55000, item = { name = 'bus_ticket', count = 3 } }
}
```

---

## 🧑‍💻 Credits

**Author**: Rifaldi  
Terinspirasi oleh sistem pekerjaan transportasi umum dalam roleplay.

---

## 📜 Lisensi

Script ini bebas digunakan dan dimodifikasi untuk server pribadi. Tidak untuk dijual kembali.
