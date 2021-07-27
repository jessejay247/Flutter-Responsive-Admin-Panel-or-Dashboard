import 'dart:ui';

import 'package:admin/components/cust_textbox.dart';
import 'package:admin/components/custom_button.dart';
import 'package:admin/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

GlobalKey<FormState> _loginKey = GlobalKey();
bool show = false;

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.5),
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/pencilBg.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: 1000,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: white.withOpacity(0.0),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: SingleChildScrollView(
                child: Card(
                  // elevation: 5,
                  color: white,
                  child: Container(
                    width: 400,
                    height: 500,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: defaultPadding * 2,
                          ),
                          Container(
                            height: 100,
                            // margin: const EdgeInsets.symmetric(vertical: 50),
                            child: DrawerHeader(
                              child: Image.asset(
                                  "assets/images/rift-alliance.png"),
                              // child: Image.asset("assets/images/todovale-v2j.png"),
                            ),
                          ),
                          Form(
                            key: _loginKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: defaultPadding * 2,
                                ),
                                CustTextBox(
                                  width: 300,
                                  fillColor: primaryColor.withOpacity(0.1),
                                  hintText: "Enter Address",
                                  style: TextStyle(color: bgColor),
                                ),
                                SizedBox(
                                  height: defaultPadding,
                                ),
                                CustTextBox(
                                  width: 300,
                                  fillColor: primaryColor.withOpacity(0.1),
                                  hintText: "Enter Password",
                                  obscureText: show ? true : false,
                                  style: TextStyle(color: bgColor),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        show = !show;
                                      });
                                    },
                                    child: Icon(
                                      show
                                          ? IconlyBroken.show
                                          : IconlyBroken.hide,
                                      color: bgColor,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        "Forget Password?",
                                        style: TextStyle(
                                          color: primaryColor,
                                          // fontSize: 20,
                                          // fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: defaultPadding,
                                ),
                                CustButton(
                                  // icon: Icons.chevron_right_outlined,
                                  onPressed: () {},
                                  title: "Login",
                                  horizontalMult: 2.0,
                                ),
                                SizedBox(
                                  height: defaultPadding,
                                ),
                                Divider(
                                  color: primaryColor,
                                ),
                                SizedBox(
                                  height: defaultPadding,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't have an account? ",
                                      style: TextStyle(
                                        color: primaryColor,
                                        // fontSize: 20,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      width: defaultPadding / 5,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        "Sign Up ",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          // fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
