import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parivesh/acts_&_rules/view/pdf_page.dart';
import 'package:parivesh/acts_&_rules/view/wild_clearance.dart';
import 'package:parivesh/common/no_network.dart';
import 'actsrulesDetails.dart';
import 'forest_clearance.dart';
import 'national_campa.dart';

class ActsAndRules extends StatefulWidget {
  const ActsAndRules({Key? key}) : super(key: key);

  @override
  State<ActsAndRules> createState() => _ActsAndRulesState();
}

class _ActsAndRulesState extends State<ActsAndRules> {
  bool _connectionStatus = true;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
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

  @override
  Widget build(BuildContext context) {
    return  _connectionStatus == true?
      SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,

          appBar: AppBar(
        titleSpacing: 2.0,
        title: Text(
          "Acts and Rules",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [actsrules()],
          ),
        ),
      ),
    )):NoNetworkWidget();
  }

  Widget actsrules() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ActsrulesDetails())),
                child: Card(
                  color: Colors.grey.shade100,
                  elevation: 5,
                  child: Container(
                    margin: EdgeInsets.all(15),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Text(
                          "Environment Clearance",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForestClearance())),
                child: Card(
                  color: Colors.grey.shade100,
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Text(
                          "Forest Clearance",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WildClearance())),
                child: Card(
                  elevation: 5,
                  color: Colors.grey.shade100,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Text(
                          "Wildlife Clearance",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PfdPage(
                          filepath: "https://environmentclearance.nic.in/writereaddata/om/30052020WildlifeAdvisorySpecies.pdf",
                        ))),
                child: Card(
                  elevation: 5,
                  color: Colors.grey.shade100,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Text(
                          "Advisory on Exotic Live Species",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NationalCampa())),
                child: Card(
                  elevation: 5,
                  color: Colors.grey.shade100,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Text(
                          "National CAMPA",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
