import 'package:get/get.dart';

import 'package:ecommerce_app/database/dbHelper.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';

class CartViewModel extends GetxController {
  bool get loading => _loading;
  bool _loading = false;
  List<CartProductModel> _products = [];

  CartViewModel() {
    getAllProducts();
  }
  List<CartProductModel> get products => _products;

  addProduct(CartProductModel productModel) async {
    var dbHelper = DBHelper();
    await dbHelper.insertProduct(productModel);
    update();
  }

  getAllProducts() async {
    _loading = true;
    var dbHelper = DBHelper();
    _products = await dbHelper.getAllProducts();
    print(_products.length);
    _loading = false;
    update();
  }
}
