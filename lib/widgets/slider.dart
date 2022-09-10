import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopbiz/utils/constant.dart';

class CSlider extends StatelessWidget {
  const CSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: carousel.length,
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 0.84,
        enlargeCenterPage: true,
      ),
      itemBuilder: (BuildContext context, int index, int pageIndex) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: CachedNetworkImageProvider(
                    carousel[index].images,
                  ),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black54.withOpacity(0.3),
                  ),
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: Text(
                      carousel[index].text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }
}
