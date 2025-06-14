import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/response/product/fetch_products_response.dart';
import '../widget/product_widgets.dart';


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
              // margin: const EdgeInsets.all(16),
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
            giftVerificationContainer(
              widget: Column(
                children: [
                  giftVerificationItem(
                    key: 'Item:',
                    value: product.title,

                  ),
                  giftVerificationItem(
                    key: 'Amount',
                    value: '\$${product.price}',
                  ),
                  giftVerificationItem(
                    key: 'Category',
                    value: product.category.slug,
                  ),
                  giftVerificationItem(
                    key: 'Description',
                    value: product.description,
                  ),
                ],
              ),
            ),


            // Product Info Card
            // Container(
            //   width: double.infinity,
            //   margin: const EdgeInsets.symmetric(horizontal: 16),
            //   padding: const EdgeInsets.all(20),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(20),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.black12,
            //         blurRadius: 10,
            //         offset: const Offset(0, 4),
            //       )
            //     ],
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       // Title
            //       Text(
            //         product.title,
            //         style: const TextStyle(
            //           fontSize: 22,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.black87,
            //         ),
            //       ),
            //       const SizedBox(height: 12),
            //
            //       // Price
            //       Text(
            //         '\$${product.price}',
            //         style: const TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.w600,
            //           color: Color(0xFF3E7D28), // greenish
            //         ),
            //       ),
            //       const SizedBox(height: 20),
            //
            //       // Description Header
            //       const Text(
            //         'Description',
            //         style: TextStyle(
            //           fontSize: 16,
            //           fontWeight: FontWeight.w600,
            //           color: Colors.black87,
            //         ),
            //       ),
            //       const SizedBox(height: 8),
            //
            //       // Description
            //       Text(
            //         product.description,
            //         style: const TextStyle(
            //           fontSize: 14,
            //           height: 1.6,
            //           color: Colors.black54,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

}
