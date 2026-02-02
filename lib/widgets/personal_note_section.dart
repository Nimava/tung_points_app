import 'package:flutter/material.dart';
import '../services/personal_notes_service.dart';
import 'expandable_section.dart';

class PersonalNoteSection extends StatefulWidget {
  final String pointId;

  const PersonalNoteSection({
    super.key,
    required this.pointId,
  });

  @override
  State<PersonalNoteSection> createState() => _PersonalNoteSectionState();
}

class _PersonalNoteSectionState extends State<PersonalNoteSection> {
  final TextEditingController _controller = TextEditingController();
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _loadNote();
  }

  Future<void> _loadNote() async {
    final note = await PersonalNotesService.getNote(widget.pointId);
    _controller.text = note ?? '';
    setState(() => _loaded = true);
  }

  Future<void> _save() async {
    await PersonalNotesService.saveNote(
      widget.pointId,
      _controller.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) {
      return const SizedBox.shrink();
    }

    return ExpandableSection(
      title: 'Personal Clinical Notes',
      initiallyExpanded: _controller.text.isNotEmpty,
      child: TextField(
        controller: _controller,
        maxLines: null,
        minLines: 4,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        onChanged: (_) => _save(),
        decoration: const InputDecoration(
          hintText:
              'Add your clinical observations, reactions, reminders, or usage tips...',
          border: OutlineInputBorder(),
          isDense: true,
        ),
      ),
    );
  }
}
