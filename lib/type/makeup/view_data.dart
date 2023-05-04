import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'makup_body.dart';

class VIEWDATAMakup extends StatefulWidget {
  const VIEWDATAMakup({super.key});

  @override
  State<VIEWDATAMakup> createState() => _VIEWDATAMakupState();
}

class _VIEWDATAMakupState extends State<VIEWDATAMakup> {

  final productcontroller = Get.put(Prodectcontrollerr());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
        child: ListView.builder(
          itemCount: productcontroller.product.length,
          itemBuilder: (context, index) {
            return MakeupBody(
              index: index,
              price: productcontroller.product[index].price,
              title: productcontroller.product[index].name,
              image: productcontroller.product[index].imageUrl,
              subtitle:productcontroller.product[index].subtitle,
            );
          },
        ),
      ),
    );
  }
}



class Products {
  String name;
  String price;
  String imageUrl;
  String subtitle;
  Products({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.subtitle,
  });

  static Products fromSnapshot(DocumentSnapshot snap) =>
      Products(name: snap['name'], price: snap['def'], imageUrl: snap['image'], subtitle: snap['doc']);
}

class FirestoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Stream<List<Products>> getAllProducts() {
    return _firebaseFirestore.collection('mackup').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Products.fromSnapshot(doc)).toList();
    });
  }
}

class Prodectcontrollerr extends GetxController {
  final product = <Products>[].obs;

  @override
  void onInit() {
    product.bindStream(FirestoreDB().getAllProducts());
    super.onInit();
  }
}


