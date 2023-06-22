import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parivesh/common/appColors.dart';
import 'package:parivesh/common/custom_widget.dart';
import 'package:parivesh/proposal/view/advance_search_porposal.dart';
import 'package:parivesh/proposal/view/track_proposal_dashboard.dart';
import 'package:provider/provider.dart';

import '../../common/no_network.dart';
import '../viewmodel/trackporposal_viewmodel.dart';

class TrackPorposal extends StatefulWidget {
  const TrackPorposal({Key? key}) : super(key: key);

  @override
  State<TrackPorposal> createState() => _TrackPorposalState();
}

class _TrackPorposalState extends State<TrackPorposal> {
  TextEditingController porposalController = TextEditingController();
  late ProposalViewModel porposalViewModel;
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
    porposalViewModel = Provider.of<ProposalViewModel>(context, listen: false);

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
    return _connectionStatus == true?
      SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('') ,
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.fitWidth
                )
            ),
          ),

        ),

        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child:
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Container(
                    height: MediaQuery.of(context).size.height/4,),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,),
                    child: Center(
                      child: Text(
                        "Track Your Proposal",
                        style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15,top: 50),
                    child: SingleChildScrollView(
                      child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Enter Proposal Number/Single Window Number:',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ))
                                ]),
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColor.black),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: TextField(
                              controller: porposalController,
                              decoration:  InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                border: InputBorder.none,
                                hintText: 'Enter Proposal Number/Single Window Number',
                              ),
                            ),
                          ),


                          Container(
                            height: MediaQuery.of(context).size.height/10,),
                          GestureDetector(
                            onTap: () {
                              if (porposalController.text.isNotEmpty) {
                                setState(() {
                                  porposalViewModel.getPorposalDetails(porposalNo: porposalController.text);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TrackPorposalDash()));
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  porposalController.clear();
                                });


                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text("Please fill Porposal Number"),
                                ));
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.green),
                              width: double.infinity,
                              child: Center(
                                  child: Text(
                                "Search",
                                style: TextStyle(fontWeight: FontWeight.bold,color: AppColor.whitecolor),
                              )),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const AdvanceSearchPorposal()));
                              porposalController.clear();

                            },
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.orange),
                              width: double.infinity,
                              child: Center(
                                  child: Text(
                                    "Show Advance Search",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),


                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ):NoNetworkWidget();
  }
}
