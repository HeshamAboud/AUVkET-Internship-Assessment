import 'package:e_commerce_app/feture/cart_screen/widgets/product_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/components.dart';
import '../../../home_screen/logic/model/home_response_model.dart';
import '../screen/product_screen.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({required this.product, Key? key}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SystemSound.play(SystemSoundType.click);
        pushScreen(
            context: context,
            screen: ProductScreen(product: product,)
          // screen: ProductScreen(product: product),
        );
      },
      child: SizedBox(
        width: 150.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(product: product),
             SizedBox(
              height: 8.h,
            ),
            Text(
              product.name!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 5.h,),
            Text(
              '\$${product.cost.toString()}',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            )
          ],
        ),
      ),
    );
  }
}