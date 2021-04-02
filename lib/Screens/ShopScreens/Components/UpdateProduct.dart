import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProduct extends StatefulWidget {
  @override
  final name;
  final url;
  final price;
  final qty;
  final type;
  final id;
  UpdateProduct({this.name,this.url,this.price,this.qty,this.type,this.id});

  _UpdateProductState createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  var new_name;
  var new_price;
  var new_quantity;
  var increase_quantity=0.toString();
  var decrease_quantity=0.toString();
  var new_url;
  File _image;
  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  Future getImageFromGallery() async{
    final image = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _image=File(image.path);
    });
  }
  Future getImageFromCamera() async{
    final image = await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      _image=File(image.path);
    });
  }

  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var total_quantity = widget.qty + int.parse(increase_quantity) - int.parse(decrease_quantity);
    var new_url=widget.url;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Update Product'
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0.05*size.width, 15, 0.05*size.width, 0),
                  child: TextField(
                    controller: TextEditingController(text: widget.name),
                    onChanged: (value) {
                      new_name=value;
                      print(new_name);
                    },
                    decoration: InputDecoration(
                        //hintText: 'Name',
                        contentPadding: EdgeInsets.all(5.0),
                        //labelText: 'Product Name'
                    ),
                    style: TextStyle(
                        fontSize: 19
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                  ),
                  margin: EdgeInsets.fromLTRB(0.05*size.width, 15, 0.05*size.width, 0),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          'Price',
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      Container(
                        width: 0.325*size.width,
                        margin: EdgeInsets.fromLTRB(0.0275*size.width, 0, 0, 0),
                        child:TextField(
                          controller: TextEditingController(text: widget.price),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            new_price=value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Cost',
                            contentPadding: EdgeInsets.fromLTRB(5,0, 5, 0),
                            //labelText: 'Cost'
                          ),
                          style: TextStyle(
                              fontSize: 19
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Text(
                          'Qty',
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      Container(
                        width: 0.225*size.width,
                        margin: EdgeInsets.fromLTRB(0.0275*size.width, 0, 0, 0),
                        child:TextField(
                          enabled: false,
                          controller: TextEditingController(text: widget.qty.toString()),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            new_quantity=value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Quantity',
                            contentPadding: EdgeInsets.fromLTRB(5,0, 5, 0),
                            //labelText: 'Cost'
                          ),
                          style: TextStyle(
                              fontSize: 19
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.05*size.width, 15, 0.05*size.width, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          'Increase Quantity By : ',
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      Container(
                        width: 0.325*size.width,
                        margin: EdgeInsets.fromLTRB(0.0275*size.width, 0, 0, 0),
                        child:TextField(
                          controller: TextEditingController(text: increase_quantity),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            increase_quantity=value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Units',
                            contentPadding: EdgeInsets.fromLTRB(5,0, 5, 0),
                            //labelText: 'Cost'
                          ),
                          style: TextStyle(
                              fontSize: 19
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.05*size.width, 15, 0.05*size.width, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          'Decrease Quantity By : ',
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      Container(
                        width: 0.325*size.width,
                        margin: EdgeInsets.fromLTRB(0.0275*size.width, 0, 0, 0),
                        child:TextField(
                          controller: TextEditingController(text: decrease_quantity),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            decrease_quantity=value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Units',
                            contentPadding: EdgeInsets.fromLTRB(5,0, 5, 0),
                            //labelText: 'Cost'
                          ),
                          style: TextStyle(
                              fontSize: 19
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.05*size.width, 15, 0.05*size.width, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          'Final Quantity : ',
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      Container(
                        width: 0.325*size.width,
                        margin: EdgeInsets.fromLTRB(0.0275*size.width, 0, 0, 0),
                        child:TextField(
                          controller: TextEditingController(text: total_quantity.toString()),
                          enabled: false,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            increase_quantity=value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Units',
                            contentPadding: EdgeInsets.fromLTRB(5,0, 5, 0),
                            //labelText: 'Cost'
                          ),
                          style: TextStyle(
                              fontSize: 19
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        //height: size.height/2.5,
                          child: TextButton(
                            child: _image == null ? Image.network(widget.url,height: size.height/2.5,) : Image.file(_image,height: size.height/2.5,width: size.width/2.5,fit: BoxFit.contain,),
                            onPressed: () {
                              showModalBottomSheet(context: context,
                                  builder: (
                                          (builder) =>
                                          Container(
                                            height: size.height/5,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      child: Text('Choose Product Image',
                                                        style: TextStyle(
                                                            fontSize: 19
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: size.height/35,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        IconButton(
                                                          icon: const Icon(Icons.photo),
                                                          iconSize: size.height/15,
                                                          color: Colors.green,
                                                          onPressed: () async{
                                                            await getImageFromGallery();
                                                            print(_image);
                                                          },
                                                        ),
                                                        Text('Gallery',
                                                          style: TextStyle(
                                                              fontSize: 19
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: size.width/3,
                                                    ),
                                                    Column(
                                                      children: [
                                                        IconButton(
                                                          icon:const Icon(Icons.camera),iconSize: size.height/15,color: Colors.green,
                                                          onPressed: () async{
                                                            await getImageFromCamera();
                                                          },
                                                        ),
                                                        Text('Camera',
                                                          style: TextStyle(
                                                              fontSize: 19
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                  )
                              );
                            },
                          )
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
