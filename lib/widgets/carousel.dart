import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  static final List<String> imgList = [
    'https://chicky-wok-bh.s3.ap-south-1.amazonaws.com/carousel/001.jpg',



  ];
  final List<Widget> imageSliders = imgList.map((item) => Container(
    child: Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(item, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
//                  decoration: BoxDecoration(
//                    gradient: LinearGradient(
//                      colors: [
//                        Color.fromARGB(200, 0, 0, 0),
//                        Color.fromARGB(0, 0, 0, 0)
//                      ],
//                      begin: Alignment.bottomCenter,
//                      end: Alignment.topCenter,
//                    ),
//                  ),
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                ),
              ),
            ],
          )
      ),
    ),
  )).toList();


  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 0.9,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 10),
        autoPlayAnimationDuration: Duration(milliseconds: 1000),
        autoPlayCurve: Curves.fastOutSlowIn,
        aspectRatio: 2,
        enlargeCenterPage: true,
      ),
      items: imageSliders,
    );
  }
}
