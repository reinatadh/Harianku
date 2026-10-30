import "package:flutter/material.dart";

import "../models/note.dart";
import "../theme.dart";
import "../widgets/note_card.dart";
import "add_note_screen.dart";
import "detail_screen.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _filters = ["Semua", "Penting", "Pribadi", "Kerja", "Kuliah"];

  final List<Note> _notes = List.of(dummyNotes);
  String _filter = "Semua";

  Future<void> _openAdd() async {
    final result = await Navigator.of(context)
        .push<Note>(MaterialPageRoute(builder: (_) => const AddNoteScreen()));
    if (result != null) setState(() => _notes.insert(0, result));
  }

  @override
  Widget build(BuildContext context) {
    final shown = _filter == "Semua"
        ? _notes
        : _notes.where((n) => n.category == _filter).toList();

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openAdd,
        backgroundColor: AppColors.accent,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.edit_rounded),
        label: const Text("Catatan Baru"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Halo, Reinata! ✍️",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Apa yang ingin kamu tulis hari ini?",
                          style: TextStyle(color: AppColors.muted),
                        ),
                      ],
                    ),
                  ),
                  const CircleAvatar(
                    radius: 22,
                    backgroundColor: AppColors.primary,
                    child: Icon(Icons.person_rounded, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Cari catatan...",
                  prefixIcon: Icon(Icons.search_rounded),
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 38,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _filters.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, i) {
                    final selected = _filters[i] == _filter;
                    return ChoiceChip(
                      label: Text(_filters[i]),
                      selected: selected,
                      showCheckmark: false,
                      selectedColor: AppColors.primary,
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(
                        color: selected ? Colors.white : AppColors.ink,
                        fontWeight: FontWeight.w600,
                      ),
                      onSelected: (_) => setState(() => _filter = _filters[i]),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: shown.isEmpty
                    ? const Center(
                        child: Text(
                          "Belum ada catatan di kategori ini",
                          style: TextStyle(color: AppColors.muted),
                        ),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.only(bottom: 90),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              childAspectRatio: 0.8,
                            ),
                        itemCount: shown.length,
                        itemBuilder: (context, i) => NoteCard(
                          note: shown[i],
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => DetailScreen(note: shown[i]),
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
