import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> productList;

  

  ProductProvider({required this.productList});


  
  


  addProduct(Product product) {
    productList.add(product);
    notifyListeners();
  }

  deleteProduct(int index) {
    productList.removeAt(index);
    notifyListeners();
  }
}
