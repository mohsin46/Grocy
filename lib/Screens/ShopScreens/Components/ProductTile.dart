import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocy/Screens/ShopScreens/AddProduct.dart';
import 'package:grocy/components/rounded_button.dart';

class ProductTile extends StatefulWidget {
  ProductTile({this.product});
  final product;
  @override
  _ProductTileState createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {

  Future<bool> _onBackPress() {
    Navigator.of(context).pop(true);
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: SafeArea(
              child: RoundedButton(
                text: 'Back',
                press: () {
                  //print(Modal);
                  Navigator.of(context).pop();
                },
              )
          ),
        ),
        onWillPop: () async{
          print("Back Pressed");
          Navigator.of(context).pop();
        });
  }
}
