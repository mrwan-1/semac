import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../type/accessories/view_data.dart';

class CartController extends GetxController {
  var cartItems = <dynamic>[].obs;

  @override
  void onInit() async {
    print(' oninit fn ${FirestoreDB().getAllProducts()}');
    cartItems.bindStream(FirestoreDB().getAllProducts());

    super.onInit();
  }

  void addToCart(String product) {
    cartItems.add(product);
  }

  void removeFromCart(String product) {
    cartItems.remove(product);
  }
}

class FirestoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore.collection('trind').snapshots().map((snapshot) {
    
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }
}

class Product {
  String name;
  String price;
  String imageUrl;
  String subtitle;
  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.subtitle,
  });

  static Product fromSnapshot(DocumentSnapshot snap) =>
      Product(name: snap['name'], price: snap['def'], imageUrl: snap['image'], subtitle: snap['doc']);
}
