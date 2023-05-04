import 'package:flutter/material.dart';

class Advertisements extends StatelessWidget {
  const Advertisements({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image:  DecorationImage(
            fit: BoxFit.fill, image: NetworkImage('https://static.photocdn.pt/images/articles/2018/12/05/articles/2017_8/beginner_photography_mistakes-1.webp')),
      ),
    );
  }
}
