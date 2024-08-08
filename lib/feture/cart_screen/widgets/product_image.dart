import 'package:e_commerce_app/feture/home_screen/logic/model/home_response_model.dart';
import 'package:flutter/material.dart';

import '../../../core/base_url.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: .95,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: kGreyBackground,
        ),
        clipBehavior: Clip.hardEdge,
        child: Image.network(
          product.imageUrls!.front!,
          loadingBuilder: (_, child, loadingProgress) => loadingProgress == null
              ? child
              : const Center(child: CircularProgressIndicator()),
          color: kGreyBackground,
          colorBlendMode: BlendMode.multiply,
        ),
      ),
    );
  }
}