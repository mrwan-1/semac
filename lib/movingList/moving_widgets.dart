
import 'package:flutter/material.dart';
import 'package:she_mec/type/makeup/makeup.dart';

import '../bottom_Navigtion/bottom_Navigtion.dart';

import '../type/accessories/accessories.dart';
import '../type/parfan/parfan.dart';
import 'moving_list.dart';

class MivingWidgets extends StatefulWidget {
  const MivingWidgets({super.key});

  @override
  State<MivingWidgets> createState() => _MivingWidgetsState();
}

class _MivingWidgetsState extends State<MivingWidgets> {
  //! القائمه المتحركه
  final List movinglis = [
       [
       
      'الرئيسية',
      true,
       const MyStatefulWidget(),
    ],
    [
       
      'المكياج',
      false,
       const Makup(title: 'المكياج',),
    ],
    [
      
      'العطور',
      false,
      const Parfan(title: 'العطور',),
    ],
    [
     
      'العنايه بالبشره',
      false,
       const Accessories(title: 'العنايه بالبشره',),
    ],
  ];
  selectedMoving(int index) {
    setState(() {
      for (int i = 0; i < movinglis.length; i++) {
        movinglis[i][1] = false;
      }
      movinglis[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20)),
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movinglis.length,
            itemBuilder: (context, index) {
              return Movinglist(
                nameList: movinglis[index][0],
                isSelected: movinglis[index][1],
                onTap: () {
                  selectedMoving(index);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return   movinglis[index][2];
                  },));
                },
              );
            },
          )),
    );
  }
}
