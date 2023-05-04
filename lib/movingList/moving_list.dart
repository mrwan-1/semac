// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:she_mec/config.dart';

class Movinglist extends StatelessWidget {
  Movinglist({
    super.key,
    required this.nameList,
    required this.isSelected,
    required this.onTap,
  });
  final bool isSelected;
  final String nameList;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 0,
          ),
          child: Column(
            children: [
             
              Container(
                alignment: Alignment.center,
                height:size.height/13 ,
                width: size.width/4,
                decoration: BoxDecoration(
                    color: isSelected ? Kbackdrung : Colors.grey[300],
                    borderRadius: BorderRadius.circular(30)),
                    child: Text(
                nameList,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : Colors.black38),
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
