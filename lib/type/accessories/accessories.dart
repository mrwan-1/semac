import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config.dart';
import '../../sub_for_products/prodect.dart';
import 'accessories_body.dart';

class Accessories extends StatefulWidget {
  const Accessories({
    super.key,
    required this.title,
  });
  final String title;
  @override
  State<Accessories> createState() => _AccessoriesState();
}

class _AccessoriesState extends State<Accessories> {
  CollectionReference skincare =
      FirebaseFirestore.instance.collection('skinCare');
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              backgroundColor: Ktitle,

      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black)),
        elevation: 0,
              backgroundColor: Ktitle,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/acc/titles.jpg')),
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(15))),
            ),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Builder(
                      builder: (context) {
                        return FutureBuilder(
                          future: skincare.get(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return const Text("Something went wrong");
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              var data = snapshot.data?.docs;
                              var children = data?.map((e) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(Prodect(
                                      list: e,
                                    ));
                                  },
                                  child: AccessoriesBody(
                                      title: e['name'],
                                      sal: e['def'],
                                      image: 'assets/images/2.png'),
                                );
                              }).toList();
                              return Column(
                                children: children as List<Widget>,
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
