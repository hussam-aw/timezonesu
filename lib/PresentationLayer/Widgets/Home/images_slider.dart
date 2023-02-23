import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImagesSlider extends StatelessWidget {
  ImagesSlider({items});

  List<Widget>? items;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items,
      options: CarouselOptions(
        height: 180.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
    );
  }
}
