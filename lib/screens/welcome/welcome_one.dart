// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:she_mec/auth/login/login.dart';

import '../../config.dart';


class WelcomeOne extends StatefulWidget {
  const WelcomeOne({super.key});

  @override
  State<WelcomeOne> createState() => _WelcomeOneState();
}

class _WelcomeOneState extends State<WelcomeOne> {
  var myarr = [
    {
      "title": 'ابحث عن المنتجات التي تحبها',
      "info": 'افضل المنتجات تجدها في التطبيق ',
      "image": 'assets/icons/Hello-rafiki.svg'
    },
    {
      "title": 'قم بختيار طلبك من موقعنا',
      "info": 'ولاتقلقي من المنتجات المزيفه بعد \nاليوم الاصلي عندنا وبس',
      "image": 'assets/icons/In no time-pana (1).svg'
    },
    {
      "title": 'وفري حق المواصلات وتخارجي \n من داخل التطبيق',
      "info": 'لحضات وكل حاجه عند الباب ',
      "image": 'assets/icons/Shopping bag-rafiki.svg'
    }
  ];
  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height / 3;
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          
           leading: IconButton(onPressed: (){
            Navigator.pop(context);
           }, icon: Icon(Icons.arrow_back_ios_new)),
          
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: myheight * 2,
                  child: PageIndicatorContainer(
                    shape: IndicatorShape.circle(),
                    length: myarr.length,
                    align: IndicatorAlign.bottom,
                    indicatorColor: Ktitle,
                    indicatorSelectorColor: Kbackdrung,
                    child: PageView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: myarr.length,
                      itemBuilder: (context, i) {
                        return SingleTips(
                          image: myarr[i]["image"],
                          info: myarr[i]["info"],
                          title: myarr[i]["title"],
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 10,
                ),
               
               
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                      return LOGIN();
                    },), (route) => false);
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: Kbackdrung,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'التسجيل بستخدام رقم الهاتف',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SingleTips extends StatelessWidget {
  SingleTips({super.key, this.title, this.info, this.image});
  final String? title;
  final String? info;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
                alignment: Alignment.center, child: SvgPicture.asset(image!,height: 300,))),
        Text(
           textAlign: TextAlign.center,
          title!,
          style: TextStyle(
              color: Ktitle, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 45),
          child: Text(
            textAlign: TextAlign.center,
            info!,
            style: TextStyle(color: Kbackdrung, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
