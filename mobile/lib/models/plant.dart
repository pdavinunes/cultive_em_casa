import '../utils/string_extension.dart';
class Plant {
  int id;
  String name;
  String popularName;
  String scientificName;
  String lightness;
  String wateringFrequency;
  String fertilizionFrequency;
  String pruningFrequency;
  DateTime nextWatering;
  DateTime nextFertilizion;
  DateTime nextPruning;
  String comments;
  String description;

  Plant({
    this.id,
    this.name,
    this.popularName,
    this.scientificName,
    this.lightness,
    this.wateringFrequency,
    this.fertilizionFrequency,
    this.pruningFrequency,
    this.nextWatering,
    this.nextFertilizion,
    this.nextPruning,
    this.comments,
    this.description,
  });

  factory Plant.fromMap(Map<String, dynamic> json) => Plant(
        id: json['id'],
        name: json['name'],
        popularName: json['popular_name'],
        scientificName: json['scientific_name'],
        lightness: _formatLightness(json['lightness']),
        wateringFrequency: json['watering_frequency'],
        fertilizionFrequency: json['fertilizion_frequency'],
        pruningFrequency: json['pruning_frequency'],
        nextWatering: DateTime.fromMillisecondsSinceEpoch(json['next_watering']),
        nextFertilizion: DateTime.fromMillisecondsSinceEpoch(json['next_fertilizon']),
        nextPruning: DateTime.fromMillisecondsSinceEpoch(json['next_pruning']),
        comments: json['comments'],
        description: json['description'],
      );

  static String _formatLightness(String lightness) {
    return lightness.replaceAll(RegExp(r'_'), ' ').toLowerCase().capitalize();
  }
}
