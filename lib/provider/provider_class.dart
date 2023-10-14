import 'package:flutter/material.dart';
import 'package:sampleproviderproject/model/shop_model/shop_model_class.dart';

class ShopProvider extends ChangeNotifier {
  int current_Index = 1;
  List<ShopModelClass> itemList = [];
  void increment() {
    current_Index++;
    notifyListeners();
  }

  void decrement() {
    current_Index--;

    notifyListeners();
  }

  void additem(ShopModelClass items) {
    itemList.add(items);
    notifyListeners();
  }
  void deleteitem(int index) {
  itemList.removeAt(index);
  notifyListeners();
  }
}
