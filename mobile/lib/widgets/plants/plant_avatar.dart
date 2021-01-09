import 'package:flutter/material.dart';

import '../../.env.dart' as env;

class PlantAvatar extends StatelessWidget {
  final double height;
  final double width;
  final String src;

  PlantAvatar({
    this.height = 120,
    this.width = 60,
    this.src = "avatar1.png",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Image.network('${env.API_URL}uploads/avatar_plants/$src'),
    );
  }
}
