import 'package:admin/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// In this tutorial we implement a multi page form
// based on the IndexedStack and TextField widgets.
//
// For detailed explanation and step by step guide,
// please have a look at the respective article
// on medium.com
//
//
//
// This tutorial follows 5 simple steps:
//
// Step 1 - Set Up The UI
// Step 2 - Switch Between TextFields
// Step 3 - Fetch User Input
// Step 4 - Validate User Input
// Step 5 - Save The Form

// Step 1 - Set Up The UI

class RegPage2 extends StatefulWidget {
  RegPage2({
    Key key,
  }) : super(key: key);

  @override
  _RegPage2State createState() => _RegPage2State();
}

class _RegPage2State extends State<RegPage2> {
  /// Tracks the active widget shown in the stack
  int _formIndex = 0;

  // Step 2 - Switch Between TextFields
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  // Step 3 - Fetch User Input
  var _fName = '';
  var _lName = '';
  var _email = '';
  var _phone = '';
  var _password = '';
  var _cPassword = '';

  // Step 4 - Validate User Input
  var _emailValid = false;
  var _emailError = '';
  var _passwordValid = false;
  var _passwordError = '';

  // Step 2 - Switch Between TextFields
  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  /// Switches InputField by setting [_formIndex] to [newIndex]
  void _switchInputField(int newIndex) {
    setState(() {
      _formIndex = newIndex;
    });
    newIndex == 0
        ? FocusScope.of(context).requestFocus(_emailFocusNode)
        : FocusScope.of(context).requestFocus(_passwordFocusNode);
  }

  // Step 4 - Validate User Input
  void _validateFName() {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email)) {
      setState(() {
        _emailValid = true;
        _emailError = '';
      });
    } else {
      setState(() {
        _emailValid = false;
        _emailError = 'Please enter a valid email address';
      });
    }
  }

  void _validateLName() {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email)) {
      setState(() {
        _emailValid = true;
        _emailError = '';
      });
    } else {
      setState(() {
        _emailValid = false;
        _emailError = 'Please enter a valid email address';
      });
    }
  }

  /// Checks if email input fits common email pattern
  void _validateEmail() {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email)) {
      setState(() {
        _emailValid = true;
        _emailError = '';
      });
    } else {
      setState(() {
        _emailValid = false;
        _emailError = 'Please enter a valid email address';
      });
    }
  }

  void _validatePhone() {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email)) {
      setState(() {
        _emailValid = true;
        _emailError = '';
      });
    } else {
      setState(() {
        _emailValid = false;
        _emailError = 'Please enter a valid email address';
      });
    }
  }

  /// Checks if password input has at least 5 characters
  void _validatePassword() {
    if (_password.length >= 5) {
      setState(() {
        _passwordValid = true;
        _passwordError = '';
      });
    } else {
      setState(() {
        _passwordValid = false;
        _passwordError = 'Your password should contain at least 5 characters';
      });
    }
  }

  void _validateConfirmPassword() {
    if (_password.length >= 5) {
      setState(() {
        _passwordValid = true;
        _passwordError = '';
      });
    } else {
      setState(() {
        _passwordValid = false;
        _passwordError = 'Your password should contain at least 5 characters';
      });
    }
  }

  // Step 5 - Save The Form
  void _saveForm() {
    // implement your logic here
    showDialog(
      context: context,
      builder: (_) => SimpleDialog(
        contentPadding: EdgeInsets.all(8),
        children: <Widget>[
          Text('You succesfully saved your form.'),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cool, thanks.'),
          ),
        ],
      ),
    );
  }

  // Step 1 - Set Up The UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bus_woman.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 100, 20, 10),
              child: SingleChildScrollView(
                child: Container(
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Let Us get you started today with a Todovale Investor account",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: defaultPadding * 3,
                      ),
                      IndexedStack(
                        index: _formIndex,
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Enter your first name",
                            ),
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,

                            // Step 3 - Fetch User Input
                            onChanged: (value) {
                              setState(() {
                                _email = value;
                              });
                            },

                            // Step 4 - Validate User Input
                            onSubmitted: (value) {
                              _validateEmail();

                              // Step 2 - Switch Between TextFields
                              if (_emailValid) {
                                _switchInputField(_formIndex + 1);
                              }
                            },

                            // Step 2 - Switch Between TextFields
                            focusNode: _emailFocusNode,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Enter your last name",
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,

                            // Step 3 - Fetch User Input
                            onChanged: (value) {
                              setState(() {
                                _email = value;
                              });
                            },

                            // Step 4 - Validate User Input
                            onSubmitted: (value) {
                              _validateEmail();

                              // Step 2 - Switch Between TextFields
                              if (_emailValid) {
                                _switchInputField(_formIndex + 1);
                              }
                            },

                            // Step 2 - Switch Between TextFields
                            focusNode: _emailFocusNode,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Enter your valid email address",
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,

                            // Step 3 - Fetch User Input
                            onChanged: (value) {
                              setState(() {
                                _email = value;
                              });
                            },

                            // Step 4 - Validate User Input
                            onSubmitted: (value) {
                              _validateEmail();

                              // Step 2 - Switch Between TextFields
                              if (_emailValid) {
                                _switchInputField(_formIndex + 1);
                              }
                            },

                            // Step 2 - Switch Between TextFields
                            focusNode: _emailFocusNode,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Enter your phone number",
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,

                            // Step 3 - Fetch User Input
                            onChanged: (value) {
                              setState(() {
                                _email = value;
                              });
                            },

                            // Step 4 - Validate User Input
                            onSubmitted: (value) {
                              _validateEmail();

                              // Step 2 - Switch Between TextFields
                              if (_emailValid) {
                                _switchInputField(_formIndex + 1);
                              }
                            },

                            // Step 2 - Switch Between TextFields
                            focusNode: _emailFocusNode,
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {},
                                hoverColor: Colors.transparent,
                                child: Center(
                                  child: Container(
                                    height: 200,
                                    child: SvgPicture.asset(
                                      "assets/svgs/photo.svg",
                                      // color: Theme.of(context).primaryColor,
                                      height: 100,
                                    ),
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
                            ],
                          ),
                          TextField(
                            decoration: InputDecoration(
                                labelText: 'Set your login password'),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            textInputAction: TextInputAction.done,

                            // Step 3 - Fetch User Input
                            onChanged: (value) {
                              setState(() {
                                _password = value;
                              });
                            },

                            // Step 4 - Validate User Input
                            onSubmitted: (value) {
                              _validatePassword();
                              if (_passwordValid) {
                                _saveForm();
                              } else {
                                // Focus the TextField again after unsuccessful submit
                                FocusScope.of(context)
                                    .requestFocus(_passwordFocusNode);
                              }
                            },

                            // Step 2 - Switch Between TextFields
                            focusNode: _passwordFocusNode,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                labelText: 'Confirm your password'),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            textInputAction: TextInputAction.done,

                            // Step 3 - Fetch User Input
                            onChanged: (value) {
                              setState(() {
                                _password = value;
                              });
                            },

                            // Step 4 - Validate User Input
                            onSubmitted: (value) {
                              _validatePassword();
                              if (_passwordValid) {
                                _saveForm();
                              } else {
                                // Focus the TextField again after unsuccessful submit
                                FocusScope.of(context)
                                    .requestFocus(_passwordFocusNode);
                              }
                            },

                            // Step 2 - Switch Between TextFields
                            focusNode: _passwordFocusNode,
                          ),
                        ],
                      ),
                      Container(
                        child: _formIndex == 0
                            ? Text(_emailError)
                            : Text(_passwordError),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          _formIndex == 0
                              ? Container()
                              : TextButton(
                                  onPressed: () {
                                    _switchInputField(_formIndex - 1);
                                  },
                                  child: Text('Back'),
                                ),

                          // Step 5 - Save The Form
                          _formIndex == 6
                              ? TextButton(
                                  onPressed: () {
                                    _validatePassword();
                                    if (_passwordValid) {
                                      _saveForm();
                                    }
                                  },
                                  child: Text('Submit'),
                                )
                              : TextButton(
                                  onPressed: () {
                                    _validateEmail();
                                    if (_emailValid) {
                                      // Step 2 - Switch Between TextFields
                                      _switchInputField(_formIndex + 1);
                                    }
                                  },
                                  child: Text('Next'),
                                ),
                        ],
                      ),
                    ],
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
