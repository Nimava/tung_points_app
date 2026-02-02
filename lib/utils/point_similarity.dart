import '../models/point_v2.dart';

class PointSimilarity {
  static double score(PointV2 a, PointV2 b) {
    final aWords = _keywords(a);
    final bWords = _keywords(b);

    if (aWords.isEmpty || bWords.isEmpty) return 0;

    final intersection =
        aWords.intersection(bWords).length.toDouble();

    return intersection / aWords.length;
  }

  static Set<String> _keywords(PointV2 p) {
    return {
      ..._split(p.primaryIndications),
      ..._split(p.secondaryIndications),
      ..._split(p.johnsonIndications),
    };
  }

  static Set<String> _split(List<String> texts) {
    return texts
        .join(' ')
        .toLowerCase()
        .split(RegExp(r'[^a-z]+'))
        .where((w) => w.length > 3)
        .toSet();
  }
}
