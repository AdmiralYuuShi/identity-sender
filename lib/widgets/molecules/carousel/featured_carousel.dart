import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../lib.dart';

class FeaturedCarouselMol extends StatefulWidget {
  @override
  _FeaturedCarouselMolState createState() => _FeaturedCarouselMolState();
}

class _FeaturedCarouselMolState extends State<FeaturedCarouselMol> {
  int _current = 0;
  List<Widget> promotionsList = [
    ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: ImageNetworkAtm(
        imageUrl:
            'https://scontent.fbdo1-1.fna.fbcdn.net/v/t31.0-8/18320536_10154724869776859_1940475943895369703_o.jpg?_nc_cat=100&_nc_sid=9267fe&_nc_eui2=AeFp9QND9aKcRond-9mMNcAzVYrW6yVd-tJVitbrJV360roWcCjua6g53MuLzTE4td6saHiMIR_pkdCQbKZt3DJR&_nc_ohc=U7L6nF01RCkAX9COgmZ&_nc_ht=scontent.fbdo1-1.fna&oh=df880dd093a32706c903d9b5cd96b2c0&oe=5F553A05',
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: ImageNetworkAtm(
        imageUrl:
            'https://scontent.fbdo1-2.fna.fbcdn.net/v/t1.0-9/58461482_605793766562871_5166883607419027456_o.jpg?_nc_cat=104&_nc_sid=730e14&_nc_eui2=AeFL0Oz7r5zVXTb1Ap0YjbhYtrOyZuF9Q-K2s7Jm4X1D4uE0srvPwKlNM08McZeMbyQeNlhTFuds7Pr6qUjsDiej&_nc_ohc=Tm_HXCmFUqIAX_HpmVI&_nc_ht=scontent.fbdo1-2.fna&oh=af33d80a95de2e33c272a96af3af1465&oe=5F557480',
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: ImageNetworkAtm(
        imageUrl:
            'https://www.risamedia.com/content/images/size/w2000/wordpress/2018/08/my-hero-academia-two-heroes.jpg',
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        child: CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 0.8,
              enlargeCenterPage: true,
              aspectRatio: 2,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          items: promotionsList,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          height: 8,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: promotionsList.length,
              itemBuilder: (context, i) {
                return Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(2.0),
                      child: _current != i
                          ? AnimatedOpacity(
                              duration: Duration(milliseconds: 500),
                              opacity: 0.3,
                              child: CustomShape.dot(
                                color: Theme.of(context).primaryColor,
                                size: 8,
                              ),
                            )
                          : CustomShape.horizontalLine(
                              radius: 8,
                              color: Theme.of(context).primaryColor,
                              height: 8,
                              width: 16,
                            ),
                    ),
                    AppDimens.horizontalSpace8,
                  ],
                );
              }),
        ),
      ),
    ]);
  }
}
