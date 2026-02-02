import 'package:flutter/material.dart';
import '../widgets/page_container.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [

            Text(
              'Developers',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),

            Text('Nima Vaziri'),
            Text('Email: n.vaziri@gmail.com'),

            SizedBox(height: 16),

            Text('Reza Beigi'),
            Text('Website: yogapendar.com'),

            SizedBox(height: 24),

            Text(
              'We welcome feedback and suggestions that improve the '
              'educational quality of this app.',
            ),
          ],
        ),
      ),
    );
  }
}
