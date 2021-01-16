import 'package:meta/meta.dart';

class PlantDetails {
  List<Fertilizer> fertilizers;
  List<Environment> environments;

  PlantDetails({
    @required this.fertilizers,
    @required this.environments,
  });

  factory PlantDetails.fromJson(Map<String, dynamic> json) {
    final fertilizers = <Fertilizer>[];
    final environtments = <Environment>[];

    json['fertilizers'].forEach((item) {
      fertilizers.add(Fertilizer(item['name']));
    });
    json['environments'].forEach((item) {
      environtments.add(Environment(item['name']));
    });
    return PlantDetails(
      fertilizers: fertilizers,
      environments: environtments,
    );
  }
}

class Fertilizer {
  String name;

  Fertilizer(this.name);
}

class Environment {
  String name;

  Environment(this.name);
}
