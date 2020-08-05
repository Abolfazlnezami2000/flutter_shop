import 'package:flutter/material.dart';
import 'ShopingBasketData.dart';
import 'ShoppingBasketItem.dart';

class ShoppingBasket extends StatefulWidget {
  @override
  _ShoppingBasketState createState() => _ShoppingBasketState();
}

class _ShoppingBasketState extends State<ShoppingBasket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "سبد خرید",
          style: TextStyle(color: Colors.black45, fontFamily: "Vazir"),
        ),
        centerTitle: true,
//        leading: Icon(
//          Icons.arrow_back,
//          color: Colors.black45,
//        ),
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
      ),
      body: BasketUI(),
    );
  }

  Widget BasketUI() {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 85),
          child: ListView.builder(
            itemCount: ShoppingBasketData.getInstance().basketItem.length,
            itemBuilder: (context, postion) {
              return GestureDetector(
                child: Padding(
                  child: ShoppingBasketItem(
                      ShoppingBasketData.getInstance().basketItem[postion],
                      removeItem,
                      postion),
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                ),
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Material(
            color: Colors.red,
            child: InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 85,
                child: Center(
                  child: Text(
                    "پرداخت",
                    style: TextStyle(
                        fontFamily: "Vazir", fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void removeItem(int index) {
    setState(() {
      ShoppingBasketData.getInstance().basketItem.removeAt(index);
    });
  }
}
