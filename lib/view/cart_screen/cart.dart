import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sampleproviderproject/provider/provider_class.dart';
import 'package:sampleproviderproject/view/cart_screen/cart_screen_widget/cart_screen_widget.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}



class _CartscreenState extends State<Cartscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "My Cart",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => CartScreenWidget(
                productName: Provider.of<ShopProvider>(context, )
                    .itemList[index]
                    .pName,
                productPrice: Provider.of<ShopProvider>(context, )
                    .itemList[index]
                    .pPrice,
                productImage: Provider.of<ShopProvider>(context, )
                    .itemList[index]
                    .pImage,
                productQuantity:
                    Provider.of<ShopProvider>(context, )
                        .itemList[index]
                        .pQuantity, index: index,
              ),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: Provider.of<ShopProvider>(context).itemList.length),
    );
  }
}
