import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parivesh/common/appColors.dart';
import 'package:parivesh/common/no_network.dart';
import 'package:parivesh/proposal/model/proposol_history_model.dart';
import 'package:parivesh/proposal/model/track_proposol_details_model.dart';
import 'package:provider/provider.dart';

import '../model/track_proposal_model.dart';
import '../viewmodel/trackporposal_viewmodel.dart';

class TrackProposolDetails extends StatefulWidget {
  String? proposolNo;
  String? SingleWindowNo;
  String? ProjectName;
  String? state;
  String? ProjectCategory;
  String? Area;
  String? ApplicationFor;
  String? Date;
  int? id;

  TrackProposolDetails(
      {this.proposolNo,
      this.ApplicationFor,
      this.Area,
      this.Date,
      this.ProjectCategory,
      this.ProjectName,
      this.SingleWindowNo,
      this.state,
      this.id});

  @override
  State<TrackProposolDetails> createState() => _TrackProposolDetailsState();
}

class _TrackProposolDetailsState extends State<TrackProposolDetails> {
  ProposalViewModel? proposalViewModel;
  TrackPorposalModel? trackPorposalModel;
  bool isExpanded = false;
  ProposolHistoryModel? proposolHistoryModel;
  bool _connectionStatus = true;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

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
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    proposalViewModel = Provider.of<ProposalViewModel>(context, listen: false);
    proposalViewModel?.getPorposalDetails(porposalNo: widget.proposolNo.toString());
    proposalViewModel?.getProposolHistory(application_id: widget.id ?? 0);
    print("history-id${widget.id}");
  }

  @override
  Widget build(BuildContext context) {
    return _connectionStatus == true?
      SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Proposal Details"),
              titleSpacing: 0.1,
            ),
            body: Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Card(
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
                                    color: AppColor.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Proposal No :   ',
                                        style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold)),
                                    TextSpan(text: widget.proposolNo),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: AppColor.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Single Window No :  ',
                                        style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold)),
                                    TextSpan(text: widget.SingleWindowNo),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: AppColor.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Project Name :   ',
                                        style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold)),
                                    TextSpan(text: widget.ProjectName),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: AppColor.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'State :  ',
                                        style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold)),
                                    TextSpan(text: widget.state),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: AppColor.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Project Category :   ',
                                        style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold)),
                                    TextSpan(text: widget.ProjectCategory),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: AppColor.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Area (ha) :  ',
                                        style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold)),
                                    TextSpan(text: widget.Area.toString()),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: AppColor.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Application For :   ',
                                        style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold)),
                                    TextSpan(text: widget.ApplicationFor),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: AppColor.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Date of Submission :   ',
                                        style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold)),
                                    TextSpan(text: widget.Date?.substring(0, 11)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text("In-Principle Approval : "),
                                  Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10), color: AppColor.orange),
                                      child: Text("In-Progress")),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text("Final Approva : "),
                                  Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10), color: AppColor.orange),
                                      child: Text("In-Progress")),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Proposal History/Timeline",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Consumer<ProposalViewModel>(builder: (context, model, child) {
                        return model.trackPorposalModel != null
                            ? model.trackPorposalModel?.data?.length != 0
                                ? ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: model.proposolHistoryModel?.data?.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      final historylist = model.proposolHistoryModel?.data?[index];
                                      print("count karo ${model.proposolHistoryModel?.data?.length}");
                                      return model.proposolHistoryModel?.data?.length != null
                                          ? Card(
                                              margin: EdgeInsets.only(
                                                top: 20,
                                                right: 10,
                                              ),
                                              elevation: 2,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                  color: Colors.white,
                                                ),
                                                borderRadius: BorderRadius.circular(20.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.only(top: 15, left: 10, bottom: 15, right: 10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      historylist?.status ?? "",
                                                      style: TextStyle(fontWeight: FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Container(
                                                        width: MediaQuery.of(context).size.width / 2,
                                                        padding: EdgeInsets.only(left: 5, top: 2, bottom: 2),
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(5),
                                                            color: AppColor.darkgreen),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              historylist?.startDate?.substring(0, 10) ?? "",
                                                              style: TextStyle(color: AppColor.whitecolor),
                                                            ),
                                                            historylist?.endDate != null
                                                                ? Text(
                                                                    " - ${historylist?.endDate?.substring(0, 10) ?? ""}",
                                                                    style: TextStyle(color: AppColor.whitecolor),
                                                                  )
                                                                : Padding(
                                                                    padding: const EdgeInsets.only(left: 10),
                                                                    child: Text(
                                                                      " - N/A",
                                                                      style: TextStyle(color: AppColor.whitecolor),
                                                                    ),
                                                                  ),
                                                          ],
                                                        )),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("Start Date"),
                                                        Spacer(),
                                                        Text(
                                                          historylist?.startDate?.substring(0, 10) ?? "",
                                                          style: TextStyle(fontWeight: FontWeight.bold),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 0),
                                                      child: Row(
                                                        children: [
                                                          Text("End Date"),
                                                          Spacer(),
                                                          historylist?.endDate != null
                                                              ? Text(
                                                                  historylist?.endDate?.substring(0, 10) ?? "",
                                                                  style: TextStyle(fontWeight: FontWeight.bold),
                                                                )
                                                              : Text("N/A"),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(context).size.width / 2,
                                                          child: RichText(
                                                            text: TextSpan(
                                                              style: TextStyle(
                                                                color: AppColor.black,
                                                              ),
                                                              children: <TextSpan>[
                                                                TextSpan(
                                                                  text: 'Raised EDS by  ',
                                                                ),
                                                                TextSpan(
                                                                    text: "User name  ",
                                                                    style: TextStyle(
                                                                        color: AppColor.black,
                                                                        fontWeight: FontWeight.bold)),
                                                                TextSpan(
                                                                    text: "Role name",
                                                                    style: TextStyle(
                                                                        color: AppColor.black,
                                                                        fontWeight: FontWeight.bold)),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Text(
                                                          "View",
                                                          style: TextStyle(
                                                            color: AppColor.darkgreen,
                                                            fontWeight: FontWeight.bold,
                                                            decoration: TextDecoration.underline,
                                                            decorationThickness: 2,
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Text("(${historylist?.endDate?.substring(0, 10) ?? ""})"),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          : Center(child: Text(""));
                                    })
                                : Center(
                                    child: Text(
                                      "No Data Available",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )
                            : Center(
                                child: CircularProgressIndicator(
                                color: Colors.green,
                              ));
                      })
                    ]))))):NoNetworkWidget();
  }
}
