import 'package:flutter/material.dart';

import '../models/point_v2.dart';
import '../widgets/expandable_section.dart';
import '../widgets/image_gallery.dart';
import '../widgets/highlight_text.dart';
import '../widgets/personal_note_section.dart';
import '../services/favorites_service.dart';

class PointDetailV2 extends StatefulWidget {
  final PointV2 point;
  final String? searchQuery;

  const PointDetailV2({
    super.key,
    required this.point,
    this.searchQuery,
  });

  @override
  State<PointDetailV2> createState() => _PointDetailV2State();
}

class _PointDetailV2State extends State<PointDetailV2> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadFavorite();
  }

  Future<void> _loadFavorite() async {
    final fav = await FavoritesService.isFavorite(widget.point.number);
    if (!mounted) return;
    setState(() {
      isFavorite = fav;
    });
  }

  bool _matches(List<String> values) {
    final q = widget.searchQuery;
    if (q == null || q.isEmpty) return false;
    final query = q.toLowerCase();
    return values.any((v) => v.toLowerCase().contains(query));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final point = widget.point;

    return Scaffold(
      appBar: AppBar(
        title: Text(point.name),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: () async {
              await FavoritesService.toggle(widget.point.number);
              if (!mounted) return;
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// --- Point Number ---
            Text(
              point.number,
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 24),

            /// --- Location ---
            ExpandableSection(
              title: 'Location',
              child: HighlightText(
                text: point.location,
                query: widget.searchQuery,
              ),
            ),

            /// --- Primary Indications ---
            if (point.primaryIndications.isNotEmpty)
              ExpandableSection(
                title: 'Primary Indications',
                initiallyExpanded: _matches(point.primaryIndications),
                child: _buildList(point.primaryIndications),
              ),

            /// --- Secondary Indications ---
            if (point.secondaryIndications.isNotEmpty)
              ExpandableSection(
                title: 'Secondary Indications',
                initiallyExpanded: _matches(point.secondaryIndications),
                child: _buildList(point.secondaryIndications),
              ),

            /// --- Johnson Indications ---
            if (point.johnsonIndications.isNotEmpty)
              ExpandableSection(
                title: 'Johnson Indications',
                initiallyExpanded: _matches(point.johnsonIndications),
                child: _buildList(point.johnsonIndications),
              ),

            /// --- Needling & Techniques ---
            if (point.techniques.isNotEmpty)
              ExpandableSection(
                title: 'Needling & Techniques',
                child: HighlightText(
                  text: point.techniques,
                  query: widget.searchQuery,
                ),
              ),

            /// --- Comments & Cautions ---
            if (point.comments.isNotEmpty)
              ExpandableSection(
                title: 'Comments & Cautions',
                child: HighlightText(
                  text: point.comments,
                  query: widget.searchQuery,
                ),
              ),

            /// --- Point Combinations ---
            if (point.combinations.isNotEmpty)
              ExpandableSection(
                title: 'Point Combinations',
                child: HighlightText(
                  text: point.combinations,
                  query: widget.searchQuery,
                ),
              ),

            /// --- Meridian & Reaction Areas ---
            if (point.meridian.isNotEmpty || point.reactionAreas.isNotEmpty)
              ExpandableSection(
                title: 'Meridian & Reaction Areas',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (point.meridian.isNotEmpty)
                      Text(
                        'Meridian: ${point.meridian}',
                        style: theme.textTheme.bodyMedium,
                      ),
                    if (point.reactionAreas.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Reaction Areas: ${point.reactionAreas}',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                  ],
                ),
              ),

            /// --- Images ---
            if (point.images.isNotEmpty)
              ExpandableSection(
                title: 'Images',
                child: ImageGallery(images: point.images),
              ),

            /// --- Personal Notes ---
            PersonalNoteSection(pointId: widget.point.number),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('•  '),
              Expanded(
                child: HighlightText(
                  text: item,
                  query: widget.searchQuery,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
