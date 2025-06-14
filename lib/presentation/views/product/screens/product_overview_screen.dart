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
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      return Provider.of<AuthProvider>(context, listen: false)
          .setLoginSuccessfulFlagToFalse();
    });
    super.initState();
  }

  bool showFavs = false;

  @override
  Widget build(BuildContext context) {
    print('calling prod overview method');
    // Provider.of<Products>(context).fetchAndSetProducts();
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              onSelected: (selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.favorites) {
                    showFavs = true;
                  } else {
                    showFavs = false;
                  }
                });
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) {
                return const [
                  PopupMenuItem(
                    value: FilterOptions.favorites,
                    child: Text('Only Favorites'),
                  ),
                  PopupMenuItem(
                    value: FilterOptions.all,
                    child: Text('All'),
                  ),
                ];
              }),
        ],
        title: const Text('Push'),
      ),
      body: FutureBuilder(
          future: Provider.of<ProductsProvider>(context, listen: false)
              .fetchProducts(),
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ProductsGrid(isFav: showFavs)),
    );
  }
}
