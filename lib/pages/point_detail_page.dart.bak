import 'package:flutter/material.dart';
import '../models/point.dart';

class PointDetailPage extends StatelessWidget {
  final TungPoint point;
  const PointDetailPage({Key? key, required this.point}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(point.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Location:", style: Theme.of(context).textTheme.titleMedium),
            Text(point.location),
            const SizedBox(height: 10),
            Text("Primary Indications:", style: Theme.of(context).textTheme.titleMedium),
            Text(point.primaryIndications),
            const SizedBox(height: 10),
            if (point.secondaryIndications.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Secondary Indications:", style: Theme.of(context).textTheme.titleMedium),
                  Text(point.secondaryIndications),
                  const SizedBox(height: 10),
                ],
              ),
            Text("Techniques:", style: Theme.of(context).textTheme.titleMedium),
            Text(point.techniques),
            const SizedBox(height: 20),

            // --- Images section ---
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: point.images.map((img) {
                // Normalize Windows backslashes
                var cleanPath = img.replaceAll('\\', '/');

                // Decode %20 and other encodings
                cleanPath = Uri.decodeComponent(cleanPath);

                // Skip deleted or irrelevant images
                if (cleanPath.contains('img_goldpass') || cleanPath.contains('ear_anatomy')) {
                  return const SizedBox.shrink();
                }

                // Prepend the asset folder
                final assetPath = 'assets/$cleanPath';
                debugPrint('Loading image: $assetPath');

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FullImagePage(imagePath: assetPath),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      assetPath,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 100,
                          height: 100,
                          color: Colors.grey[300],
                          child: const Icon(Icons.image_not_supported),
                        );
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

// --- New page for viewing full-size image ---
class FullImagePage extends StatelessWidget {
  final String imagePath;
  const FullImagePage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: InteractiveViewer(
          panEnabled: true,
          minScale: 0.5,
          maxScale: 4,
          child: Image.asset(imagePath, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
