// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:she_mec/config.dart';

import 'prodect_bottom.dart';
import 'prodect_center.dart';
import 'prodect_hedar.dart';

class Prodect extends StatefulWidget {
   Prodect({super.key, required this.list, this.index,});
  final dynamic list;

int? index;
  @override
  State<Prodect> createState() => _ProdectState();
}

class _ProdectState extends State<Prodect> {
  @override
  Widget build(BuildContext context) {
    double prodHaith = MediaQuery.of(context).size.height / 4;
    return Scaffold(
      backgroundColor: Ktitle,
      appBar: AppBar(
        backgroundColor: Colors.white,
       
        centerTitle: true,
        elevation: 0,
        actions: [IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),], 
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ProdectHader(prodHaith: prodHaith, image: widget.list.imageUrl,),
          ProdectCenter(prodHaith: prodHaith, title:widget.list.name, subtitle: widget.list.subtitle,),
          ProdectBottom(prodHaith: prodHaith, sal: widget.list.price, index: widget.index!, ),
        ],
      ),
    );
  }
}




