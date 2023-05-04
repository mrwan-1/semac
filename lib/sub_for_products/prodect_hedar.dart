import 'package:flutter/material.dart';

import '../config.dart';



class ProdectHader extends StatelessWidget {
  const ProdectHader({
    Key? key,
    required this.prodHaith,
    required this.image,
  }) : super(key: key);

  final double prodHaith;
final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: prodHaith * 1.9,
      decoration: BoxDecoration(
          image:
              DecorationImage(
                fit: BoxFit.cover,
                image:NetworkImage(image)),
          color: Colors.white,
          borderRadius:
              const BorderRadius.only(bottomLeft: Radius.circular(35),bottomRight:  Radius.circular(35))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color:Kbackdrung,
            ),
            child: const Icon(Icons.favorite_outline_sharp,size: 30,color: Colors.white,),
          ),
        ],
      ),
    );
  }
}
