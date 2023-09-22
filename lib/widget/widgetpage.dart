import 'package:api_app/model/model.dart';
import 'package:flutter/material.dart';

class WidgetPage extends StatefulWidget {
   WidgetPage({super.key,required this.useritem});
 List<UserModel> useritem;

  @override
  State<WidgetPage> createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text(""),
        Text(""),
        Text(""),
        Text(""),
      ],),
    );
  }
}