import 'package:blackchinx/data/models/response/product/fetch_products_response.dart';
import 'package:blackchinx/presentation/provider/products_provider.dart';
import 'package:blackchinx/presentation/views/product/screens/product_detail_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProductItem extends StatelessWidget {
  final Product product;

  ///UI template for how products are rendered in the gridview

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetailScreen.id, arguments: product);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Product Image
              Expanded(
                flex: 6,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: CachedNetworkImage(
                        imageUrl: product.images.first,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.broken_image),
                      ),
                    ),

                    // Favorite Icon
                    Consumer<ProductsProvider>(
                      builder: (context, provider, _) {
                        final updatedProduct = provider.findById(product.id);
                        return Positioned(
                          top: 6,
                          right: 6,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.black26,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite,
                                size: 18,
                                color: (updatedProduct.isFavorite ?? false)
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                provider.setItemAsFavorite(updatedProduct.id);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // Title & Price
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: Theme.of(context).textTheme.bodyLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$${product.price}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}