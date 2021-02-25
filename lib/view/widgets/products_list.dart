import 'package:ecommerce_app/view/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'custom_text.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/core/view_model/home_view_model.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'Best Silling',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: 'See All',
                fontSize: 16,
                fontWeight: FontWeight.w200,
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, i) => SizedBox(
                width: 20,
              ),
              itemCount: controller.productModel.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Get.to(ProductDetailsScreen(
                      product: controller.productModel[index]));
                },
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100,
                      ),
                      child: Container(
                          height: 220,
                          width: MediaQuery.of(context).size.width * .4,
                          child: Image.network(
                            controller.productModel[index].image,
                            fit: BoxFit.fill,
                          )),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CustomText(
                      text: controller.productModel[index].name,
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CustomText(
                      text: controller.productModel[index].description,
                      textColor: Colors.grey,
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CustomText(
                      text: controller.productModel[index].price.toString() +
                          " \$",
                      textColor: Theme.of(context).primaryColor,
                      alignment: Alignment.topLeft,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
