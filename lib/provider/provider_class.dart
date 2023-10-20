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
    bool isDuplicate =
        itemList.any((existingItem) => existingItem.pName == items.pName);
        
    if (isDuplicate) {
      ShopModelClass existingItem = itemList.firstWhere((existingitem) => existingitem.pName == items.pName);
      existingItem.pQuantity++;
      print("Item already added");
    } else {
      print("Item going to be added");
      itemList.add(items);
      notifyListeners();
    }
  }

  void deleteitem(int index) {
    itemList.removeAt(index);
    notifyListeners();
  }
  void incrementItemQuantity(int index) {
  if (index >= 0 && index < itemList.length) {
    itemList[index].pQuantity++;
    notifyListeners();
  }
}

void decrementItemQuantity(int index) {
  if (index >= 0 && index < itemList.length) {
    itemList[index].pQuantity--;
    if (itemList[index].pQuantity <= 0) {
      itemList.removeAt(index); // Remove the item if quantity is zero or negative.
    }
    notifyListeners();
  }
}


  
}
