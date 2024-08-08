import 'package:e_commerce_app/core/base_url.dart';
import 'package:e_commerce_app/core/components/components.dart';
import 'package:e_commerce_app/feture/cart_screen/widgets/call_back_widget.dart';
import 'package:e_commerce_app/feture/cart_screen/widgets/cart_widgets.dart';
import 'package:e_commerce_app/feture/categry_screen/ui/widgets/cart_action.dart';
import 'package:e_commerce_app/feture/home_screen/logic/model/home_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const String manLookRightImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/ecommerce/man-look-right.jpg';
const String dogImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/ecommerce/pet.jpg';
const String womanLookLeftImageUrl =
    'https://flutter-ui.s3.us-east-2.amazonaws.com/ecommerce/woman-look-left.jpg';



class ProductScreen extends StatefulWidget {
  const ProductScreen({required this.product, Key? key}) : super(key: key);
  final Product product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Product get product => widget.product;
  String? selectedImageUrl;
  String? selectedSize;

  @override
  void initState() {
    selectedImageUrl = product.imageUrls!.front;
    selectedSize = product.sizes!.medium;
    super.initState();
  }

  void setSelectedImageUrl(String url) {
    setState(() {
      selectedImageUrl = url;
    });
  }

  void setSelectedSize(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          CartAppBarAction(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .35,
            color: kGreyBackground,
            padding:  EdgeInsets.symmetric(vertical: 18.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.network(
                    selectedImageUrl!,
                    fit: BoxFit.cover,
                    color: kGreyBackground,
                    colorBlendMode: BlendMode.multiply,
                  ),
                ),
                 SizedBox(height: 18.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: GestureDetector(
                        onTap: () => setSelectedImageUrl(product.imageUrls!.front.toString()),
                        child: Container(
                          height: 50.h,
                          width: 50.w,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: selectedImageUrl == product.imageUrls!.front.toString()
                                ? Border.all(
                                color: Theme.of(context).colorScheme.secondary,
                                width: 1.75)
                                : null,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.network(
                            product.imageUrls!.front.toString(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () => setSelectedImageUrl(product.imageUrls!.back.toString()),
                        child: Container(
                          height: 50.h,
                          width: 50.w,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: selectedImageUrl == product.imageUrls!.back.toString()
                                ? Border.all(
                                color: Theme.of(context).colorScheme.secondary,
                                width: 1.75)
                                : null,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.network(
                            product.imageUrls!.back.toString(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () => setSelectedImageUrl(product.imageUrls!.side.toString()),
                        child: Container(
                          height: 50.h,
                          width: 50.w,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: selectedImageUrl == product.imageUrls!.side.toString()
                                ? Border.all(
                                color: Theme.of(context).colorScheme.secondary,
                                width: 1.75)
                                : null,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.network(
                            product.imageUrls!.side.toString(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () => setSelectedImageUrl(product.imageUrls!.top.toString()),
                        child: Container(
                          height: 50.h,
                          width: 50.w,
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: selectedImageUrl == product.imageUrls!.top.toString()
                                ? Border.all(
                                color: Theme.of(context).colorScheme.secondary,
                                width: 1.75)
                                : null,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.network(
                            product.imageUrls!.top.toString(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.all(16.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name!,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                   SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    '\$${product.cost}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                   SizedBox(height: 12.h),
                  Text(
                    product.productType!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(height: 1.5),
                  ),
                   SizedBox(
                    height: 18.h,
                  ),
                  const Spacer(),
                  Center(
                    child: CallToActionButton(
                      onPressed: () => cart.add(
                        OrderItem(
                          product: product,
                          selectedSize: selectedSize,
                        ),
                      ),
                      labelText: 'Add to Cart',
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
















// class Product {
//   final String name;
//   final List<String> imageUrls;
//   final double cost;
//   final String? description;
//   final List<String>? sizes;
//
//   /// Which overall category this product belongs in. e.g - Men, Women, Pets, etc.
//   final Category category;
//
//   /// Represents type of product such as shirt, jeans, pet treats, etc.
//   final String productType;
//
//   Product(
//       {required this.name,
//         required this.imageUrls,
//         required this.cost,
//         this.description,
//         this.sizes,
//         required this.category,
//         required this.productType});
// }












