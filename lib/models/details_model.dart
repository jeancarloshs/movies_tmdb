class DetailsModel {
  final String id;
  final String iso_639_1;
  final String iso_3166_1;
  final String name;
  final String keyYoutube;
  final String site;
  final int size;
  final String type;
  final bool official;
  final String publishedAt;

  DetailsModel({
    required this.id,
    required this.iso_639_1,
    required this.iso_3166_1,
    required this.name,
    required this.keyYoutube,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
  });

  factory DetailsModel.fromMap(Map<String, dynamic> map) {
    return DetailsModel(
      id: map['id'],
      iso_639_1: map['iso_639_1'],
      iso_3166_1: map['iso_3166_1'],
      name: map['name'],
      keyYoutube: map['key'],
      site: map['site'],
      size: map['size'],
      type: map['type'],
      official: map['official'],
      publishedAt: map['published_at'],
    );
  }
}
