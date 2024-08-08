import 'package:e_commerce_app/core/components/components.dart';
import 'package:e_commerce_app/feture/cart_screen/widgets/call_back_widget.dart';
import 'package:e_commerce_app/feture/cart_screen/widgets/product_image.dart';
import 'package:e_commerce_app/feture/categry_screen/ui/widgets/cart_action.dart';
import 'package:e_commerce_app/feture/home_screen/logic/model/home_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    cart.addListener(updateState);
  }

  @override
  void dispose() {
    cart.removeListener(updateState);
    super.dispose();
  }

  void updateState() => setState(() {});

  @override
  Widget build(BuildContext context) {
    List<Widget> orderItemRows = cart.itemsInCart
        .map(
          (item) => Row(
        children: [
          SizedBox(
            width: 125.w,
            child: ProductImage(
              product: item.product,
            ),
          ),
           SizedBox(
            width: 16.h,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.product.name!,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                 SizedBox(
                  height: 8.h,
                ),
                Text(
                  '\$${item.product.cost}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => cart.remove(item),
            color: Colors.red,
          )
        ],
      ),
    )
        .toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Column(
          children: [
            const Text('Cart'),
            Text(
              '${cart.itemsInCart.length} items',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          if (orderItemRows.isNotEmpty)
            Expanded(
              child: ListView.separated(
                padding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                itemCount: orderItemRows.length,
                itemBuilder: (_, index) => orderItemRows[index],
                separatorBuilder: (_, index) => const SizedBox(
                  height: 16,
                ),
              ),
            )
          else
            const Expanded(
              child: Center(
                child: Text('Your cart is empty'),
              ),
            ),
          Padding(
            padding:  EdgeInsets.all(16.0.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      '\$${cart.totalCost.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                CallToActionButton(
                  onPressed: () {},
                  labelText: 'Check Out',
                  minSize:  Size(220.w, 45.h),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
