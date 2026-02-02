class PointV2 {
  final String number;
  final String name;
  final String location;

  final List<String> primaryIndications;
  final List<String> secondaryIndications;
  final List<String> johnsonIndications;

  final String techniques;
  final String comments;
  final String combinations;

  final String meridian;
  final String reactionAreas;

  final List<String> images;

  PointV2({
    required this.number,
    required this.name,
    required this.location,
    required this.primaryIndications,
    required this.secondaryIndications,
    required this.johnsonIndications,
    required this.techniques,
    required this.comments,
    required this.combinations,
    required this.meridian,
    required this.reactionAreas,
    required this.images,
  });

  /// 🔍 Searchable text (USED BY SEARCH ONLY)
  String get searchableText {
    return [
      number,
      name,
      primaryIndications.join(' '),
      secondaryIndications.join(' '),
      johnsonIndications.join(' '),
    ].join(' ').toLowerCase();
  }

  /// ---------- JSON FACTORY ----------
  factory PointV2.fromJson(Map<String, dynamic> json) {
    return PointV2(
      number: _readString(json['number']),
      name: _readString(json['name']),
      location: _readString(json['location']),

      primaryIndications: _readStringList(json['primary_indications']),
      secondaryIndications: _readStringList(json['secondary_indications']),
      johnsonIndications: _readStringList(json['johnson_indications']),

      techniques: _readString(json['techniques']),
      comments: _readString(json['comments']),
      combinations: _readString(json['combinations']),

      meridian: _readString(json['meridian']),
      reactionAreas: _readString(json['reaction_areas']),

      images: _readStringList(json['images']),
    );
  }

  /// ---------- HELPERS ----------
  static String _readString(dynamic value) {
    if (value == null) return '';
    return value.toString().trim();
  }

  static List<String> _readStringList(dynamic value) {
    if (value == null) return [];

    if (value is List) {
      return value
          .map((e) => e.toString().trim())
          .where((e) => e.isNotEmpty)
          .toList();
    }

    if (value is String && value.trim().isNotEmpty) {
      return [value.trim()];
    }

    return [];
  }
}
