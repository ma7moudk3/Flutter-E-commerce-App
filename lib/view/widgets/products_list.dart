import 'package:flutter/material.dart';
import 'custom_text.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
            itemCount: 10,
            itemBuilder: (context, index) => Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100,
                  ),
                  child: Container(
                      height: 220,
                      width: MediaQuery.of(context).size.width * .4,
                      child: Image.asset(
                        'assets/product.png',
                        fit: BoxFit.fill,
                      )),
                ),
                SizedBox(
                  height: 8,
                ),
                CustomText(
                  text: 'Leather Wristwatch',
                  alignment: Alignment.topLeft,
                ),
                SizedBox(
                  height: 8,
                ),
                CustomText(
                  text: 'Tag Heuer',
                  textColor: Colors.grey,
                  alignment: Alignment.topLeft,
                ),
                SizedBox(
                  height: 8,
                ),
                CustomText(
                  text: '205' + " \$",
                  textColor: Theme.of(context).primaryColor,
                  alignment: Alignment.topLeft,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
