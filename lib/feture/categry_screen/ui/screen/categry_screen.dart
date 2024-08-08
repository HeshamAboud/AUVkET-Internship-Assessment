import 'package:e_commerce_app/core/components/components.dart';
import 'package:e_commerce_app/feture/categry_screen/ui/widgets/cart_action.dart';
import 'package:e_commerce_app/feture/home_screen/logic/model/home_response_model.dart';
import 'package:e_commerce_app/feture/product_screen/ui/screen/product_screen.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({required this.category, Key? key, required this.products}) : super(key: key);
  final Category category;
  final List<Product> products;
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}class _CategoryScreenState extends State<CategoryScreen> {
  Category get category => widget.category;
  Filters filterValue = Filters.popular;
  String? selection;
  late List<Product> _products;

  @override
  void initState() {
    selection = category.selections.first;
    _products = widget.products.where((p) => p.category == category.title).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ProductRow> productRows = category.selections
        .map((s) => ProductRow(
      productType: s,
      products: _products
          .where((p) => p.productType!.toLowerCase() == s.toLowerCase())
          .toList(),
    ))
        .toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(category.title),
        actions: const [
          CartAppBarAction(),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 18),
        itemCount: productRows.length,
        itemBuilder: (_, index) => productRows[index],
        separatorBuilder: (_, index) => const SizedBox(
          height: 18,
        ),
      ),
    );
  }
}
enum Filters { popular, recent, sale }