import 'package:blackchinx/presentation/provider/products_provider.dart';
import 'package:blackchinx/presentation/views/product/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {

  const ProductsGrid({super.key});

  ///the grid builder displaying products offerings

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductsProvider>(context);
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 4.5),
        itemCount: productProvider.productsList.length,
        itemBuilder: (context, index) {
          return ProductItem(
            product: productProvider.productsList[index],
          );
        });
  }
}
