// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, unused_local_variable, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:she_mec/config.dart';
import 'package:she_mec/home/widgets/view_data.dart';

import 'card_controller.dart';

class CardFoot extends StatelessWidget {
   CardFoot({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.index,
  });
 String imageUrl;
 String name;
 String price;
 int index;
  @override
  Widget build(BuildContext context) {
  final productcontroller = Get.put(Prodectcontroller());

  final cartConttroller = Get.put(CardController());

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          
            borderRadius: BorderRadius.circular(10), color: Ktitle),
        height: MediaQuery.of(context).size.height / 8,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.topRight,
              width: MediaQuery.of(context).size.width / 3.5,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(imageUrl),
                ),
              ),
              child: Container(
                width: 30,
                height: 30,
                  decoration: BoxDecoration(
                    color:Kbackdrung,
                    borderRadius: BorderRadius.only(topRight:Radius.circular(10) ,bottomLeft:Radius.circular(10) )
                  ),
                  child: Icon(Icons.delete,color: Colors.white,)),
            ),
            SizedBox(width: 4,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputQty(
                  showMessageLimit: false,
                  btnColor1: Colors.black,
                  btnColor2: Colors.black,
                  maxVal: 100,
                  minVal: 1,
                  isIntrinsicWidth: true,
                  borderShape: BorderShapeBtn.circle,
                  steps: 1,
                  boxDecoration: BoxDecoration(),
                  onQtyChanged: (val) {
                    print(val);
                  },
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                   'R.Y $price',
                    style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                  ),
                 
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


