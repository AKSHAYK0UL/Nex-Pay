import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class BannerWidget extends StatelessWidget {
  List<String> banner_Images = [
    'assets/refer.json',
    'assets/cashback3.json',
    'assets/secure.json',
  ];

  BannerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider.builder(
        itemCount: banner_Images.length,
        itemBuilder: (context, index, realIndex) {
          final bannerImage = banner_Images[index];
          return slidebuild(bannerImage);
        },
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.35,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 6),
          viewportFraction: 1,
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}

Widget slidebuild(String bannerImage) {
  return Container(
    // color: Colors.red,
    padding: const EdgeInsets.all(7),
    // decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(20), color: Colors.amber),
    width: double.infinity,
    child: Lottie.asset(
      bannerImage,
      fit: BoxFit.scaleDown,
    ),
  );
}
