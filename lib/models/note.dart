class Note {
  final String title;
  final String content;
  final String category; // Penting / Pribadi / Kerja / Kuliah
  final int colorIndex; // index ke AppColors.noteColors
  final String priority; // Rendah / Sedang / Tinggi
  final DateTime createdAt;

  const Note({
    required this.title,
    required this.content,
    required this.category,
    required this.colorIndex,
    required this.priority,
    required this.createdAt,
  });
}

const _bulan = [
  "Januari",
  "Februari",
  "Maret",
  "April",
  "Mei",
  "Juni",
  "Juli",
  "Agustus",
  "September",
  "Oktober",
  "November",
  "Desember",
];

String formatDate(DateTime d) => "${d.day} ${_bulan[d.month - 1]} ${d.year}";

String formatTime(DateTime d) =>
    "${d.hour.toString().padLeft(2, "0")}.${d.minute.toString().padLeft(2, "0")}";

/// Data contoh (dummy) untuk tampilan Beranda.
final List<Note> dummyNotes = [
  Note(
    title: "Ide Aplikasi Mobile",
    content: "Aplikasi Mobile Pecora. Aplikasi ini dirancang untuk memudahkan peternak dalam mengelola keseluruhan data domba.",
    category: "Penting",
    colorIndex: 0,
    priority: "Tinggi",
    createdAt: DateTime(2026, 10, 29, 9, 30),
  ),
  Note(
    title: "Belanja Mingguan",
    content: "Minggu ini beli telur, beras, sayur bayam, tahu, tempe, dan sabun cuci piring.",
    category: "Pribadi",
    colorIndex: 1,
    priority: "Rendah",
    createdAt: DateTime(2026, 10, 28, 17, 10),
  ),
  Note(
    title: "Catatan Kuliah",
    content: "Belajar Flutter, Dart, dan Android Studio. Inovasi desain mockup UI/UX aplikasi.",
    category: "Kuliah",
    colorIndex: 3,
    priority: "Sedang",
    createdAt: DateTime(2026, 10, 27, 13, 0),
  ),
  Note(
    title: "Rapat Tim PBL",
    content: "Bahas pembagian tugas sprint berikutnya dan jadwal MANPRO minggu depan.",
    category: "Kerja",
    colorIndex: 4,
    priority: "Sedang",
    createdAt: DateTime(2026, 10, 26, 10, 0),
  ),
  Note(
    title: "Jurnal Bersyukur",
    content: "Alhamdulillah hari ini tugas selesai lebih cepat dari jadwal yang telah di rencanakan.",
    category: "Pribadi",
    colorIndex: 2,
    priority: "Rendah",
    createdAt: DateTime(2026, 10, 25, 21, 15),
  ),
  Note(
    title: "Deadline Tugas",
    content:
        "Kumpulkan source code Flutter dan Laprak Mobile sebelum akhir pekan.",
    category: "Penting",
    colorIndex: 0,
    priority: "Tinggi",
    createdAt: DateTime(2026, 10, 24, 8, 0),
  ),
];
