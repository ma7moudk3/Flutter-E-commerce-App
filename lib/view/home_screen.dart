import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:ecommerce_app/view/widgets/products_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final screenHight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade300),
                child: Center(
                  child: _searchTextFormField(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(
                text: 'Categories',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 20),
              _listViewCategory(),
              SizedBox(height: 50),
              ProductList()
            ],
          ),
        ),
      ),
    ));
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFE6E6E6),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return Container(
      height: 90,
      child: ListView.separated(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.shade200,
                ),
                height: 60,
                width: 60,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    'assets/icon_shoes.svg',
                    height: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              CustomText(
                text: 'test',
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 20,
        ),
      ),
    );
  }
}
