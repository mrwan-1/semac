// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:list_wheel_scroll_view_x/list_wheel_scroll_view_x.dart';
import 'package:she_mec/config.dart';
import 'package:she_mec/home/widgets/view_data.dart';
import 'package:she_mec/movingList/moving_widgets.dart';

import 'widgets/advertisements/advertisements.dart';


class HomeBody extends StatelessWidget {
  HomeBody({super.key});
  CollectionReference trind = FirebaseFirestore.instance.collection('trind');
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40, right: 240, bottom: 30),
          child: const Text(
            'SHE MAC',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const MivingWidgets(),
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width / 1,
                    child:  const ListWheelScrollViewX(
                     scrollDirection: Axis.horizontal,
                     diameterRatio: 1.5,
                      itemExtent: 320,
                       children: [
                      Advertisements(),
                      Advertisements(),
                      Advertisements()
                
                    ]),
                    
                  ),
                ),
              
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
            flex: 2,
            child: RefreshIndicator(
              color: Kbackdrung,
              key: _refreshIndicatorKey,
              onRefresh: () async {
                return Future<void>.delayed(const Duration(seconds: 3));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Padding(
                    padding:  EdgeInsets.only(right: 10.0),
                    child: Text(
                      'الرائج',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  VIEWDATA(),
                ],
              ),
            ))
      ],
    );
  }
}

