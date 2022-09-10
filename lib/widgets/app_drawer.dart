import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopbiz/adminscreens/add_product_page.dart';
import 'package:shopbiz/screens/main_screen.dart';
import 'package:shopbiz/utils/custom_color.dart';
import 'package:shopbiz/utils/text_style.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Drawer(
        child: ListView(
          children: [
            drawerHeader(),
            drawerItems(
              title: "Home Page",
              icon: FontAwesomeIcons.home,
              onTap: () {
                Navigator.pushReplacementNamed(context, MainPage.id);
              },
            ),
            drawerItems(
              title: "Admin Page",
              icon: FontAwesomeIcons.user,
              onTap: () {
                Navigator.pushReplacementNamed(context, AddProductPage.id);
              },
            ),
          ],
        ),
      ),
    );
  }

  ListTile drawerItems({
    required String title,
    required IconData icon,
    required GestureTapCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }

  DrawerHeader drawerHeader() {
    return DrawerHeader(
      padding: EdgeInsets.all(0.0),
      child: Container(
          color: primarycolor,
          child: Center(
            child: Text(
              "WELCOME TO SHOPBIZ",
              style: heading1,
              textAlign: TextAlign.center,
            ),
          )),
    );
  }
}
