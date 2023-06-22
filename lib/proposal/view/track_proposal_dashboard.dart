import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parivesh/common/appColors.dart';
import 'package:parivesh/common/no_network.dart';
import 'package:parivesh/proposal/model/advance_search_arguments.dart';
import 'package:parivesh/proposal/model/track_proposal_model.dart';
import 'package:provider/provider.dart';

import '../../common/app_routes.dart';
import '../viewmodel/trackporposal_viewmodel.dart';

class TrackPorposalDash extends StatefulWidget {
  const TrackPorposalDash({Key? key}) : super(key: key);

  @override
  State<TrackPorposalDash> createState() => _TrackPorposalDashState();
}

class _TrackPorposalDashState extends State<TrackPorposalDash> {
  ProposalViewModel? proposalViewModel;
  TrackPorposalModel? trackPorposalModel;
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
    proposalViewModel = Provider.of<ProposalViewModel>(context, listen: false);

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
      WillPopScope(
        onWillPop: () async{
          setState(() {
            proposalViewModel?.trackPorposalModel?.data?.clear();
          });
          return true;


        },
        child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(''),
            centerTitle: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/logo.png'), fit: BoxFit.fitWidth)),
            ),
          ),
          body: Column(
            children: [
              Expanded(child: CardData()),
            ],
          ),
        ),
    ),
      ):NoNetworkWidget();
  }
}

Widget CardData() {
  return Consumer<ProposalViewModel>(builder: (context, model, child) {
    return
      model.trackPorposalModel != null ?
      model.trackPorposalModel?.data?.length !=0
        ?
         ListView.builder(
            itemCount: model.trackPorposalModel?.data?.length,
            itemBuilder: (BuildContext context, int index) {
              final mylist = model.trackPorposalModel?.data?[index];
              print("nooo${mylist?.proposalNo?[index]}");
              return mylist?.proposalNo !=null?
                Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.trackproposoldetails,
                              arguments: TrackProposolDetailsArguments(
                                  proposolNo: mylist?.proposalNo,
                                  ApplicationFor: mylist?.clearanceType,
                                  Date: mylist?.dateOfSubmission,
                                  ProjectName: mylist?.projectName,
                                  SingleWindowNo: mylist?.singleWindowNumber,
                                  state: mylist?.state,
                                  ProjectCategory: mylist?.category,
                                  Area: mylist?.forestArea,
                                  id: mylist?.id));
                        },
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, left: 10, bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Proposal No :   ',
                                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                      TextSpan(text: mylist?.proposalNo),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Clearance Details :  ',
                                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                      TextSpan(text: mylist?.clearanceType),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Project Name :   ',
                                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                      TextSpan(text: mylist?.projectName),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Location :  ',
                                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                      TextSpan(text: mylist?.state),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'User Agency :   ',
                                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                      TextSpan(text: mylist?.nameOfUserAgency),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Other Details :  ',
                                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: "Category :${mylist?.category ?? ""},"
                                              " Sector :${mylist?.sector ?? ""},"
                                              "dateOfSubmission :${mylist?.dateOfSubmission?.substring(0, 10) ?? ""}"),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Proposal Status :   ',
                                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                      TextSpan(text: mylist?.proposalStatus),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ):Container();

            })
        :Center(
      child: Text(
        "No Data Available",
        style: TextStyle(color: Colors.black),
      ),
    ):
    Center(child: CircularProgressIndicator(color: Colors.green,));

  });
}
