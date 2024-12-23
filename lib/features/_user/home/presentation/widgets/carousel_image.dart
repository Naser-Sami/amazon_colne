import 'package:flutter/material.dart';

import '/core/_core.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: CarouselView(
        itemExtent: MediaQuery.of(context).size.width,
        children: Constants.carouselImages.map(
          (item) {
            return Image.network(item, fit: BoxFit.cover);
          },
        ).toList(),
      ),
    );
  }
}
