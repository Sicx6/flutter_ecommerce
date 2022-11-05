import 'package:ecommerce_flutter/provider/product_provider.dart';
import 'package:ecommerce_flutter/screens/my%20order/order_done.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/product_model.dart';

class ItemDetails extends StatelessWidget {
  ItemDetails({
    Key? key,
  }) : super(key: key);

  @override
  bool liked = false;
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey[200],
                ),
                child: Image.asset(
                  'assets/helios.png',
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                padding: EdgeInsets.all(25),
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  children: [
                    Container(
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.3),
                          shape: BoxShape.circle),
                      child: Image.asset(
                        'assets/heart(1).png',
                        color: liked ? Colors.grey : Colors.red,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Laptop Name',
                      style: GoogleFonts.abel(
                          textStyle: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Specification',
                      style: GoogleFonts.abel(
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400)),
                    ),
                    Text(
                      'Item price',
                      style: TextStyle(fontSize: 20, color: Colors.yellow),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                padding: const EdgeInsets.all(25),
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  children: [
                    Container(
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('2'),
                            Icon(Icons.star),
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Products Review',
                      style: GoogleFonts.abel(
                          textStyle: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Specification',
                      style: GoogleFonts.abel(
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400)),
                    ),
                    Text('Price'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const OrderFinish();
          }));
        },
        label: Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_bag),
            ),
            Text('Add to cart'),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
