import 'package:admin/components/cust_header_wid.dart';
import 'package:admin/components/cust_textbox.dart';
import 'package:admin/components/custom_button.dart';
import 'package:admin/helpers/constants.dart';
import 'package:admin/helpers/responsive.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/pages/pageContent/profile_page_content.dart';
import 'package:flutter/material.dart';

class MessagePageContent extends StatelessWidget {
  const MessagePageContent({Key key}) : super(key: key);

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
                  CustHeading(
                    title: "Support Form",
                    fontSize: 18,
                  ),
                  SizedBox(height: defaultPadding),
                  Text(
                    "Contact us using the contact form and we will respond immediately.",
                  ),
                  SizedBox(height: defaultPadding),
                  CustHeading(
                    title: "Subject *",
                  ),
                  SizedBox(height: defaultPadding * 0.1),
                  CustTextBox(
                    hintText: "Subject",
                  ),
                  SizedBox(height: defaultPadding),
                  CustHeading(
                    title: "Message *",
                  ),
                  SizedBox(height: defaultPadding * 0.1),
                  CustTextBox(
                    hintText: "Enter you message here",
                    maxLines: 5,
                  ),
                  SizedBox(height: defaultPadding),
                  CustButton(
                      icon: Icons.send_outlined,
                      onPressed: () {},
                      title: "Submit",
                      horizontalMult: 2)
                ],
              ),
              if (Responsive.isMobile(context))
                SizedBox(height: defaultPadding),
              if (Responsive.isMobile(context)) GetInTouchWid(),
            ],
          ),
        ),
        if (!Responsive.isMobile(context)) SizedBox(width: defaultPadding),
        if (!Responsive.isMobile(context))
          Expanded(
            flex: 2,
            child: GetInTouchWid(),
          ),
      ],
    );
  }
}

class GetInTouchWid extends StatelessWidget {
  const GetInTouchWid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustContainer(
      children: [
        CustHeading(
          title: "Get in touch",
          fontSize: 18,
        ),
        SizedBox(height: defaultPadding),
        Text(
          "If you need advice or have any question in mind or technical assistance, do not hesitate to contact our specialists.",
        ),
        SizedBox(height: defaultPadding),
        CustHeading(
          title: "Email",
        ),
        SizedBox(height: defaultPadding * 0.1),
        Text(
          "support@riftalliance.com",
        ),
        SizedBox(height: defaultPadding),
        CustHeading(
          title: "Address",
        ),
        SizedBox(height: defaultPadding * 0.1),
        Text(
          "Some place in the US",
        ),
      ],
    );
  }
}
