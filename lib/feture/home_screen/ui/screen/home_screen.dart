import 'package:e_commerce_app/core/components/components.dart';
import 'package:e_commerce_app/core/di/dependency_injection.dart';
import 'package:e_commerce_app/feture/categry_screen/ui/widgets/cart_action.dart';
import 'package:e_commerce_app/feture/home_screen/logic/logic/home_repo.dart';
import 'package:e_commerce_app/feture/home_screen/ui/widgets/categry_title.dart';
import 'package:e_commerce_app/feture/product_screen/ui/screen/product_screen.dart';
import 'package:e_commerce_app/feture/product_screen/ui/widget/product_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/generic_cubit/generic_cubit.dart';
import '../../../../core/helpers/cache_helper.dart';
import '../../../../core/network_exceptions.dart';
import '../../logic/model/home_response_model.dart';

class SimpleEcommerce extends StatefulWidget {
  const SimpleEcommerce({Key? key}) : super(key: key);

  @override
  State<SimpleEcommerce> createState() => _SimpleEcommerceState();
}

class _SimpleEcommerceState extends State<SimpleEcommerce> {
  List<Product> products = [];
  HomeRepository homeRepository = getIt<HomeRepository>();

  @override
  void initState() {
    // TODO: implement initState
    homeRepository.getHomeData(
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GenericCubit<HomeResponseModel>,
            GenericCubitState<HomeResponseModel>>(
        bloc: homeRepository.homeGenericCubit,
        listener: (context, state) {
          if (state is GenericUpdatedState<HomeResponseModel>) {
            if (state.data.status != null) {
              if (state.data.message == "get home successful") {
                print(state.data.message);
                products = state.data.response!.product!;
              }
            }
          } else if (state is GenericLoadingState<HomeResponseModel>) {
            NetworkExceptions.getDioException(state.responseError);
          }
        },
        builder: (context, state) {
          return Theme(
            data: ThemeData.dark(),
            child: Builder(
              builder: (context) => HomeScreen(
                products: products,
              ),
            ),
          );
        });
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.products}) : super(key: key);
  final List<Product> products;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String searchString;

  @override
  void initState() {
    searchString = '';

    super.initState();
  }

  void setSearchString(String value) => setState(() {
        searchString = value;
      });

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Column(
    //     children: [
    //       SizedBox(
    //         width: 333,
    //         height: 333,
    //         child: ListView.builder(
    //           itemCount: widget.products.length,
    //           itemBuilder: (context, index) {
    //             return ListTile(
    //               title: Text("fffff"),
    //             );
    //           },
    //         ),
    //       ),
    //       // Text(widget.products[0].name!),
    //     ],
    //   ),
    // );
    var listViewPadding =
     EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h);
    List<Widget> searchResultTiles = [];
    if (searchString.isNotEmpty) {
      searchResultTiles = widget.products
          .where(
              (p) => p.name!.toLowerCase().contains(searchString.toLowerCase()))
          .map(
            (p) => ProductTile(product: p),
      )
          .toList();
    }
    return   Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                appBar: AppBar(
                  title: SearchBar(
                    onChanged: setSearchString,
                  ),
                  actions: const [
                    CartAppBarAction(),
                  ],
                ),
                body: searchString.isNotEmpty
                    ? GridView.count(
                  padding: listViewPadding,
                  crossAxisCount: 2,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                  childAspectRatio: .78,
                  children: searchResultTiles,
                )
                    : ListView(
                  padding: listViewPadding,
                  children: [
                    Text(
                      'Shop by Category',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                     SizedBox(height: 16.h),
                    CategoryTile(
                      products:  widget.products,
                      imageUrl: manLookRightImageUrl,
                      category: mensCategory,
                      imageAlignment: Alignment.topCenter,
                    ),
                    SizedBox(height: 16.h),
                    CategoryTile(
                      products:  widget.products,
                      imageUrl: womanLookLeftImageUrl,
                      category: womensCategory,
                      imageAlignment: Alignment.topCenter,
                    ),
                    SizedBox(height: 16.h),
                    CategoryTile(
                      products:  widget.products,
                      imageUrl: dogImageUrl,
                      category: petsCategory,
                    ),
                  ],
                ),
              ),
            );
  }
}
