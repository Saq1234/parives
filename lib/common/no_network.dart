import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoNetworkWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/no_internet.svg',
              height: 240,
              width: 240,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'No Internet Connection',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Color(0xff00366F),
                  fontSize: 22,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'You are currently offline. Please check your internet connection and try again ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Color(0xff666666),
                    fontSize: 16,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
