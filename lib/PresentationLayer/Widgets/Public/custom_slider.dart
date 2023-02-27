import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  CustomSlider({this.height = 100, required this.widgets});

  double height;
  List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: widgets.length,
      options: CarouselOptions(
        enlargeCenterPage: true,
        height: height,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        reverse: false,
        aspectRatio: 5.0,
      ),
      itemBuilder: (context, index, id) {
        return widgets[index];
      },
    );
  }
}
