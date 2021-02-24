import 'package:ecommerce_app/core/view_model/cart_view_model.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:ecommerce_app/view/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
        child: GetBuilder<CartViewModel>(
          init: CartViewModel(),
          builder: (controller) => ListView.builder(
              itemCount: controller.products.length,
              itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          controller.products[index].image,
                          height: 140,
                          width: 140,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(width: 30),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            CustomText(
                              text: controller.products[index].name,
                              textColor: Colors.black,
                              alignment: Alignment.topLeft,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              text: controller.products[index].price,
                              fontSize: 17,
                              textColor: Theme.of(context).primaryColor,
                              alignment: Alignment.topLeft,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(8)),
                              height: 30,
                              width: 95,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Colors.grey,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  CustomText(
                                    text: '1',
                                    textColor: Colors.grey,
                                    alignment: Alignment.center,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.minimize,
                                    color: Colors.grey,
                                    size: 18,
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CustomText(
                  text: "PRICE ",
                  fontSize: 12,
                  textColor: Colors.grey,
                ),
                CustomText(
                  text: '258 \$',
                  textColor: Theme.of(context).primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
              ],
            ),
            Container(
              //    padding: EdgeInsets.all(8),
              width: 190,
              height: 55,
              child: PrimaryButton(
                onPressed: () {},
                text: 'CHECKOUT',
              ),
            ),
          ],
        ),
      )
    ]));
  }
}
