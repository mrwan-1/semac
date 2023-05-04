// ignore_for_file: must_be_immutable, non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:she_mec/type/makeup/view_data.dart';
import '../../screens/shopingCart/card_controller.dart';
import '../../sub_for_products/prodect.dart';

class MakeupBody extends StatelessWidget {
   MakeupBody({super.key,
  required this.title,
  required this.price,
  required this.image,
   required this.index,
  required this.subtitle,
  });
String title;
String price;
String image;
int index;
String subtitle;
final productcontroller = Get.put(Prodectcontrollerr());

  final cartConttroller = Get.put(CardController());

  @override
  Widget build(BuildContext context) {
    double Makheight = MediaQuery.of(context).size.height / 4;
    return InkWell(
           onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return Prodect(list: productcontroller.product[index],index:index);
          },
        ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: MediaQuery.of(context).size.width /1.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: Row(
         mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: 120,
              width:  Makheight * 0.6,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(right: Radius.circular(8)),
                  image:
                      DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(image))),
            ),
            const SizedBox(width: 70,),
          Column(
    
            children: [
                FittedBox(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            FittedBox(
              child: Text(
                textAlign: TextAlign.center,
                "${price} R.Y ",
                style: const TextStyle(fontSize: 18),
              ),
            ),
            ],
          )
          
          ],
        ),
      ),
    );
  }
}
