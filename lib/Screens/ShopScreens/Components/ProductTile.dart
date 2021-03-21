import 'package:flutter/material.dart';

class ProductTile extends StatefulWidget {
  ProductTile({this.product});
  final product;
  @override
  _ProductTileState createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Hi'
      ),
    );
  }
}
