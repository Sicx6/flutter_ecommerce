// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_flutter/screens/cart/item_details_screen.dart';
import 'package:ecommerce_flutter/screens/cart/user_cart.dart';

import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../model/product_model.dart';

class ImageSliderDemo extends StatelessWidget {
  CarouselController controller = CarouselController();

  ImageSliderDemo({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CarouselSlider(
                carouselController: controller,
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                ),
                items: imgList
                    .map((item) => GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Cart();
                            }));
                          },
                          child: Container(
                            child: Container(
                              margin: EdgeInsets.all(3.0),
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  child: Stack(
                                    children: <Widget>[
                                      Image.network(item,
                                          fit: BoxFit.cover, width: 1000.0),
                                      Positioned(
                                        bottom: 0.0,
                                        left: 0.0,
                                        right: 0.0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color.fromARGB(
                                                    199, 215, 219, 153),
                                                Color.fromARGB(0, 0, 0, 0)
                                              ],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                            ),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 20.0),
                                          child: Text(
                                            'No. ${imgList.indexOf(item)} products',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ))
                    .toList()),
          ],
        ),
      ),
    );
  }
}

final List<String> imgList = [
  'https://i.ytimg.com/vi/GC-xa9pl6Ao/maxresdefault.jpg',
  'https://cdn.mos.cms.futurecdn.net/rz8HiZ47ozpFb8ugr7YbhM.jpg',
  'https://pbs.twimg.com/media/EsMPfpqW8AAFnfo?format=jpg&name=4096x4096',
  'https://media.idownloadblog.com/wp-content/uploads/2021/09/Apple-iPhone-13-Pro-advertisement.jpg',
  'https://external-preview.redd.it/QtsdZ8xmzmXaZApxfOsDBfd1Irit3H2g-Jz3wqLba1E.jpg?auto=webp&s=92482c497726e72bd2fa416b16420ec2089ecedd',
  'http://gadgethousenepal.com/wp-content/uploads/2021/10/a8996804f72c8dd24756dddf3525a879.png'
];
