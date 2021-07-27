import 'dart:html' as html;

import 'package:admin/components/cust_textbox.dart';
import 'package:admin/components/custom_button.dart';
import 'package:admin/helpers/constants.dart';
import 'package:admin/helpers/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:path/path.dart' as Path;
import 'package:mime_type/mime_type.dart';

class ProfilePageContent extends StatefulWidget {
  const ProfilePageContent({Key key}) : super(key: key);

  @override
  _ProfilePageContentState createState() => _ProfilePageContentState();
}

class _ProfilePageContentState extends State<ProfilePageContent> {
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            children: [
              CustContainer(
                children: [
                  Row(
                    children: [
                      Text("Full Name: "),
                      SizedBox(width: defaultPadding),
                      Expanded(
                        child: CustTextBox(
                          controller: controller,
                          hintText: "First Name",
                          // width: 150.0,
                        ),
                      ),
                      SizedBox(width: defaultPadding),
                      Expanded(
                        child: CustTextBox(
                          controller: controller,
                          hintText: "Last Name",
                          // width: 150.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      Text("Phone: "),
                      SizedBox(width: defaultPadding),
                      Expanded(
                        child: CustTextBox(
                          controller: controller,
                          hintText: "Phone Number",
                          // width: 150.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      Text("Email: "),
                      SizedBox(width: defaultPadding),
                      Expanded(
                        child: CustTextBox(
                          controller: controller,
                          hintText: "Email",
                          // width: 150.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      Text("Address: "),
                      SizedBox(width: defaultPadding),
                      Expanded(
                        child: CustTextBox(
                          controller: controller,
                          hintText: "Address",
                          width: 150.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Row(
                    children: [
                      Text("Phone: "),
                      SizedBox(width: defaultPadding),
                      Expanded(
                        child: CustTextBox(
                          controller: controller,
                          hintText: "State",
                          // width: 150.0,
                        ),
                      ),
                      SizedBox(width: defaultPadding),
                      Expanded(
                        child: CustTextBox(
                          controller: controller,
                          hintText: "City",
                          // width: 150.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: defaultPadding),
                  Center(
                    child: CustButton(
                      icon: IconlyBroken.edit,
                      onPressed: () {},
                      title: "Update Profile",
                      horizontalMult: 3,
                    ),
                  ),
                ],
              ),
              if (Responsive.isMobile(context))
                SizedBox(height: defaultPadding),
              if (Responsive.isMobile(context)) ProfilePhotoWid(),
            ],
          ),
        ),
        if (!Responsive.isMobile(context)) SizedBox(width: defaultPadding),
        if (!Responsive.isMobile(context))
          Expanded(
            flex: 2,
            child: ProfilePhotoWid(),
          )
      ],
    );
  }
}

class ProfilePhotoWid extends StatefulWidget {
  const ProfilePhotoWid({
    Key key,
  }) : super(key: key);

  @override
  _ProfilePhotoWidState createState() => _ProfilePhotoWidState();
}

html.File _cloudFile;
var _fileBytes;
Image _imageWidget;

class _ProfilePhotoWidState extends State<ProfilePhotoWid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustContainer(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Account Photo",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: defaultPadding),
            _fileBytes != null
                ? Container(
                    height: 60,
                    width: 60,
                    // decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //         image: AssetImage(_pickedImage.relativePath))),
                    child: Image.memory(_fileBytes))
                : SvgPicture.asset(
                    "assets/svgs/man.svg", height: 50,
                    // color: info.color,
                  ),
            SizedBox(height: defaultPadding),
            Center(
              child: CustButton(
                icon: IconlyBroken.image,
                onPressed: pickImage,
                title: "Change Photo",
                horizontalMult: 3,
              ),
            ),
          ],
        ),
        // SizedBox(height: defaultPadding),
        // CustContainer(
        //   children: [Container()],
        // ),
      ],
    );
  }

  pickImage() async {
    var mediaData = await ImagePickerWeb.getImageInfo;
    String mimeType = mime(Path.basename(mediaData.fileName));
    html.File mediaFile =
        new html.File(mediaData.data, mediaData.fileName, {'type': mimeType});

    if (mediaFile != null) {
      setState(() {
        _cloudFile = mediaFile;
        _fileBytes = mediaData.data;
        _imageWidget = Image.memory(mediaData.data);
      });
    }
  }
}

class CustContainer extends StatelessWidget {
  const CustContainer({
    Key key,
    @required this.children,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
  }) : super(key: key);

  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }
}
