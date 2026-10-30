import "package:flutter/material.dart";
import "../models/note.dart";
import "../theme.dart";

class DetailScreen extends StatelessWidget {
  final Note note;

  const DetailScreen({super.key, required this.note});

  Color get _priorityColor {
    switch (note.priority) {
      case "Tinggi":
        return const Color(0xFFD64545);
      case "Sedang":
        return const Color(0xFFE8A33D);
      default:
        return const Color(0xFF4C9A6A);
    }
  }

  void _info(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Catatan"),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () => _info(context, "Edit hanya tampilan UI"),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline_rounded, color: Color(0xFFD64545)),
            onPressed: () => _info(context, "Hapus hanya tampilan UI"),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.noteColors[note.colorIndex],
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _pill(note.category, Colors.white.withAlpha(180), AppColors.ink),
                    const SizedBox(width: 8),
                    _pill("Prioritas ${note.priority}", _priorityColor, Colors.white),
                  ],
                ),
                const SizedBox(height: 16),
                Text(note.title,
                    style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.calendar_today_rounded,
                        size: 15, color: AppColors.muted),
                    const SizedBox(width: 6),
                    Text("${formatDate(note.createdAt)}  •  ${formatTime(note.createdAt)}",
                        style: const TextStyle(color: AppColors.muted)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(
              note.content.isEmpty ? "(Tidak ada isi catatan)" : note.content,
              style: const TextStyle(fontSize: 16, height: 1.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pill(String text, Color bg, Color fg) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
        child: Text(text,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: fg)),
      );
}
