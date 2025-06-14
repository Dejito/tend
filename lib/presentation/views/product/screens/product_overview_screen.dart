import 'package:blackchinx/presentation/provider/auth_provider.dart';
import 'package:blackchinx/presentation/provider/products_provider.dart';
import 'package:blackchinx/presentation/views/product/widget/products_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/app_drawer.dart';

enum FilterOptions { favorites, all }

class ProductsOverviewScreen extends StatefulWidget {
  static const id = '/product-overview';

  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {


  bool showFavs = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Push'),
        actions: [
          PopupMenuButton(
            onSelected: (selectedValue) {
              setState(() {
                showFavs = selectedValue == FilterOptions.favorites;
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: FilterOptions.favorites,
                child: Text('Only Favorites'),
              ),
              PopupMenuItem(
                value: FilterOptions.all,
                child: Text('All'),
              ),
            ],
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<ProductsProvider>(context, listen: false).fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                await Provider.of<ProductsProvider>(context, listen: false).fetchProducts();
                setState(() {});
              },
              child: ProductsGrid(isFav: showFavs),
            );
          }
        },
      ),
    );
  }

}
