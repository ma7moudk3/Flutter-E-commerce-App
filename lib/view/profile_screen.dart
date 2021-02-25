import 'package:ecommerce_app/core/view_model/profile_view_model.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      builder: (controller) => Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Row(
              children: [
                SizedBox(width: 30),
                CircleAvatar(
                  maxRadius: 50,
                  backgroundImage:
                      (controller.user == null || controller.user.picture == "")
                          ? AssetImage('assets/user.jpg')
                          : NetworkImage(controller.user.picture),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: controller.user.name,
                      fontSize: 22,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    CustomText(
                      text: controller.user.email,
                      fontSize: 14,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            profileListTile('Edit Profile', 'icon_edit_profile.svg'),
            profileListTile('Shipping Address', 'icon_location.svg'),
            profileListTile('Order History', 'icon_clock.svg'),
            profileListTile('Cards', 'icon_cards.svg'),
            profileListTile('Notifications', 'icon_notifications.svg'),
            profileListTile('Logout', 'icon_logout.svg'),
          ],
        ),
      ),
    );
  }

  Padding profileListTile(String title, String icon) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: ListTile(
          leading: Container(
              height: 40,
              width: 40,
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0x1200C569)),
              child: SvgPicture.asset(
                'assets/$icon',
                height: 20,
                width: 20,
              )),
          title: CustomText(
            text: title,
            fontSize: 16,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
            size: 15,
          )),
    );
  }
}
