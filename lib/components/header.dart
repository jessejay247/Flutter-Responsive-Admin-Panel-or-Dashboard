import 'package:admin/components/cust_header_wid.dart';
import 'package:admin/controllers/MenuController.dart';
import 'package:admin/helpers/constants.dart';
import 'package:admin/helpers/responsive.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class Header extends StatefulWidget {
  const Header({
    Key key,
    @required this.pageTitle,
  }) : super(key: key);

  final String pageTitle;

  @override
  _HeaderState createState() => _HeaderState();
}

// final GlobalKey<ScaffoldState> _dashKey = GlobalKey<ScaffoldState>();
// GlobalKey<ScaffoldState> get dashKey => _dashKey;

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (!Responsive.isDesktop(context))
              IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer()
                  // {
                  //   if (!_dashKey.currentState!.isDrawerOpen) {
                  //     _dashKey.currentState!.openDrawer();
                  //   }
                  // }
                  ),
            if (!Responsive.isMobile(context))
              Text(
                widget.pageTitle,
                style: Theme.of(context).textTheme.headline6,
              ),
          ],
        ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        // Expanded(child: SearchField()),
        ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatefulWidget {
  const ProfileCard({
    Key key,
  }) : super(key: key);

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/profile_pic.png",
                height: 38,
              ),
              if (!Responsive.isMobile(context))
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding / 2),
                  child: Text("Angelina Joli"),
                ),
              InkWell(
                onTap: () => setState(() {
                  isOpen = !isOpen;
                }),
                child: Icon(isOpen
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down),
              ),
            ],
          ),
          isOpen
              ? Container(
                  height: 225,
                  width: 200,
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: defaultPadding),
                      Text("Account Balance"),
                      // SizedBox(height: defaultPadding),
                      CustHeading(
                        title: "USD 2000",
                        fontSize: 22,
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.person),
                          SizedBox(width: defaultPadding),
                          Text("View Profile"),
                        ],
                      ),
                      SizedBox(height: defaultPadding),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.security),
                          SizedBox(width: defaultPadding),
                          Text("Security"),
                        ],
                      ),
                      Divider(),
                      SizedBox(height: defaultPadding * 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.logout),
                          SizedBox(width: defaultPadding),
                          Text("Log Out"),
                        ],
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
