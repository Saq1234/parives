import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:parivesh/acts_&_rules/view/acts_&_rules.dart';
import 'package:parivesh/common/no_network.dart';
import 'package:parivesh/login/view/login.dart';
import 'package:parivesh/proposal/view/track_proposal.dart';
import '../../common/app_routes.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _connectionStatus = true;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        setState(() => _connectionStatus = true);
        break;
      case ConnectivityResult.mobile:
        setState(() => _connectionStatus = true);
        break;
      case ConnectivityResult.none:
        setState(() => _connectionStatus = false);
        break;
      default:
        setState(() => _connectionStatus = true);
        break;
    }
  }
  final List<String> imgList = [
      "https://parivesh.nic.in/singlewindow_css/images/banner13.jpg",
      "https://parivesh.nic.in/singlewindow_css/images/August1",
    "https://parivesh.nic.in/singlewindow_css/images/banner11.jpg",
    "https://parivesh.nic.in/singlewindow_css/images/banner15.png",
  ];

  @override
  Widget build(BuildContext context) {
    return _connectionStatus == true
        ? SafeArea(
            child: Scaffold(
              // backgroundColor: Color(0xffE8F8F5),
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Text(''),
                centerTitle: true,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/logo.png'), fit: BoxFit.fitWidth)),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Stack(
                        children: [
                          Container(decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                            child: ImageSlideshow(
                              isLoop: true,
                              autoPlayInterval: 3000,
                              children: [
                                Image.asset("assets/images/login/banner1.jpg",height: 200,fit: BoxFit.fill),
                                Image.asset(
                                  "assets/images/login/banner2.jpg",height: 200,fit: BoxFit.fill,
                                ),
                                Image.asset(
                                  "assets/images/login/banner3.png",height: 200,fit: BoxFit.fill,
                                  // fit: BoxFit.cover,
                                ), Image.asset(
                                  "assets/images/login/August15.jpg",height: 200,fit: BoxFit.fill,
                                  // fit: BoxFit.cover,
                                ),

                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  Login())),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                width: 100,
                                height: 40,
                                child: Card(

                                  margin: EdgeInsets.only(top: 10,right: 20),
                                  color: Color(0xffFCF3CF),
                                   shape: RoundedRectangleBorder(),
                                  elevation: 10,
                                  child: Center(
                                      child: Text(
                                    "Login",
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                                  )),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 20,),



                      GestureDetector(
                        onTap: () =>
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const TrackPorposal())),
                        child: Card(
                          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          color: Colors.white,
                          elevation: 10,
                          child: Container(
                            height: MediaQuery.of(context).size.height / 5,
                            decoration:
                                BoxDecoration(border: Border.all(color: Colors.black), color: Color(0xffD6EAF8)),
                            child: Center(
                                child: Text(
                              "Track Your Proposal",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            )),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () =>
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ActsAndRules())),
                        child: Card(
                          color: Colors.white,
                          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          elevation: 10,
                          child: Container(
                            height: MediaQuery.of(context).size.height / 5,
                            decoration:
                                BoxDecoration(border: Border.all(color: Colors.black), color: Color(0xffE9F7EF)),
                            child: Center(
                                child: Text(
                              "Act & Rules",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            )),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, AppRoutes.usermanuals),
                        child: Card(
                          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          color: Colors.white,
                          elevation: 10,
                          child: Container(
                            height: MediaQuery.of(context).size.height / 5,
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.only(bottomRight: Radius.circular(200))   ,                   color: Color(0XffD2CFC8),
                                border: Border.all(color: Colors.black),
                                color: Color(0xffEAECEE)),
                            child: Center(
                                child: Text(
                              "User Manuals",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : NoNetworkWidget();
  }
}
