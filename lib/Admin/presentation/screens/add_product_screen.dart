import 'dart:io';
import 'package:banner_carousel/banner_carousel.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce/Admin/logic/product_bloc/product_bloc.dart';
import 'package:ecommerce/Product/data/models/product.dart';
import 'package:ecommerce/Shared/presentation/widgets/custom_button.dart';
import 'package:ecommerce/Shared/presentation/widgets/custom_text_field.dart';
import 'package:ecommerce/Utils/constants.dart';
import 'package:ecommerce/Utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  String category = 'Mobiles';
  List<File> images = [];
  final GlobalKey<FormState> _addProductFormKey = GlobalKey<FormState>();
  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];

  @override
  void dispose() {
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  void selectImages() async {
    await pickImages().then((res) {
      if (res.isNotEmpty) {
        images.clear();
        setState(() {
          images.addAll(res);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is ProductPosted) {
          Navigator.of(context).pop(state.product);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            'Add Product',
            style: TextStyle(
              color: AppColors.PRIMARY_COLOR,
            ),
          ),
          leading: BackButton(
            color: AppColors.PRIMARY_COLOR,
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _addProductFormKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: images.isEmpty
                      ? DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
                          child: GestureDetector(
                            onTap: selectImages,
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.add_a_photo_rounded,
                                    size: 30,
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    'Choose Product Images',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: selectImages,
                          child: BannerCarousel(
                            animation: false,
                            activeColor: AppColors.PRIMARY_COLOR,
                            margin: EdgeInsets.zero,
                            customizedBanners: [
                              ...images.map((e) => Image.file(
                                    e,
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                  )),
                            ],
                          ),
                        ),
                ),
                CustomTextField(
                  controller: productNameController,
                  hintText: 'Product Name',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: descriptionController,
                  hintText: 'Description',
                  maxLines: 7,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: priceController,
                  hintText: 'Price',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: quantityController,
                  hintText: 'Quantity',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: category,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: productCategories.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        category = newVal!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10),
                BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    return CustomButton(
                      text: 'Post',
                      isLoading: state is ProductLoading,
                      onTap: () {
                        if (_addProductFormKey.currentState!.validate() &&
                            images.isNotEmpty) {
                          context.read<ProductBloc>().add(SellProduct(
                                  product: Product(
                                name: productNameController.text,
                                desc: descriptionController.text,
                                price: num.parse(priceController.text),
                                quantity: int.parse(quantityController.text),
                                category: category,
                                images:
                                    images.map((image) => image.path).toList(),
                              )));
                        }
                      },
                    );
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
