// ignore_for_file: unrelated_type_equality_checks

import 'package:get/get.dart';

import '../../home/widgets/view_data.dart';

class CardController extends GetxController {
  final _products = {}.obs;
  void addProduct(Product products) {
    if (_products.containsKey(products)) {
      _products[products] += 1;
    } else {
      _products[products] = 1;
    }
    Get.snackbar('تمت الاضافه الئ السله  ', '');
  }
 
  void removeProduct(Product product){
    if (_products.containsKey(product)&&_products[product == 1]) {
      _products.removeWhere((key, value) => key == product);
    }else{
      _products[product] -= 1;
    }
  }

  get products => _products;
  get productSubtotal => _products.entries
      .map((products) => products.key.price * products.value)
      .toList();
  get total => _products.entries
      .map((products) => products.key.price * products.value)
      .toList()
      .reduce((value, element) => value + element)
      ;

}
