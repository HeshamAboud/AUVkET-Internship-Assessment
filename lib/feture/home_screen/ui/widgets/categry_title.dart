import 'package:e_commerce_app/core/components/components.dart';
import 'package:e_commerce_app/feture/categry_screen/ui/screen/categry_screen.dart';
import 'package:e_commerce_app/feture/home_screen/logic/model/home_response_model.dart';
import 'package:e_commerce_app/feture/product_screen/ui/screen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/base_url.dart';


class CategoryTile extends StatelessWidget {
  const CategoryTile(
      {
        required this.category,
        required this.imageUrl,
        this.imageAlignment = Alignment.center,
        Key? key, required this.products})
      : super(key: key);
  final String imageUrl;
   final Category category;
  final List<Product> products;

  /// Which part of the image to prefer
  final Alignment imageAlignment;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => pushScreen(
        context: context,
        screen: CategoryScreen(
          category: category, products: products,
        ),
      ),
      child: Container(
        height: 200.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              imageUrl,
              color: kGreyBackground,
              colorBlendMode: BlendMode.darken,
              alignment: imageAlignment,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                category.title.toUpperCase(),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

