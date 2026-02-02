import 'package:flutter/material.dart';

class HighlightText extends StatelessWidget {
  final String text;
  final String? query;

  const HighlightText({
    super.key,
    required this.text,
    this.query,
  });

  @override
  Widget build(BuildContext context) {
    if (query == null || query!.isEmpty) {
      return Text(text);
    }

    final lowerText = text.toLowerCase();
    final lowerQuery = query!.toLowerCase();

    if (!lowerText.contains(lowerQuery)) {
      return Text(text);
    }

    final spans = <TextSpan>[];
    int start = 0;

    while (true) {
      final index = lowerText.indexOf(lowerQuery, start);
      if (index < 0) {
        spans.add(TextSpan(text: text.substring(start)));
        break;
      }

      if (index > start) {
        spans.add(TextSpan(text: text.substring(start, index)));
      }

      spans.add(
        TextSpan(
          text: text.substring(index, index + query!.length),
          style: const TextStyle(
            backgroundColor: Color(0xFFFFF3B0),
            fontWeight: FontWeight.w600,
          ),
        ),
      );

      start = index + query!.length;
    }

    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyMedium,
        children: spans,
      ),
    );
  }
}
