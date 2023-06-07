import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomWidgets{
  static void showLoaderDialog({required BuildContext context, required String message}) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(
              valueColor:AlwaysStoppedAnimation<Color>(Colors.blue)),
          SizedBox(width: 5,),
          Container(
              child: Text('$message...',style: TextStyle(fontFamily: 'Nunito'),)),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(child: alert, onWillPop: ()async=>false);
      },
    );
  }
  static void showLoaderDialogWithoutText({required BuildContext context}) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      content:
      Center(
        child: CircularProgressIndicator(
            valueColor:AlwaysStoppedAnimation<Color>(Color(0xff0091CD))),
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(child: alert, onWillPop: ()async=>false);
      },
    );
  }




}