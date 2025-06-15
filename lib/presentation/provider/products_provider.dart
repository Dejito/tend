import 'package:blackchinx/data/models/response/product/fetch_products_response.dart';
import 'package:blackchinx/data/service/http_util.dart';
import 'package:flutter/material.dart';

import '../../data/service/api_service/user_api.dart';
import '../views/widgets/flutter_toast.dart';

class ProductsProvider with ChangeNotifier {

  List<Product> _products = [];


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
  List<Product> get productsList {
    return [..._products];
  }


}
