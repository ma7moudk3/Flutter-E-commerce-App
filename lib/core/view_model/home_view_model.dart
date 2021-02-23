import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/category.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/model/product.dart';

class HomeViewModel extends GetxController {
  final _categoriesRef = FirebaseFirestore.instance.collection('Categories');
  final _productsRef = FirebaseFirestore.instance.collection('Products');
  List<CategoryModel> _categoryModel = [];
  bool get loading => _loading;
  bool _loading = false;

  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];

  List<CategoryModel> get categoryModel => _categoryModel;
  getCategories() async {
    _loading = true;
    await _categoriesRef.get().then((value) {
      for (var i = 0; i < value.docs.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value.docs[i].data()));
        print(value.docs[i].data());
        _loading = false;
      }
      update();
    });
  }

  getProducts() async {
    _loading = true;
    await _productsRef.get().then((value) {
      for (int i = 0; i < value.docs.length; i++) {
        _productModel.add(ProductModel.fromJson(value.docs[i].data()));
        _loading = false;
      }
      print(_productModel.length);
      update();
    });
  }

  @override
  void onInit() {
    super.onInit();
    getCategories();
    getProducts();
  }
}
