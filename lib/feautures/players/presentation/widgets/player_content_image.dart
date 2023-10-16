

import 'package:flutter/material.dart';

class PlayerContentImage extends StatelessWidget {
  const PlayerContentImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: const EdgeInsets.all(16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                image,
                width: double.infinity,
                height: 200,
                fit: BoxFit.fill,
              ),
            ),
          );
  }
}