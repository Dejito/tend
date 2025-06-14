import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/response/product/fetch_products_response.dart';


class ProductDetailScreen extends StatelessWidget {

  static const id = 'products_details_screen';

  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Column(
        children: [
          Text(product.title),
          Image.network(product.category.image),
          const SizedBox(height: 8,),
          Text(product.price.toString()),
          const SizedBox(height: 4,),
          Text(product.description),
          const SizedBox(height: 4,),


          // Text(prodDat)
        ],
      ),
    );
  }
}
