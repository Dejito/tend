import 'package:blackchinx/data/models/response/product/fetch_products_response.dart';
import 'package:blackchinx/data/service/http_util.dart';
import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';
import '../../data/service/api_service/user_api.dart';
import '../views/widgets/flutter_toast.dart';

class ProductsProvider with ChangeNotifier {

  List<Product> _productsList = [];

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
       _productsList = Product.fromJsonList(response.body);
       notifyListeners();
      } else {
        showToast(message: "Unexpected server response. Please try again.");
      }
    } catch (e) {
      // dismissLoadingIndicator();
      handleError(error: e);
    }
  }


  List<LocalProduct> get items {
    return [..._items];
  }

  List<Product> get productsList {
    return [..._productsList];
  }

  List<LocalProduct> get getFavorites {
    return items.where((items) => items.isFavorite).toList();
  }

  LocalProduct findById (String id){
    return _items.firstWhere((prod) => prod.id == id);
  }

// Future<void> fetchAndSetProducts([bool filterBy = false]) async {
//   final filterString = filterBy ? 'orderBy="creatorId"&equalTo="$userId"' : '';
//   print(userId);
//   var url = 'https://e-shop-432c0-default-rtdb.firebaseio.com/products.json?auth=$authToken&$filterString';
//   try{
//    final response = await http.get(Uri.parse(url));
//    final products = json.decode(response.body)as Map<String, dynamic>;
//    if (products.isEmpty){
//      return;
//    }
//    url = 'https://e-shop-432c0-default-rtdb.firebaseio.com/userFavorites/$userId.json?auth=$authToken';
//   final favoriteResponse = await http.get(Uri.parse(url));
//     final favoriteData = json.decode(favoriteResponse.body);
//    List<Product> loadedProducts = [];
//     products.forEach((prodId, backendProd) {
//       loadedProducts.add(Product(
//           id: prodId,
//           title: backendProd['title'],
//           description: backendProd['description'],
//           price: backendProd['price'] == String ? double.parse(backendProd['price']).toDouble() : backendProd['price'],
//           imageUrl: backendProd['imageUrl'],
//           // isFavorite: favoriteData != null ? false : favoriteData[prodId] ?? false,
//       ));
//     },
//     );
//    _items = loadedProducts;
//    notifyListeners();
//   }catch (e) {
//     rethrow;
//
//   }
// }

// Future<void> addProduct(Product product) async {
//   final url = 'https://e-shop-432c0-default-rtdb.firebaseio.com/products.json?auth=$authToken';
//   try {
//     final response = await http.post(Uri.parse(url), body: json.encode({
//       'title': product.title,
//       'description': product.description,
//       'price': product.price,
//       'imageUrl': product.imageUrl,
//       'creatorId': userId
//     })
//     );
//     if (response.body.isEmpty) {
//       return;
//     }
//     final newProduct = Product(
//       title: product.title,
//       description: product.description,
//       price: product.price,
//       id: DateTime.now().toString(),
//       imageUrl: product.imageUrl,
//     );
//     _items.add(newProduct);
//     notifyListeners();
//   } catch (e) {
//     rethrow;
//   }
// }
// Future<void> updateProduct (String id, Product newProduct) async{
//   final url = 'https://e-shop-432c0-default-rtdb.firebaseio.com/products/$id.json?auth=$authToken';
//   final prodIndex = _items.indexWhere((prod) => prod.id == id);
//   try{
//     if (prodIndex >= 0) {
//
//      await http.patch(Uri.parse(url),body:json.encode(
//           {
//             'title': newProduct.title,
//             'description': newProduct.description,
//             'price': newProduct.price,
//             'imageUrl': newProduct.imageUrl
//           })
//       );
//       _items[prodIndex] = newProduct;
//       notifyListeners();
//     } else {
//     }
//   } catch(e){
//
//     rethrow;
//   }
// }
//
// Future<void> deleteProduct(String id) async {
//   final url = 'https://e-shop-432c0-default-rtdb.firebaseio.com/products/$id.json?auth=$authToken';
//   final existingProductIndex = _items.indexWhere((prodId) => id == prodId.id);
//   var existingProduct = _items[existingProductIndex];
//   //remove albeit temporarily from local storage
//   _items.removeWhere((prod) => prod.id == id);
//     notifyListeners();
//     final response = await http.delete(Uri.parse(url));
//     if (response.statusCode >= 400) {
//       _items.insert(existingProductIndex, existingProduct);
//       notifyListeners();
//       throw const HttpException('Unsuccessful request');
//     }
//     existingProduct.dispose();
//
// }
}
