import 'package:admin/components/cust_textbox.dart';
import 'package:admin/components/custom_button.dart';
import 'package:admin/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class LogPage2 extends StatefulWidget {
  const LogPage2({Key key}) : super(key: key);

  @override
  _LogPage2State createState() => _LogPage2State();
}

GlobalKey<FormState> _loginKey = GlobalKey();
bool show = false;

class _LogPage2State extends State<LogPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: SingleChildScrollView(
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
                            child:
                                Image.asset("assets/images/todovale-v2j.png"),
                          ),
                          Text(
                            "Sign In to TodoVale",
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.right,
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
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  height: defaultPadding,
                                ),
                                CustTextBox(
                                  width: 300,
                                  fillColor: primaryColor.withOpacity(0.1),
                                  hintText: "Enter Password",
                                  obscureText: show ? true : false,
                                  style: TextStyle(color: Colors.black),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        show = !show;
                                      });
                                    },
                                    hoverColor: transparent,
                                    child: Icon(
                                      show
                                          ? IconlyBroken.show
                                          : IconlyBroken.hide,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      hoverColor: transparent,
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
                                InkWell(
                                  child: Container(
                                    height: 50,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      // border: Border.all(
                                      //   color: Colors.blue,
                                      // ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Sign In",
                                        style: TextStyle(color: white),
                                      ),
                                    ),
                                  ),
                                ),

                                // CustButton(
                                //   // icon: Icons.chevron_right_outlined,
                                //   onPressed: () {},
                                //   title: "Sign In",
                                //   horizontalMult: 4.0,
                                // ),
                                SizedBox(
                                  height: defaultPadding,
                                ),
                                // Divider(
                                //   color: primaryColor,
                                // ),
                                // SizedBox(
                                //   height: defaultPadding,
                                // ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Not registered yet? ",
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
                                      hoverColor: transparent,
                                      child: Text(
                                        "Create an account",
                                        style: TextStyle(
                                          color: Colors.amber,
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
          Expanded(
            // flex: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/meeting.jpg",
                    ),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
