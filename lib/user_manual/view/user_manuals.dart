import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserManulas extends StatefulWidget {
  const UserManulas({Key? key}) : super(key: key);

  @override
  State<UserManulas> createState() => _UserManulasState();
}

class _UserManulasState extends State<UserManulas> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 2,
            title: Text("User Manuals"),
          ),
          body:
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 15,right: 15),
            child: Column(
              children: [

              ],
            ),
          ),
        ));
  }

}
