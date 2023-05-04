// ignore_for_file: must_be_immutable, non_constant_identifier_names, unnecessary_brace_in_string_interps, prefer_const_constructors

import 'package:flutter/material.dart';

class AccessoriesBody extends StatelessWidget {
   AccessoriesBody({super.key,
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
      margin: EdgeInsets.symmetric(vertical: 8),
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
                image:
                    DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(image))),
          ),
          SizedBox(width: 70,),
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
