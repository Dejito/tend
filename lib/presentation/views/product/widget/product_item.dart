import 'package:blackchinx/core/constants/app_assets.dart';
import 'package:blackchinx/data/models/response/product/fetch_products_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/product_model.dart';

class ProductItem extends StatelessWidget {

  final Product product;

  const ProductItem({super.key, required this.product,});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {},
        child: GridTile(
            footer: GridTileBar(
              backgroundColor: Colors.black54,
              title: Text(product.title,
              ),
              leading: IconButton(
                  icon: const Icon(Icons.favorite,),
                  onPressed: () {
                    debugPrint('favorited');
                  },
                  color: Colors.red


              ),
              // trailing:  IconButton(
              //   icon: const Icon(
              //     Icons.shopping_cart,
              //   ),
              //   onPressed: () {
              //     ScaffoldMessenger.of(context).hideCurrentSnackBar();
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(
              //         content: const Text('Item added',
              //         ),
              //         action: SnackBarAction(
              //           label: 'UNDO',
              //           onPressed: () {
              //           },
              //         ),
              //       ),
              //     );
              //   },
              // ),
            ),
            child: SizedBox(
              height: 250,
              width: 250,
              child: CachedNetworkImage(imageUrl: product.images.first,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.broken_image),
                fit: BoxFit.cover,
              ),
            )
        ),
      ),
    );
  }
}
