import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Product.dart';
import 'ShopingBasketData.dart';

class DescriptionPage extends StatelessWidget {
  Product _product;

  DescriptionPage(this._product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " توضیحات کفش " + _product.productName,
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
      body: Builder(
        builder: (context) => ListView(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Align(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Shoes",
                  style: TextStyle(
                      fontFamily: "Varela", color: Colors.red[700], fontSize: 40),
                ),
              ),
              alignment: Alignment.topLeft,
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Image.network(
                _product.imageUrl,
                height: 280,
                width: 280,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              _product.price,
              style: TextStyle(
                  color: Colors.red[700], fontFamily: "Vazir", fontSize: 30),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
            Text(
              _product.productName,
              style: TextStyle(
                  color: Colors.grey[700], fontFamily: "Vazir", fontSize: 20),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(left: 45, right: 45),
              child: Text(
                _product.description,
                style: TextStyle(
                    color: Colors.grey[500], fontFamily: "Vazir", fontSize: 16),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Align(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20 , top: 20),
                  child: GestureDetector(
                    onTap: () {
                      ShoppingBasketData.getInstance().basketItem.add(_product);
                      Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text("به سبد خرید شما افزوده شد" , style: TextStyle(fontFamily: "Vazir" , fontSize: 15 ,),))
                      );
                    },
                    ///////////////////////////////////////////////////////////////////////////error big box in film 17
                    child: Container(
                      color: Colors.red[600],
                     // decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      child: Center(
                        child: Text(
                          "افزودن به سبد خرید",
                          style: TextStyle(
                              fontFamily: "vazir",
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width - 50,
                      height: 700,
                    ),
                  ),
                ),
                alignment: Alignment.bottomCenter,
              ),
            )
          ],
        ),
      ),
    );
  }
}
