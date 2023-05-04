import 'package:flutter/material.dart';

import '../config.dart';


class ProdectCenter extends StatelessWidget {
  const ProdectCenter({
    Key? key,
    required this.prodHaith,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final double prodHaith;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      width: double.infinity,
      height: prodHaith * 1.3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.start,
             children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                 Text(
                title,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Container(
                width: 70,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Kbackdrung,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:const [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    Text(
                      '4.3',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ),
           
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(subtitle,
              style: const TextStyle(
                fontSize: 20,
              )),
        ]),
      ),
    );
  }
}
