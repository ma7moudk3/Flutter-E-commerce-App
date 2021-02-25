import 'package:get/get.dart';

import 'package:ecommerce_app/database/dbHelper.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';

class CartViewModel extends GetxController {
  var dbHelper = DBHelper();
  bool get loading => _loading;
  bool _loading = false;
  double _totalprice = 0.0;
  double get totalPrice => _totalprice;

  List<CartProductModel> _products = [];
  CartViewModel() {
    getAllProducts();
  }
  List<CartProductModel> get products => _products;

  addProduct(CartProductModel productModel) async {
    for (var i = 0; i < _products.length; i++) {
      if (_products[i].id == productModel.id) {
        return;
      }
    }
    await dbHelper.insertProduct(productModel);
    update();
  }

  getAllProducts() async {
    _loading = true;
    var dbHelper = DBHelper();
    _products = await dbHelper.getAllProducts();
    print(_products.length);
    _loading = false;
    getTotalPrice();
    update();
  }

  getTotalPrice() {
    for (var i = 0; i < _products.length; i++) {
      _totalprice += double.parse(_products[i].price) * _products[i].quantity;
    }
    update();
    print(_totalprice);
  }

  increaseQuantity(int index) async {
    _products[index].quantity++;
    _totalprice += double.parse(_products[index].price);
    await dbHelper.updateProduct(_products[index]);

    update();
  }

  deCreaseQuantity(int index) async {
    _products[index].quantity--;
    _totalprice -= double.parse(_products[index].price);
    await dbHelper.updateProduct(_products[index]);
    update();
  }
}
