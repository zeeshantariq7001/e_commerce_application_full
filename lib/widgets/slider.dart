import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_application_full/utils/constants.dart';
import 'package:flutter/material.dart';

class CSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: carousel.length,
      options: CarouselOptions(
          autoPlay: true, viewportFraction: 0.85, enlargeCenterPage: true),
      itemBuilder: (BuildContext context, int index, int page) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(carousel[index].images),
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black54.withOpacity(0.2),
                  ),
                  height: double.infinity,
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    carousel[index].text,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  )))
            ],
          ),
        );
      },
    );
  }
}
