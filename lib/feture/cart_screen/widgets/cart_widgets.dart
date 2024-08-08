
import 'package:e_commerce_app/core/components/components.dart';
import 'package:e_commerce_app/feture/categry_screen/ui/widgets/cart_action.dart';
import 'package:e_commerce_app/feture/home_screen/logic/model/home_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Cart with ChangeNotifier {
  List<OrderItem> itemsInCart = [];

  double get totalCost {
    double total = 0;
    for (var item in itemsInCart) {
      total +=double.parse(item.product.cost.toString()) ;
    }
    return total;
  }

  void add(OrderItem orderItem) {
    itemsInCart.add(orderItem);
    notifyListeners();
  }

  void remove(OrderItem orderItem) {
    // print(orderItem.product.name);
    itemsInCart.remove(orderItem);
    // print(t);
    notifyListeners();
  }
}

class OrderItem {
  Product product;

  /// Selected size of product; This can be null
  String? selectedSize;

  /// Selected color of product; This can be null
  String? selectedColor;

  OrderItem({required this.product, this.selectedSize, this.selectedColor});
}