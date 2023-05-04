import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:she_mec/home/home_card.dart';
import 'package:she_mec/screens/shopingCart/card_controller.dart';

class VIEWDATA extends StatefulWidget {
  const VIEWDATA({super.key});

  @override
  State<VIEWDATA> createState() => _VIEWDATAState();
}

class _VIEWDATAState extends State<VIEWDATA> {
  final cardcontroler = Get.put(CardController());

  final productcontroller = Get.put(Prodectcontroller());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
        child: ListView.builder(
          itemCount: productcontroller.product.length,
          itemBuilder: (context, index) {
            return HomeCard(
              index: index,
              price: productcontroller.product[index].price,
              title: productcontroller.product[index].name,
              url: productcontroller.product[index].imageUrl,
              subtitle:productcontroller.product[index].subtitle
            );
          },
        ),
      ),
    );
  }
}



class Product {
  String name;
  String price;
  String imageUrl;
  String subtitle;
  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.subtitle,
  });

  static Product fromSnapshot(DocumentSnapshot snap) =>
      Product(name: snap['name'], price: snap['def'], imageUrl: snap['image'], subtitle: snap['doc']);
}

class FirestoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore.collection('trind').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }
}

class Prodectcontroller extends GetxController {
  final product = <Product>[].obs;

  @override
  void onInit() {
    product.bindStream(FirestoreDB().getAllProducts());
    super.onInit();
  }
}


