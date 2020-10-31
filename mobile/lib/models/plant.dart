class Plant {
  int id;
  String popularName;
  String scientificName;
  String lightness;
  String wateringFrequency;
  String fertilizionFrequency;
  String pruningFrequency;
  String comments;
  String description;

  Plant({
    this.id,
    this.popularName,
    this.scientificName,
    this.lightness,
    this.wateringFrequency,
    this.fertilizionFrequency,
    this.pruningFrequency,
    this.comments,
    this.description,
  });

  factory Plant.fromMap(Map<String, dynamic> json) => Plant(
        id: json['id'],
        popularName: json['popular_name'],
        scientificName: json['scientific_name'],
        lightness: json['lightness'],
        wateringFrequency: json['watering_frequency'],
        fertilizionFrequency: json['fertilizion_frequency'],
        pruningFrequency: json['pruning_frequency'],
        comments: json['comments'],
        description: json['description'],
      );
}
