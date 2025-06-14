import 'package:blackchinx/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/product_model.dart';

class ProductItem extends StatelessWidget {

  final Product product;

  const ProductItem({Key? key, required this.product,}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: (){
        },
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black54,
            title: Text(product.title,
            ),
            leading: IconButton(
                  icon: const Icon(Icons.favorite,),
                  onPressed: (){
                    //   print('favorited');
                    // prod.toggleFavorite(auth.token!, auth.userId);
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
          child: Image.asset(AppImages.aiSymptomChecker,
            fit: BoxFit.cover,
            height: 300,
          ),
        ),
      ),
    );
  }
}
