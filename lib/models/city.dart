
class City {
  final int? id;
  final String name;
  final Map<String, String>? local_names;
  final double lat;
  final double lon;
  final String country;
  final String? state;

  City({
    this.id,
    required this.name,
    this.local_names,
    required this.lat,
    required this.lon,
    required this.country,
    this.state
  });
}
