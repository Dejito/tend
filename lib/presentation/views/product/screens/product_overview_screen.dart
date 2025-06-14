import 'package:blackchinx/presentation/views/product/widget/products_grid.dart';
import 'package:flutter/material.dart';

import '../widget/app_drawer.dart';


enum FilterOptions  { favorites, all}

class ProductsOverviewScreen extends StatefulWidget {
  static const id = 'wo';

  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
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
                onSelected: (selectedValue){
                  setState(() {
                    if (selectedValue == FilterOptions.favorites) {
                      showFavs = true;
                    } else {
                      showFavs = false;
                    }
                  });
                },
                icon: const Icon(
                    Icons.more_vert
                ),
                itemBuilder: (_){
                  return const[
                    PopupMenuItem(
                      value: FilterOptions.favorites,
                      child: Text('Only Favorites'),
                    ),
                    PopupMenuItem(
                      value: FilterOptions.all,
                      child: Text('All'),
                    ),
                  ];
                }
            ),
          ],
          title: const Text('Push'),
        ),
        body: ProductsGrid()
      // FutureBuilder(
      //         future: Provider.of<Products>(context, listen: false).fetchAndSetProducts(),
      //         builder: (context, snapshot) =>
      //             snapshot.connectionState == ConnectionState.waiting ?
      //               const Center(child: CircularProgressIndicator(),) :
      //                 ProductsGrid(isFav:showFavs)
      // ),
    );
  }
}

