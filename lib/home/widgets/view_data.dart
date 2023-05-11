import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:she_mec/home/home_card.dart';

import 'controllers/CartController.dart';


class VIEWDATA extends StatefulWidget {
  const VIEWDATA({super.key});

  @override
  State<VIEWDATA> createState() => _VIEWDATAState();
}

class _VIEWDATAState extends State<VIEWDATA> {
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
        child: ListView.builder(
          itemCount: cartController.cartItems.length,
          itemBuilder: (context, index) {
            return HomeCard(
              index: index,
              price: cartController.cartItems[index].price,
              title: cartController.cartItems[index].name,
              url: cartController.cartItems[index].imageUrl,
              subtitle:cartController.cartItems[index].subtitle,
              onAddProduct: cartController.addToCart,
            );
          },
        ),
      ),
    );
  }
}


