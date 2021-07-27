import 'dart:ui';

import 'package:admin/components/cust_textbox.dart';
import 'package:admin/components/custom_button.dart';
import 'package:admin/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/svg.dart';
import 'package:im_stepper/stepper.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _IconStepperDemo createState() => _IconStepperDemo();
}

class _IconStepperDemo extends State<RegistrationPage> {
  // THE FOLLOWING TWO VARIABLES ARE REQUIRED TO CONTROL THE STEPPER.
  int activeStep = 1; // Initial step set to 5.

  int upperBound = 3; // upperBound MUST BE total number of icons minus 1.

  GlobalKey<FormState> _step1Key = GlobalKey();
  GlobalKey<FormState> _step2Key = GlobalKey();
  GlobalKey<FormState> _step3Key = GlobalKey();

  String _fName, _lName, _email, _password, _cPassword, _refCode;
  bool _loading = false;
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200.withOpacity(0.5),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/coffee.jpg',
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
                child: Card(
                  color: transparent,
                  child: Container(
                    width: 400,
                    height: 550,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconStepper(
                          lineColor: bgColor, activeStepBorderColor: bgColor,
                          stepColor: transparent,
                          enableStepTapping: false,
                          activeStepColor: primaryColor,
                          icons: [
                            Icon(Icons.lock_outline),
                            Icon(Icons.person),
                            Icon(Icons.camera_alt_outlined),
                            Icon(Icons.check_circle_outline),
                          ],

                          // activeStep property set to activeStep variable defined above.
                          activeStep: activeStep,

                          // This ensures step-tapping updates the activeStep.
                          // onStepReached: (index) {
                          //   setState(() {
                          //     activeStep = index;
                          //   });
                          // },
                        ),
                        header(),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: bodyWidget(),
                          ),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     previousButton(),
                        //     nextButton(),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Returns the next button.
  Widget nextButton() {
    return ElevatedButton(
      onPressed: () {
        // Increment activeStep, when the next button is tapped. However, check for upper bound.
        if (activeStep < upperBound) {
          setState(() {
            activeStep++;
          });
        }
      },
      child: Text('Next'),
    );
  }

  /// Returns the previous button.
  Widget previousButton() {
    return ElevatedButton(
      onPressed: () {
        // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
      child: Text('Prev'),
    );
  }

  /// Returns the header wrapping the header text.
  Widget header() {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        // borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              headerText(),
              style: TextStyle(
                  // color: Colors.black,
                  // fontSize: 20,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  // Returns the header text based on the activeStep.
  String headerText() {
    switch (activeStep) {
      case 1:
        return 'Personal';

      case 2:
        return 'Image';

      case 3:
        return 'Finish';

      default:
        return 'Account';
    }
  }

  // Returns the body widgets based on the activeStep.
  Widget bodyWidget() {
    switch (activeStep) {
      case 1:
        return stepperTwo();

      case 2:
        return stepperThree();

      case 3:
        return stepperFour();

      default:
        return stepperOne();
    }
  }

  Widget stepperOne() {
    return Form(
      key: _step1Key,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          SizedBox(
            height: defaultPadding,
          ),
          CustTextBox(
            width: 300,
            validator: validateEmail,
            onChanged: (val) {
              _email = val;
            },
            fillColor: primaryColor.withOpacity(0.1),
            hintText: "Enter Email",
          ),
          SizedBox(
            height: defaultPadding,
          ),
          CustTextBox(
            width: 300,
            onChanged: (val) {
              _refCode = val;
            },
            fillColor: primaryColor.withOpacity(0.1),
            hintText: "Enter Referer Code",
          ),
          SizedBox(
            height: defaultPadding,
          ),
          CustTextBox(
            width: 300,
            obscureText: obscureText,
            validator: validatePassword,
            onChanged: (val) {
              _password = val;
            },
            fillColor: primaryColor.withOpacity(0.1),
            hintText: "Enter Password",
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: Icon(
                obscureText ? IconlyBroken.show : IconlyBroken.hide,
                color: bgColor,
              ),
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          CustTextBox(
            width: 300,
            validator: validateCPassword,
            obscureText: obscureText,
            onChanged: (val) {
              _cPassword = val;
            },
            fillColor: primaryColor.withOpacity(0.1),
            hintText: "Confirm Password",
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: Icon(
                obscureText ? IconlyBroken.show : IconlyBroken.hide,
                color: bgColor,
              ),
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          CustButton(
            // icon: Icons.chevron_right_outlined,
            onPressed: () {
              if (_step1Key.currentState.validate()) {
                try {
                  _step1Key.currentState.save();
                  if (activeStep < upperBound) {
                    setState(() {
                      activeStep++;
                    });
                  }
                } catch (e) {
                  print(e);
                }
              }
            },
            title: "Next",
            horizontalMult: 5.0,
          )
        ],
      ),
    );
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  String validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    if (value.trim().length <= 0) {
      return "Password is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Upper,Lower Case, Number and Special chars";
    }

    return null;
  }

  String validateCPassword(String value) {
    if (value.trim().length <= 0) {
      return "Confirm Password is Required";
    } else if (value != _password) {
      return "Passwords don't match";
    }
    return null;
  }

  Widget stepperTwo() {
    return Form(
      key: _step2Key,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          SizedBox(
            height: defaultPadding,
          ),
          CustTextBox(
            width: 300,
            onChanged: (val) {
              _fName = val;
            },
            validator: validateName,
            fillColor: primaryColor.withOpacity(0.1),
            hintText: "First Name",
          ),
          SizedBox(
            height: defaultPadding,
          ),
          CustTextBox(
            width: 300,
            onChanged: (val) {
              _lName = val;
            },
            validator: validateName,
            fillColor: primaryColor.withOpacity(0.1),
            hintText: "Last Name",
          ),
          SizedBox(
            height: defaultPadding,
          ),
          CustTextBox(
            width: 300,
            fillColor: primaryColor.withOpacity(0.1),
            hintText: "Enter Address",
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustButton(
                // icon: Icons.chevron_right_outlined,
                onPressed: () {
                  if (activeStep > 0) {
                    setState(() {
                      activeStep--;
                    });
                  }
                },

                title: "Previous",
                horizontalMult: 2.0,
              ),
              CustButton(
                // icon: Icons.chevron_right_outlined,
                onPressed: () {
                  if (_step2Key.currentState.validate()) {
                    try {
                      _step2Key.currentState.save();
                      if (activeStep < upperBound) {
                        setState(() {
                          activeStep++;
                        });
                      }
                    } catch (e) {
                      print(e);
                    }
                  }
                },
                title: "Next",
                horizontalMult: 2.0,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String validateName(String value) {
    String pattern = r'(^(?=[a-zA-Z]{3,20}$)(?!.*[_]{2})[^_])';
    // String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.trim().length <= 2) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name can contain alphanumeric and _";
    }
    return null;
  }

  Widget stepperThree() {
    return Form(
      key: _step1Key,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          SizedBox(
            height: defaultPadding,
          ),
          InkWell(
            onTap: () {},
            hoverColor: Colors.transparent,
            child: Container(
              height: 200,
              child: SvgPicture.asset(
                "assets/svgs/image-gallery.svg",
                color: Theme.of(context).primaryColor,
                height: 100,
              ),
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Text(
            "Pick Profile Image",
            style: TextStyle(
              color: primaryColor,
              // fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustButton(
                // icon: Icons.chevron_right_outlined,
                onPressed: () {
                  if (activeStep > 0) {
                    setState(() {
                      activeStep--;
                    });
                  }
                },
                title: "Previous",
                horizontalMult: 2.0,
              ),
              CustButton(
                // icon: Icons.chevron_right_outlined,
                onPressed: () {
                  if (activeStep < upperBound) {
                    setState(() {
                      activeStep++;
                    });
                  }
                },
                title: "Next",
                horizontalMult: 2.0,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget stepperFour() {
    return Form(
      key: _step1Key,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          SizedBox(
            height: defaultPadding,
          ),
          Text(
            "Are you sure the informations provided by you are correct?",
            style: TextStyle(
              color: primaryColor,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustButton(
                // icon: Icons.chevron_right_outlined,
                onPressed: () {},
                title: "Yes, Proceed",
                horizontalMult: 2.0,
              ),
              SizedBox(
                height: defaultPadding,
              ),
              CustButton(
                // icon: Icons.chevron_right_outlined,
                onPressed: () {
                  if (activeStep > 0) {
                    setState(() {
                      activeStep--;
                    });
                  }
                },
                title: "No, take me back",
                horizontalMult: 2.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
