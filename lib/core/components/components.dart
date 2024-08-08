import 'package:e_commerce_app/feture/cart_screen/widgets/product_image.dart';
import 'package:e_commerce_app/feture/home_screen/logic/model/home_response_model.dart';
import 'package:e_commerce_app/feture/product_screen/ui/screen/product_screen.dart';
import 'package:e_commerce_app/feture/product_screen/ui/widget/product_title.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Row(
        children: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios)),
          Text(text),
        ],
      ),
    );
  }
}
class Category {
  final String title;
  final List<String> selections;

  Category({required this.title, required this.selections});
}
Category mensCategory = Category(title: 'mensCategory', selections: [
  'Shirts',
  'Jeans',
  'Shorts',
]);
Category womensCategory = Category(title: 'womensCategory', selections: [
  'Shirts',
  'Jeans',
]);
Category petsCategory = Category(title: 'petsCategory', selections: [
  'Toys',
  'Treats',
]);

void pushScreen({required BuildContext context, required Widget screen}) {
  ThemeData themeData = Theme.of(context);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => Theme(data: themeData, child: screen),
    ),
  );
}


class ProductRow extends StatelessWidget {
  const ProductRow(
      {required this.products, required this.productType, Key? key})
      : super(key: key);
  final String productType;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    List<ProductTile> productTiles =
    products.map((p) => ProductTile(product: p)).toList();

    return productTiles.isEmpty
        ? const SizedBox.shrink()
        : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
          ),
          child: Text(
            productType,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 205,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            itemCount: productTiles.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => productTiles[index],
            separatorBuilder: (_, index) => const SizedBox(
              width: 24,
            ),
          ),
        ),
      ],
    );
  }
}



// class SearchBar extends StatefulWidget {
//   const SearchBar({required this.onChanged, Key? key}) : super(key: key);
//
//   final Function(String) onChanged;
//
//   @override
//   State<SearchBar> createState() => _SearchBarState();
// }
//
// class _SearchBarState extends State<SearchBar> {
//   late TextEditingController _textEditingController;
//
//   @override
//   void initState() {
//     super.initState();
//     _textEditingController = TextEditingController();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Theme.of(context).primaryColorLight,
//         borderRadius: BorderRadius.circular(18),
//       ),
//       child: TextField(
//         onChanged: widget.onChanged,
//         controller: _textEditingController,
//         textAlignVertical: TextAlignVertical.center,
//         textInputAction: TextInputAction.search,
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           isDense: true,
//           contentPadding:
//           kIsWeb ? const EdgeInsets.only(top: 10) : EdgeInsets.zero,
//           prefixIconConstraints: const BoxConstraints(
//             minHeight: 36,
//             minWidth: 36,
//           ),
//           prefixIcon: const Icon(
//             Icons.search,
//           ),
//           hintText: 'Search for a product',
//           suffixIconConstraints: const BoxConstraints(
//             minHeight: 36,
//             minWidth: 36,
//           ),
//           suffixIcon: IconButton(
//             constraints: const BoxConstraints(
//               minHeight: 36,
//               minWidth: 36,
//             ),
//             splashRadius: 24,
//             icon: const Icon(
//               Icons.clear,
//             ),
//             onPressed: () {
//               _textEditingController.clear();
//               widget.onChanged(_textEditingController.text);
//               FocusScope.of(context).unfocus();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

class CustomFormFieldColumn1 extends StatelessWidget {

  final TextEditingController controller;
  final String text;
  double ?h;
  CustomFormFieldColumn1(
  {
     required this.controller, required this.text,this.h
});


  @override
  Widget build(BuildContext context) {
    //   var dimension = Dimensions(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 15.sp,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: h??68.h,
          child: TextField(
            maxLines: null, // Allow the text field to grow vertically
            expands: true,
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF9F9F9)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF9F9F9)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF9F9F9)),
              ),
              filled: true,
              fillColor:Color(0xFFF9F9F9),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomFormFieldColumn3 extends StatelessWidget {

  final TextEditingController controller;
  final String text;
  double ?h;
  CustomFormFieldColumn3(
  {
     required this.controller, required this.text,this.h
});


  @override
  Widget build(BuildContext context) {
    //   var dimension = Dimensions(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 15.sp,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: h??68.h,
          child: TextField(
            maxLines: null, // Allow the text field to grow vertically
            expands: true,
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF9F9F9)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF9F9F9)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF9F9F9)),
              ),
              filled: true,
              fillColor:Color(0xFFF9F9F9),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomFormFieldColumn2 extends StatefulWidget {

  final TextEditingController controller;
  final String text;
  var onTap;
  double ?h;
  CustomFormFieldColumn2(
  {
     required this.controller, required this.text,this.h
});

  @override
  State<CustomFormFieldColumn2> createState() => _CustomFormFieldColumn2State();
}

class _CustomFormFieldColumn2State extends State<CustomFormFieldColumn2> {
bool _isObscure=false;

  @override
  Widget build(BuildContext context) {
    //   var dimension = Dimensions(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: TextStyle(
            fontSize: 15.sp,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: widget.h??68.h,
          child: TextField(
            maxLines: null, // Allow the text field to grow vertically
            expands: true,

            controller: widget.controller,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF9F9F9)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF9F9F9)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF9F9F9)),
              ),
              filled: true,
              fillColor:Color(0xFFF9F9F9),
            ),
          ),
        ),
      ],
    );
  }
}

class DefaultButton extends StatelessWidget {
  DefaultButton(
      {
        super.key,
        required this.onPressed,
        this.color = const Color(0xFFF4F9F3),
        this.borderRadius,
        required this.child,
      }
      );

  final Widget child;
  dynamic onPressed;
  double? borderRadius;

  Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // padding:  EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius??6),
        ),
      ),
      onPressed: onPressed,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.07,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
showDataAlert(
    {required BuildContext context,
      required Widget child,
      Color? surfaceTintColor}) {
  showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            // surfaceTintColor: Color(0xff213555),
            backgroundColor: Colors.white,
            content: child,
            surfaceTintColor: surfaceTintColor ?? Colors.white,
            // actionsPadding: EdgeInsets.zero,
            // contentPadding: EdgeInsets.zero,
            // buttonPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              // side: BorderSide(color: Colors.red)
            ),
          ),
        );
      });
}

Widget buildDropdown({
  required List<String> itemList,
  required String selectedValue,
  required String title,
  required Function(String?) onChanged,
  required BuildContext context,
  Color? titleColor,
  Color? color,
  dynamic width,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title),
      Container(
        decoration: BoxDecoration(
          color: Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(15.r),

        ),
        child: DropdownButton<String>(
          value: selectedValue,
          onChanged: onChanged,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          isExpanded: true,
          dropdownColor: Colors.white,
          focusColor: Colors.yellowAccent,
          autofocus: false,
          underline: Container(
            height: 0,
            color: Colors.deepPurpleAccent,
          ),
          items: itemList.map((itemValue) {
            return DropdownMenuItem(
              value: itemValue,
              child: Text(
                 itemValue,

              ),
            );
          }).toList(),
        ),
      ),
    ],
  );
}


// class DefaultDateFormField extends StatefulWidget {
//   DefaultDateFormField(
//       {super.key,
//         required this.controller,
//         this.title,
//         this.titleColor,
//         this.color,
//         this.onTap,
//         this.enabled = true,
//         this.validator,
//         this.width,
//         this.value,
//         this.onFieldSubmitted});
//
//   final TextEditingController controller;
//   Function()? onTap;
//   dynamic title;
//   dynamic enabled;
//   double? width;
//   String? value;
//   Color? titleColor;
//   dynamic color;
//   Function(String)? onFieldSubmitted;
//   dynamic validator;
//
//   @override
//   State<DefaultDateFormField> createState() => _DefaultDateFormFieldState();
// }
//
// class _DefaultDateFormFieldState extends State<DefaultDateFormField> {
//   @override
//   Widget build(BuildContext context) {
//
//     DateTime now = DateTime.now();
//     String formattedDate = intl.DateFormat('yyyy-MM-dd').format(now);
//     return SizedBox(
//       width: widget.width ?? dimension.width200,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           widget.title != ""
//               ? DefaultText(
//             text: widget.title,
//             color: widget.titleColor ?? Colors.black,
//           )
//               : const SizedBox.shrink(),
//           widget.title != ""
//               ? SizedBox(
//             height: dimension.height5,
//           )
//               : const SizedBox.shrink(),
//           SizedBox(
//             // height: MediaQuery.of(context).size.height * .05,
//             width: dimension.width300,
//             child: TextFormField(
//               controller: widget.controller,
//               enabled: widget.enabled ?? true,
//               style: const TextStyle(
//                   color: Colors.black, fontWeight: FontWeight.bold),
//               decoration: InputDecoration(
//                   hintText: widget.value ?? formattedDate,
//                   border: OutlineInputBorder(
//                     borderSide: const BorderSide(color: Colors.black),
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   hintStyle: const TextStyle(fontWeight: FontWeight.normal),
//                   filled: true,
//                   fillColor: widget.color ?? Colors.black,
//                   suffixIcon: const Icon(Icons.calendar_month)),
//               onTap: widget.onTap ??
//                       () async {
//                     DateTime? pickedDate = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(1990),
//                       lastDate: DateTime(2050),
//                     );
//                     if (pickedDate != null) {
//                       widget.controller.text =
//                           intl.DateFormat('yyyy-MM-dd').format(pickedDate);
//                       setState(() {});
//                     }
//                   },
//               validator: widget.validator ??
//                       (String? value) {
//                     if (value!.isEmpty) {
//                       return "يجب ادخال تاريخ";
//                     }
//                     return null;
//                   },
//               onFieldSubmitted: widget.onFieldSubmitted,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

