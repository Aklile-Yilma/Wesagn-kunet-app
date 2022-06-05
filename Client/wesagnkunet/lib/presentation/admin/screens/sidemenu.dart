import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DrawerListTile(
              title: "Dashboard",
              icon: Icon(Icons.dashboard),
              press: () {
                context.go("admin/dashboard");
              },
            ),
            DrawerListTile(
              title: "Users",
              icon: Icon(Icons.verified_user_sharp),
              press: () {
                context.go("admin/users");
              },
            ),
            DrawerListTile(
              title: "Certificates",
              icon: Icon(Icons.folder),
              press: () {
                context.go("admin/certificates");
              },
            ),
            DrawerListTile(
              title: "Notification",
              icon: Icon(Icons.notifications),
              press: () {
                context.go("admin/"); 
              },
            ),
            DrawerListTile(
              title: "Profile",
              icon: Icon(Icons.account_box),
              press: () {
                context.go("admin/dashboard"); 
              },
            ),
            DrawerListTile(
              title: "Settings",
              icon: Icon(Icons.settings),
              press: () {
                context.go("admin/settings"); //TODO the route
              },
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                // color: Colors.white54,
              ),
              child: Image(
                color: Colors.white,
                width: 150,
                height: 150,
                image: AssetImage("assets/images/logo-primary.png"),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String title;
  final Icon icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,

      // color: Colors.blueGrey,

      child: ListTile(
        onTap: press,
        horizontalTitleGap: 0.0,
        leading: icon,
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
