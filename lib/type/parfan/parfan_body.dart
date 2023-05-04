// ignore_for_file: must_be_immutable, non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

class ParfanBody extends StatelessWidget {
   ParfanBody({super.key,
  required this.title,
  required this.sal,
  required this.image,
  });
String title;
String sal;
String image;

  @override
  Widget build(BuildContext context) {
    double Makheight = MediaQuery.of(context).size.height / 4;
    return Container(
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
                      image: NetworkImage(image,))),
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
              "${sal} R.Y ",
              style: const TextStyle(fontSize: 18),
            ),
          ),
          ],
        )
        
        ],
      ),
    );
  }
}
