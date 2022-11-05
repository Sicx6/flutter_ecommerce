import 'package:ecommerce_flutter/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

Future<List<Product>> getProduct() async {
  final snapshot = await FirebaseFirestore.instance.collection('product').get();

  print(snapshot.size);

  return snapshot.docs.map((e) => Product.fromJson(e.data())).toList();
}

Stream<List<Product>> getProductStream() {
  final snapshot = FirebaseFirestore.instance.collection('product').snapshots();

  return snapshot.map((snapshots) =>
      snapshots.docs.map((e) => Product.fromJson(e.data())).toList());
}

Future<List<Product>> getCategory(String category) async {
  final snapshot =
      await FirebaseFirestore.instance.collection('product/category').get();

  return snapshot.docs.map((e) => Product.fromJson(e.data())).toList();
}
