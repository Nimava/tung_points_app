class TungPoint {
  final String name;
  final String location;
  final String primaryIndications;
  final String secondaryIndications;
  final String techniques;
  final String url;
  final List<String> images;

  TungPoint({
    required this.name,
    required this.location,
    required this.primaryIndications,
    required this.secondaryIndications,
    required this.techniques,
    required this.url,
    required this.images,
  });

  factory TungPoint.fromJson(Map<String, dynamic> json) {
    return TungPoint(
      name: json['name'] ?? '',
      location: json['location'] ?? '',
      primaryIndications: json['primary_indications'] ?? '',
      secondaryIndications: json['secondary_indications'] ?? '',
      techniques: json['techniques'] ?? '',
      url: json['url'] ?? '',
      images: List<String>.from(json['images'] ?? []),
    );
  }
}
