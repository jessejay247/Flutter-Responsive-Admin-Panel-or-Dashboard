import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 100,
            margin: const EdgeInsets.symmetric(vertical: 50),
            child: DrawerHeader(
              child: Image.asset("assets/images/rift-alliance.png"),
              // child: Image.asset("assets/images/todovale-v2j.png"),
            ),
          ),
          DrawerListTile(
            title: "Dashbord",
            svgSrc: "assets/icons/menu_dashbord.svg",
            routeName: "/",
          ),
          DrawerListTile(
            title: "Transaction",
            svgSrc: "assets/icons/menu_tran.svg",
            routeName: "/transaction",
          ),
          DrawerListTile(
            title: "Investment Plans",
            svgSrc: "assets/icons/menu_task.svg",
            routeName: "/investments",
          ),
          DrawerListTile(
            title: "Withdraw",
            svgSrc: "assets/icons/menu_doc.svg",
            routeName: "/withdraw",
          ),
          DrawerListTile(
            title: "Referrals",
            svgSrc: "assets/icons/menu_store.svg",
            routeName: "/referral",
          ),
          DrawerListTile(
            title: "Notification",
            svgSrc: "assets/icons/menu_notification.svg",
            routeName: "/contact",
          ),
          DrawerListTile(
            title: "Profile",
            svgSrc: "assets/icons/menu_profile.svg",
            routeName: "/profile",
          ),
          DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
            routeName: "/settings",
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key key,
    // For selecting those three line once press "Command+D"
    @required this.title,
    @required this.svgSrc,
    @required this.routeName,
  }) : super(key: key);

  final String title, svgSrc, routeName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, routeName),
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Theme.of(context).primaryColor,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(
            // color: Colors.white54,
            ),
      ),
    );
  }
}
