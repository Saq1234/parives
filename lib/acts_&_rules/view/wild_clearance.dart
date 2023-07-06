import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parivesh/acts_&_rules/view/pdf_page.dart';
import 'package:parivesh/common/no_network.dart';

import '../model/forest_clearance/acts_model.dart';
import '../model/forest_clearance/rules_model.dart';
import '../model/wild_clearance/guideline_model.dart';

class WildClearance extends StatefulWidget {
  const WildClearance({Key? key}) : super(key: key);

  @override
  State<WildClearance> createState() => _WildClearanceState();
}

class _WildClearanceState extends State<WildClearance> {
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
            title: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                child: Text(
                  "Wild Clearance",
                  maxLines: 2,
                )),
            titleSpacing: 2.0,
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
              child: Column(
                children: [
                  Card(
                    elevation: 2,
                    color: Colors.grey.shade100,
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.only(left: 10, right: 10),
                      title: Text(
                        "Acts",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height / 3,
                          child: Scrollbar(
                            isAlwaysShown: true,
                            thickness: 10,
                            showTrackOnHover: true,
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: ActsList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  ActsModel Actslist = ActsList[index];
                                  return Column(
                                    children: [
                                      Divider(color: Colors.black,),

                                      GestureDetector(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => PfdPage(
                                                  filepath: Actslist.url,
                                                ))),
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.picture_as_pdf,
                                            color: Colors.red,
                                          ),
                                          title: Text(
                                            Actslist.name.toString(),
                                            style: TextStyle(),
                                          ),
                                          minLeadingWidth: 2,
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Card(
                    elevation: 2,
                    color: Colors.grey.shade100,
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.only(left: 10, right: 10),
                      title: Text(
                        "Rules",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height / 3,
                          child: Scrollbar(
                            isAlwaysShown: true,
                            thickness: 10,
                            showTrackOnHover: true,
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: RulesList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  RulesModel Ruleslist = RulesList[index];
                                  return Column(
                                    children: [
                                      Divider(color: Colors.black,),

                                      GestureDetector(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => PfdPage(
                                                  filepath: Ruleslist.url,
                                                ))),
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.picture_as_pdf,
                                            color: Colors.red,
                                          ),
                                          title: Text(
                                            Ruleslist.name.toString(),
                                            style: TextStyle(),
                                          ),
                                          minLeadingWidth: 2,
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Card(
                    elevation: 2,
                    color: Colors.grey.shade100,
                    child: ExpansionTile(
                      title: Text(
                        "Guideline",
                        style: TextStyle(fontSize: 16),
                      ),
                      children: <Widget>[
                        Container(
                          height:GuidelineList.length>=2? MediaQuery.of(context).size.height / 3:100,
                          child: Scrollbar(
                            isAlwaysShown: true,
                            thickness: 10,
                            showTrackOnHover: true,
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: GuidelineList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  GuidelineModel Guidelinelist = GuidelineList[index];
                                  return Column(
                                    children: [
                                      Divider(color: Colors.black,),

                                      GestureDetector(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => PfdPage(
                                                  filepath: Guidelinelist.url,
                                                ))),
                                        child: ListTile(
                                          leading: Icon(
                                            Icons.picture_as_pdf,
                                            color: Colors.red,
                                          ),
                                          title: Text(
                                            Guidelinelist.name.toString(),
                                            style: TextStyle(),
                                          ),
                                          minLeadingWidth: 2,
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),


                ],
              ),
            ),
          )),
      ):NoNetworkWidget();
  }
}
