import 'package:flutter/material.dart';

class BodyPage extends StatelessWidget {
  const BodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Body View')),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text('This page will show the human body with clickable Tung points.'),
        ),
      ),
    );
  }
}
