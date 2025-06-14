import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/response/product/fetch_products_response.dart';


class ProductDetailScreen extends StatelessWidget {

  static const id = 'products_details_screen';

  // final Product? product;

  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product!.title),
      ),
      body: Column(
        children: [
          Text(product?.title ?? ""),
          CachedNetworkImage(
            imageUrl: product?.images.first ?? "",
            fit: BoxFit.cover,
            placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
            const Icon(Icons.broken_image),
          ),
          const SizedBox(height: 8,),
          Text(product?.price.toString() ?? ""),
          const SizedBox(height: 4,),
          Text(product?.description ?? ""),
          const SizedBox(height: 4,),


          // Text(prodDat)
        ],
      ),
    );
  }
}
