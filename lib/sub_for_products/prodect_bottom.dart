// ignore_for_file: sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../config.dart';
import '../home/widgets/view_data.dart';
import '../screens/shopingCart/card_controller.dart';

class ProdectBottom extends StatelessWidget {
   ProdectBottom({
    Key? key,
    required this.prodHaith,
    required this.sal,
        required this.index,


  }) : super(key: key);
int index;
  final double prodHaith;
final String sal;
final cardcontroler = Get.put(CardController());

  final productcontroller = Get.put(Prodectcontroller());

  final cartConttroller = Get.put(CardController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: prodHaith / 3.3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Stack(
          textDirection: TextDirection.rtl,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Kbackdrung,
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                // ignore: unnecessary_brace_in_string_interps
                '${sal} R.Y',
                style: const TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 70),
              alignment: Alignment.center,
              width: 250,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)),
                  child: const Text("اضافة الئ السله",style: TextStyle(fontSize: 20),),
            ),
            InkWell(
              onTap: () {
                cartConttroller
                        .addProduct(productcontroller.product[index]);
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(10),
                width: 80,
                height: 50,
                decoration: BoxDecoration(
                    color: Kbackdrung,
                    borderRadius: BorderRadius.circular(20)),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}