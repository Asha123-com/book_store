// import 'package:book_store/model/book%20model.dart';
// import 'package:flutter/cupertino.dart';
// class ManageState with ChangeNotifier {
//   int _counter = 0;
//
//   set counter(int value) {
//     _counter = value;
//     notifyListeners();
//   }
//
//   int get counter => _counter;
//
//   void incrementCounter() {
//     _counter++;
//     notifyListeners();
//   }
//
//   List<BookModel> _cartProducts = [];
//
//   bool addToCart(BookModel product) {
//     if(!_cartProducts.contains(product)) {
//       _cartProducts.add(product);
//       _counter++;
//       notifyListeners();
//       return true;
//     }
//     else {
//       return false;
//     }
//   }
//
//
//   List<BookModel> get cartProducts => _cartProducts;
//
//   void increaseQuantity(BookModel product) {
//     product.quantity++;
//     notifyListeners();
//   }
//
//   void decreaseQuantity(BookModel product) {
//     if(product.quantity > 1) {
//       product.quantity--;
//       notifyListeners();
//     } else {
//       _cartProducts.remove(product);
//       _counter--;
//       notifyListeners();
//     }
//   }
//
//   double calculate() {
//     double total = 0;
//     for(var product in _cartProducts) {
//       total = total + product.price * product.quantity;
//     }
//     return total;
//   }
//   void deleteProducts(BookModel product){
//     _cartProducts.remove(product);
//     _counter--;
//     notifyListeners();
//   }
// }
//
//
//
//
//
//
