import '../models/point_v2.dart';

class SearchServiceV2 {
  static List<PointV2> search(
    List<PointV2> points,
    String query,
  ) {
    final q = query.trim().toLowerCase();

    if (q.isEmpty) return points;

    final results = <_ScoredPoint>[];

    for (final point in points) {
      final score = _scorePoint(point, q);
      if (score > 0) {
        results.add(_ScoredPoint(point, score));
      }
    }

    results.sort((a, b) => b.score.compareTo(a.score));

    return results.map((e) => e.point).toList();
  }

  // ---------------------------------------
  // Scoring logic (simple but powerful)
  // ---------------------------------------
  static int _scorePoint(PointV2 p, String q) {
    int score = 0;

    if (p.number.toLowerCase().contains(q)) score += 5;
    if (p.name.toLowerCase().contains(q)) score += 4;

    final primaryText =
        p.primaryIndications.join(' ').toLowerCase();
    final secondaryText =
        p.secondaryIndications.join(' ').toLowerCase();
    final johnsonText =
        p.johnsonIndications.join(' ').toLowerCase();

    if (primaryText.contains(q)) score += 3;
    if (secondaryText.contains(q)) score += 2;
    if (johnsonText.contains(q)) score += 1;

    return score;
  }

}

class _ScoredPoint {
  final PointV2 point;
  final int score;

  _ScoredPoint(this.point, this.score);
}
