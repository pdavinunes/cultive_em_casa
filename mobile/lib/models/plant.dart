import '../utils/string_extension.dart';
class Plant {
  int id;
  int plantId;
  String name;
  String imageSrc;
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
  String wateringFrequencyHuman;
  String wateringFrequencyHumanShort;

  Plant({
    this.id,
    this.plantId,
    this.imageSrc,
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
    this.wateringFrequencyHuman,
    this.wateringFrequencyHumanShort
  });

  factory Plant.fromMap(Map<String, dynamic> json) => Plant(
        id: json['id'],
        plantId: json['pid'],
        name: json['name'],
        imageSrc: _formatImage(json['imageUrl']),
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
        wateringFrequencyHuman: _wateringFrequencyHuman(json['watering_frequency']),
        wateringFrequencyHumanShort: _wateringFrequencyHumanShort(json['watering_frequency']),
      );

  static String _formatLightness(String lightness) {
    return lightness.replaceAll(RegExp(r'_'), ' ').toLowerCase().capitalize();
  }
  
  static String _formatImage(String imageUrl) {
    return imageUrl.replaceAll(RegExp(r'http://localhost:3333/'), ' ').trim();
  }

  static String _wateringFrequencyHumanShort(String wateringFrequency) {
    final duration = Duration(milliseconds: int.parse(wateringFrequency));
    
    if (duration.inDays == 1)
      return '1 dia';
    
    return '${duration.inDays} dias';
  }
  
  static String _wateringFrequencyHuman(String wateringFrequency) {
    final duration = Duration(milliseconds: int.parse(wateringFrequency));
    
    if (duration.inDays == 1) {
        return 'Todo dia';
    } else if (1 < duration.inDays && duration.inDays < 7) {
        return 'A cada ${duration.inDays} dias';
    } else if (duration.inDays == 7) {
        return 'Semanalmente';
    } else {
        return 'Algumas vezes ao mês';
    }
  }
}
