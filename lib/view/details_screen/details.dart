import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sampleproviderproject/List/list_homescreen.dart';

import 'package:sampleproviderproject/model/shop_model/shop_model_class.dart';
import 'package:sampleproviderproject/provider/provider_class.dart';
import 'package:sampleproviderproject/view/cart_screen/cart.dart';

class Detailscreen extends StatefulWidget {
  const Detailscreen({super.key, required this.imageIndex, required this.item});
  final int imageIndex;
  final int item;

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  ShopProvider shop = ShopProvider();
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<ShopProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Details",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Cartscreen(),
              ));
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: NetworkImage(gridImages[widget.imageIndex]),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              names[widget.imageIndex],
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text("MRP: ₹${mrp[widget.imageIndex]}",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Text(
              "A T-shirt (also spelled tee shirt, or tee for short) is a style of fabric shirt named after the T shape of its body and sleeves. Traditionally, it has short sleeves and a round neckline, known as a crew neck, which lacks a collar.",
              style: TextStyle(
                fontSize: 15,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Quantity",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    counter.decrement();
                  },
                  child: Icon(
                    Icons.remove_circle,
                    color: Colors.black,
                    size: 27,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "${counter.current_Index}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    counter.increment();
                  },
                  child: Icon(Icons.add_circle, color: Colors.black, size: 27),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "Price :",
                        style: TextStyle(
                          fontSize: 19,
                        ),
                      ),
                      Text("₹${counter.current_Index * widget.item}",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      return Provider.of<ShopProvider>(context,listen:false).additem(ShopModelClass(
                          pName: names[widget.imageIndex],
                          pImage: gridImages[widget.imageIndex],
                          pPrice: "₹${counter.current_Index * widget.item}",
                          pQuantity: "${counter.current_Index}"));
                          
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shop,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Add To Cart",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
