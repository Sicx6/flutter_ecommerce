// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ecommerce_flutter/screens/Home/productCard.dart';
import 'package:ecommerce_flutter/services/api.dart';
import 'package:ecommerce_flutter/model/product_model.dart';
import 'package:ecommerce_flutter/provider/product_provider.dart';
import 'package:ecommerce_flutter/screens/Home/carousel.dart';
import 'package:ecommerce_flutter/screens/cart/item_details_screen.dart';
import 'package:ecommerce_flutter/screens/signIn_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../cart/user_cart.dart';
import 'homedrawer_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final product = Provider.of<ProductProvider>(context);
    return Scaffold(
        drawer: AppDrawer(),
        body: StreamBuilder<List<Product>>(
            stream: getProductStream(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                List<Product> productList = snapshot.data!;
                return CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Colors.amber,
                      elevation: 0,
                      title: Text(
                        'SHOOPERS',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600)),
                      ),
                      expandedHeight: 150,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15)),
                                color: Colors.amber,
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/bg1.jpg',
                                    ),
                                    fit: BoxFit.cover)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 50,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      hintText: 'Search',
                                      prefix: Icon(Icons.search),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                )
                              ],
                            )),
                      ),
                      actions: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Cart();
                              }));
                            },
                            icon: Icon(Icons.shopping_bag))
                      ],
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          // Container(
                          //   padding: EdgeInsets.symmetric(horizontal: 25),
                          //   alignment: Alignment.topLeft,
                          //   child: Text(
                          //     'Highlight',
                          //     textAlign: TextAlign.start,
                          //     style: GoogleFonts.abel(
                          //         textStyle: TextStyle(
                          //             fontSize: 28,
                          //             fontWeight: FontWeight.w600)),
                          //   ),
                          // ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width * 0.98,
                            child: ImageSliderDemo(),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: SizedBox(
                              height: 60,
                              width: double.infinity,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: productList.length,
                                  itemBuilder: (context, index) {
                                    return categoryCard(
                                      product: productList[index],
                                      index: index,
                                    );
                                  }),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              height: 600,
                              decoration: BoxDecoration(
                                color: Color(0xFFF5F6F9),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    width: double.infinity,
                                    height: 500,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Explore All Products',
                                              style: GoogleFonts.abel(
                                                  textStyle: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ),
                                            Expanded(child: Container()),
                                            InkWell(
                                              onTap: () {
                                                print('press');
                                              },
                                              child: Text(
                                                'See all',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 20,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: GridView.builder(
                                              physics: BouncingScrollPhysics(),
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                              ),
                                              itemCount: productList.length,
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: (() {
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                            builder: (context) {
                                                      return ItemDetails();
                                                    }));
                                                  }),
                                                  child: productCard(
                                                    index: index,
                                                    product: productList[index],
                                                  ),
                                                );
                                              }),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            })));
  }
}

class categoryCard extends StatelessWidget {
  const categoryCard({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);
  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Center(
              child: Text(
            product.category,
            style: GoogleFonts.lato(
                textStyle: TextStyle(fontWeight: FontWeight.w600)),
          )),
        ],
      ),
    );
  }
}
