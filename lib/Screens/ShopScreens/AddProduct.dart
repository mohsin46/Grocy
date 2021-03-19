import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grocy/Screens/Welcome/welcome_screen.dart';
import 'package:grocy/redux/actions.dart';
import 'package:grocy/redux/model.dart';
import 'package:redux/redux.dart';
import 'package:grocy/consumer_api.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  ShopApi shop = ShopApi();
  var allProducts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts();
    print("Getting Products");
    print(allProducts);
  }

  void getProducts() async {
    allProducts = await shop.getProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState,_ViewModel>(
        //onInit: (store) => store.dispatch(new AddProduct(allProducts)),
        converter: (Store<AppState> store) => _ViewModel.create(store),
        builder: (BuildContext context,_ViewModel viewModel) => SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  child: TextButton(
                    onPressed: () async{
                      final storage = new FlutterSecureStorage();
                      allProducts = await shop.getProducts();
                      viewModel.onAddProduct(allProducts);
                      print("H");
                      print(viewModel.products);
                    },
                    child: Text(
                        'Redux Testing'
                    ),
                  ),
                ),
                //ListView.builder(itemBuilder: itemBuilder)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ViewModel {
  List<dynamic> products;
  Function(dynamic) onAddProduct;

  _ViewModel({
    this.products,
    this.onAddProduct,
  });

  factory _ViewModel.create(Store<AppState> store) {
    _onAddItem(var productsData) {
      store.dispatch(AddProductAction(productsData));
    }

    return _ViewModel(
      products: store.state.products,
      onAddProduct: _onAddItem,
    );
  }
}
