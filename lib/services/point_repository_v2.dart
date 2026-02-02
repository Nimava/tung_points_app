import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import '../models/point_v2.dart';

class PointRepositoryV2 {
  static const String _assetPath = 'assets/data/points_v2.json';

  /// Load all points from V2 database
  Future<List<PointV2>> loadPoints() async {
    try {
      final jsonString = await rootBundle.loadString(_assetPath);
      final dynamic decoded = json.decode(jsonString);

      if (decoded is! List) {
        throw FormatException('points_v2.json must contain a JSON array');
      }

      return decoded
          .map<PointV2>((e) => PointV2.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // In production apps, you may log this to Crashlytics
      throw Exception('Failed to load V2 points database: $e');
    }
  }

  /// Optional helper: load points sorted by number
  Future<List<PointV2>> loadPointsSorted() async {
    final points = await loadPoints();

    points.sort((a, b) => a.number.compareTo(b.number));
    return points;
  }
}
