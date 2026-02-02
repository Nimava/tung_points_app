import 'package:flutter/material.dart';
import '../widgets/page_container.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'About Tung’s Points',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tung’s acupuncture is a unique lineage system known for its '
              'efficiency, distal treatment strategies, and strong clinical effects.',
            ),

            const SizedBox(height: 20),

            Image.asset('assets/master_tung.jpg'),
            const SizedBox(height: 8),
            const Text(
              'Master Tung Ching-Chang (1916–1975) preserved and transmitted '
              'a family acupuncture system containing hundreds of unique points.',
            ),

            const SizedBox(height: 20),

            Image.asset('assets/susan_johnson.jpg'),
            const SizedBox(height: 8),
            const Text(
              'Susan Johnson, L.Ac., played a major role in documenting and '
              'teaching Tung’s acupuncture in the West.\n\n'
              'Reference:\n'
              'Master Tung’s Magic Points – A Definitive Clinical Guide\n'
              'By Susan Johnson, L.Ac. & Eric Renaud, M.Ac.\n'
              '© 2019 Susan Johnson\n'
              'ISBN 978-0-578-56525-5',
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red),
              ),
              child: const Text(
                'Educational Use Only.\n\n'
                'This app is not a substitute for professional medical training. '
                'The developers are not responsible for clinical use or outcomes.',
                style: TextStyle(color: Colors.red),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Sources:\n'
              '• https://www.mastertungacupuncture.org/acupuncture/tung/points/listall',
            ),
          ],
        ),
      ),
    );
  }
}
