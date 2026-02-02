import 'package:flutter/material.dart';
import '../widgets/expandable_section.dart';
import '../widgets/page_container.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ExpandableSection(
              title: 'How to Use the App',
              icon: Icons.explore_outlined,
              initiallyExpanded: true,
              child: const Text(
                'This application is designed as a practical reference for '
                'practitioners and students of acupuncture, focusing on Master '
                'Tung’s extraordinary points.\n\n'
                'You can browse points or use search to find them by number, '
                'name, or clinical indications.\n\n'
                'Each point page is divided into expandable sections so you '
                'can focus only on the information you need.\n\n'
                'You can:\n'
                '• Add points to Favorites\n'
                '• Write personal clinical notes\n'
                '• View images in full-screen mode\n'
                '• Quickly locate points during study or practice',
              ),
            ),

            ExpandableSection(
              title: 'Johnson Indications (*)',
              icon: Icons.star_outline,
              child: const Text(
                'In the Johnson Indications section, conditions marked with an '
                'asterisk (*) represent primary indications.\n\n'
                'Items without an asterisk are considered secondary or '
                'supporting indications.\n\n'
                'This distinction helps prioritize point selection in clinical use.',
              ),
            ),

            ExpandableSection(
              title: 'Measurements: Cun & En',
              icon: Icons.straighten,
              child: const Text(
                'Cun (寸) is a proportional unit based on the patient’s body, '
                'not a fixed measurement.\n\n'
                'En refers to relational or regional spacing used in Tung’s '
                'system rather than absolute distances.\n\n'
                'Palpation and anatomical sensitivity are always more important '
                'than strict measurements.',
              ),
            ),

            ExpandableSection(
              title: 'Practical Tips',
              icon: Icons.lightbulb_outline,
              child: const Text(
                '• Palpation is essential when locating Tung points\n'
                '• Many points reveal tenderness or tissue change\n'
                '• Use Personal Notes to record reactions and outcomes\n'
                '• Combine points thoughtfully rather than mechanically',
              ),
            ),

          ],
        ),
      ),
    );
  }
}
