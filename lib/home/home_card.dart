// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:she_mec/config.dart';
import 'package:she_mec/home/widgets/view_data.dart';
import 'package:she_mec/screens/shopingCart/card_controller.dart';
import 'package:she_mec/sub_for_products/prodect.dart';

class HomeCard extends StatelessWidget {
  HomeCard({
    super.key,
    required this.url,
    required this.title,
    required this.price,
    required this.index,
    required this.subtitle,
  });
  String url;
  String title;
  int index;
  String price;
  String subtitle;

  final productcontroller = Get.put(Prodectcontroller());

  final cartConttroller = Get.put(CardController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return Prodect(list: productcontroller.product[index],index:index);
          },
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 240,
          width: 200,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.network(
                  url,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height / 5,
                ),
              ),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
                 const Spacer(),
              Text(
                title,
                style: const TextStyle(fontSize: 20),
              ),
              const Spacer(),
              Text('R.Y $price',style: const TextStyle(fontSize: 20),),
              const Spacer(),
          ],
         ),
              Container(
                decoration: const BoxDecoration(
                  color: Kbackdrung,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight:  Radius.circular(20)),
                ),
                child: IconButton(
                    onPressed: () {
                      cartConttroller
                          .addProduct(productcontroller.product[index]);
                    },
                    icon: const Icon(Icons.shopping_bag_rounded,color: Colors.white,)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
