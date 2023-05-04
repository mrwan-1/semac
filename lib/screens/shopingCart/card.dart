// ignore_for_file: sized_box_for_whitespace, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:she_mec/screens/shopingCart/card_controller.dart';
import 'package:she_mec/screens/shopingCart/card_shoping.dart';

import '../../home/widgets/view_data.dart';

class CartProducts extends StatelessWidget {
  CartProducts({super.key});
  final CardController controller = Get.put(CardController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      
      () => 
          ListView.builder(
            
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              return CartProductCard(
                controller: controller,
                index: index,
                product: controller.products.keys.toList()[index],
                qwantity: controller.products.values.toList()[index],
              );
              
            },
          
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  const CartProductCard(
      {super.key,
      required this.controller,
      required this.product,
      required this.qwantity,
      required this.index});
  final CardController controller;
  final Product product;
  final int qwantity;
  final int index;
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height / 3;
    return Column(
      
      children: [
      Container(
        height: size / 2,
        child: CardFoot(
          name: product.name,
          imageUrl: product.imageUrl,
          price: product.price,
          index: index,
        ),
      ),
        
      ],
    );
  }
}

class CartTotal extends StatelessWidget {
  CartTotal({super.key});
  final CardController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [Text('${controller.total}')],
      ),
    );
  }
}
