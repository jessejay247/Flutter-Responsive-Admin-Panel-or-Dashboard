import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/pages/pageContent/message_page_content.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  // final GlobalKey<ScaffoldState> _contactKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      pageTitle: "Contact",

      // key: _contactKey,
      page: MessagePageContent(),
    );
  }
}
