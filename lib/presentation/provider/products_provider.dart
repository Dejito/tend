import 'package:blackchinx/data/models/response/product/fetch_products_response.dart';
import 'package:blackchinx/data/service/http_util.dart';
import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';
import '../../data/service/api_service/user_api.dart';
import '../views/widgets/flutter_toast.dart';

class ProductsProvider with ChangeNotifier {

  List<Product> _products = [];

  final List<LocalProduct> _items = [
    LocalProduct(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
      'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    LocalProduct(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    LocalProduct(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
      'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    LocalProduct(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];
  // final String authToken;
  // final String? gitTest;
  // final List? previousItems;
  // final String userId;


  Future<void> fetchProducts() async{
    try {
      final response = await ApiService.fetchProducts();
      if (response.statusCode == 200 || response.statusCode == 201) {
       _products = Product.fromJsonList(response.body);
       notifyListeners();
      } else {
        showToast(message: "Unexpected server response. Please try again.");
      }
    } catch (e) {
      // dismissLoadingIndicator();
      handleError(error: e);
    }
  }

  void setItemAsFavorite(int id) {
   final prod = _products.firstWhere((prod) => prod.id == id);
   if (prod.isFavorite == false) {
     prod.isFavorite = true;
     notifyListeners();
   } else {
     prod.isFavorite = false;
     notifyListeners();
   }
  }

  Product findById (int id){
    return _products.firstWhere((prod) => prod.id == id);
  }

  List<LocalProduct> get items {
    return [..._items];
  }

  List<Product> get productsList {
    return [..._products];
  }

  List<LocalProduct> get getFavorites {
    return items.where((items) => items.isFavorite).toList();
  }

}
