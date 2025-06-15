import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/response/product/fetch_products_response.dart';
import '../widget/product_widgets.dart';


/// the product details screen

class ProductDetailScreen extends StatelessWidget {

  static const id = 'products_details_screen';

  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
        title: Text(
          product.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            // Product Image
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: product.images[0],
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.broken_image, size: 80),
                ),
              ),
            ),

            SizedBox(height: 20.h,),

            // Title
            productDetailContainer(
              widget: Column(
                children: [
                  productDetailItem(
                    key: 'Item:',
                    value: product.title,
                  ),
                  productDetailItem(
                    key: 'Amount',
                    value: '\$${product.price}',
                  ),
                  productDetailItem(
                    key: 'Category',
                    value: product.category.slug,
                  ),
                  productDetailItem(
                    key: 'Description',
                    value: product.description,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

}
