import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImagesSlider extends StatelessWidget {
  ImagesSlider({this.height = 100, required this.images});

  double height;
  List<String> images;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length,
      options: CarouselOptions(
        enlargeCenterPage: true,
        height: height,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        reverse: false,
        aspectRatio: 5.0,
      ),
      itemBuilder: (context, index, id) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.white,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              images[index],
              width: 280,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
