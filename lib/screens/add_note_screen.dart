import "package:flutter/material.dart";
import "../models/note.dart";
import "../theme.dart";

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  static const _categories = ["Penting", "Pribadi", "Kerja", "Kuliah"];

  final _titleCtrl = TextEditingController();
  final _contentCtrl = TextEditingController();
  String _category = "Pribadi";
  int _colorIndex = 0;
  String _priority = "Sedang";

  @override
  void dispose() {
    _titleCtrl.dispose();
    _contentCtrl.dispose();
    super.dispose();
  }

  void _save() {
    if (_titleCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Judul catatan tidak boleh kosong")),
      );
      return;
    }
    Navigator.of(context).pop(Note(
      title: _titleCtrl.text.trim(),
      content: _contentCtrl.text.trim(),
      category: _category,
      colorIndex: _colorIndex,
      priority: _priority,
      createdAt: DateTime.now(),
    ));
  }

  Widget _label(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 8, top: 18),
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.w700)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Catatan Baru")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _label("Judul"),
            TextField(
              controller: _titleCtrl,
              decoration: const InputDecoration(hintText: "Contoh: Ide proyek"),
            ),
            _label("Isi Catatan"),
            TextField(
              controller: _contentCtrl,
              maxLines: 6,
              decoration: const InputDecoration(hintText: "Tulis ceritamu di sini..."),
            ),
            _label("Kategori"),
            Wrap(
              spacing: 8,
              children: _categories.map((c) {
                final selected = c == _category;
                return ChoiceChip(
                  label: Text(c),
                  selected: selected,
                  showCheckmark: false,
                  selectedColor: AppColors.primary,
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                      color: selected ? Colors.white : AppColors.ink,
                      fontWeight: FontWeight.w600),
                  onSelected: (_) => setState(() => _category = c),
                );
              }).toList(),
            ),
            _label("Warna Catatan"),
            Row(
              children: List.generate(AppColors.noteColors.length, (i) {
                final selected = i == _colorIndex;
                return GestureDetector(
                  onTap: () => setState(() => _colorIndex = i),
                  child: Container(
                    width: 44,
                    height: 44,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: AppColors.noteColors[i],
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: selected ? AppColors.primary : Colors.transparent,
                        width: 2.5,
                      ),
                    ),
                    child: selected
                        ? const Icon(Icons.check_rounded, color: AppColors.primary)
                        : null,
                  ),
                );
              }),
            ),
            _label("Prioritas"),
            SizedBox(
              width: double.infinity,
              child: SegmentedButton<String>(
                showSelectedIcon: false,
                segments: const [
                  ButtonSegment(value: "Rendah", label: Text("Rendah")),
                  ButtonSegment(value: "Sedang", label: Text("Sedang")),
                  ButtonSegment(value: "Tinggi", label: Text("Tinggi")),
                ],
                selected: {_priority},
                onSelectionChanged: (s) => setState(() => _priority = s.first),
              ),
            ),
            const SizedBox(height: 28),
            ElevatedButton(onPressed: _save, child: const Text("Simpan Catatan")),
          ],
        ),
      ),
    );
  }
}
