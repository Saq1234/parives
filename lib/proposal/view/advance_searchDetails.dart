import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parivesh/common/appColors.dart';
import 'package:parivesh/common/no_network.dart';
import 'package:parivesh/proposal/model/advance_search_arguments.dart';
import 'package:parivesh/proposal/model/advance_search_history_model.dart';
import 'package:parivesh/proposal/model/proposal_mom_details.dart';
import 'package:parivesh/proposal/model/proposal_view_agenda_model.dart';

import 'package:provider/provider.dart';
import '../model/track_proposol_details_model.dart';
import '../viewmodel/trackporposal_viewmodel.dart';

class AdvanceSearchDetail extends StatefulWidget {
  String? proposolNo;
  int? id;
  String? sector;
  int? clearanceId;

  AdvanceSearchDetail({this.proposolNo, this.id, this.sector, this.clearanceId});

  @override
  State<AdvanceSearchDetail> createState() => _TrackProposolDetailsState();
}

class _TrackProposolDetailsState extends State<AdvanceSearchDetail> {
  ProposalViewModel? proposalViewModel;
  AdvanceSearcHistoryModel? advanceSearcHistoryModel;
  TrackProposolDetailsModel? trackProposolDetailsModel;
  ProposalAgendaDetails? proposalAgendaDetails;
  ProposalMomDetails? proposalMomDetails;
  bool isExpanded = false;
  bool agenda = false;
  bool mom = false;
  bool agendafalse = false;
  bool _connectionStatus = true;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
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
    proposalViewModel?.getAdvanceSearchProposolHistory(application_id: widget.id ?? 0);
    proposalViewModel?.getTrackPorposalDetails(porposalNo: widget.proposolNo ?? "");
    proposalViewModel?.getProposalViewAgenda(proposalNo: widget.proposolNo ?? "");
    proposalViewModel?.getProposalMomDetails(proposalNo: widget.proposolNo ?? "");
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
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                      onPressed: () {
                       // _showBottomSheet(context);

                        },
                      icon: Icon(Icons.more_vert)),
                )
              ],
            ),
            body:
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
              child: Column(
                children: [
                  Container(
                    //color: Colors.amber,
                    height: 40,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  agenda=true;
                                  mom=false;
                                  proposalViewModel?.getProposalViewAgenda(proposalNo: widget.proposolNo??"");
                                  print("agnda pNo-> ${widget.proposolNo}");
                                });
                              },
                              child: Container(
                                height: 30,
                                padding: EdgeInsets.only(left: 10,right: 10),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.green),
                                child: Center(
                                    child: Text(
                                      "View Agenda",
                                      style: TextStyle(color: AppColor.whitecolor, fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ),
                            SizedBox(width: 5,),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  mom=true;
                                  agenda=false;
                                  proposalViewModel?.getProposalMomDetails(proposalNo: widget.proposolNo??"");
                                  print("agnda pNo-> ${widget.proposolNo}");
                                });
                              },
                              child: Container(
                                height: 30,
                                // width: MediaQuery.of(context).size.width / 2.2,
                                padding: EdgeInsets.only(left: 10,right: 10),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.green),
                                child: Center(
                                    child: Text(
                                      "View Mom",
                                      style: TextStyle(color: AppColor.whitecolor, fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ),
                            SizedBox(width: 5,),
                            Container(
                              height: 30,
                              padding: EdgeInsets.only(left: 10,right: 10),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.green),
                              child: Center(
                                  child: Text(
                                    "View Proposal",
                                    style: TextStyle(color: AppColor.whitecolor, fontWeight: FontWeight.bold),
                                  )),
                            ),
                            SizedBox(width: 5,),
                            Container(
                              height: 30,
                              padding: EdgeInsets.only(left: 10,right: 10),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.green),
                              child: Center(
                                  child: Text(
                                    "View Documents",
                                    style: TextStyle(color: AppColor.whitecolor, fontWeight: FontWeight.bold),
                                  )),
                            )


                          ],
                        ),

                      ],
                    ),
                  ),
                 agenda==true || mom==true?
                 Column(
                   children: [
                     Visibility(
                       visible:agenda==true ,
                         child: Padding(
                           padding: const EdgeInsets.only(top: 20),
                           child: Column(
                             children: [
                               Text("Agenda History",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                               AgendaView(),
                             ],
                           ),
                         )),
                     Visibility(
                       visible:mom==true ,
                         child: Padding(
                           padding: const EdgeInsets.only(top: 20),
                           child: Column(
                             children: [
                               Text("MoM History",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

                               MoMDetails(),
                             ],
                           ),
                         )),

                   ],
                 ):Expanded(child: ProposalDetail())

                ],
              ),
            ))):NoNetworkWidget();
  }
  Widget ProposalDetail(){
    return Consumer<ProposalViewModel>(builder: (context, model, child) {
      return model.trackProposolDetailsModel != null || model.advanceSearchHistoryModel != null
          ? model.trackProposolDetailsModel?.data?.length != 0 ||
          model.advanceSearchHistoryModel?.data?.length != 0
          ? SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Consumer<ProposalViewModel>(builder: (context, model, child) {
                return model.trackProposolDetailsModel != null
                    ? model.trackProposolDetailsModel?.data?.length != 0
                    ? ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: model.trackProposolDetailsModel?.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      final historylist = model.trackProposolDetailsModel?.data?[index];
                      return model.trackProposolDetailsModel?.data?.length != null
                          ? Card(
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
                                        style: TextStyle(
                                            color: AppColor.black,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: historylist?.proposalNo),
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
                                        style: TextStyle(
                                            color: AppColor.black,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: historylist?.singleWindowNumber),
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
                                        style: TextStyle(
                                            color: AppColor.black,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: historylist?.projectName),
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
                                        style: TextStyle(
                                            color: AppColor.black,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: historylist?.state),
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
                                        text: 'Proposal For :   ',
                                        style: TextStyle(
                                            color: AppColor.black,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: historylist?.proposalType),
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   height: 10,
                              // ),

                              // RichText(
                              //   text: TextSpan(
                              //     style: TextStyle(
                              //       color: AppColor.black,
                              //     ),
                              //     children: <TextSpan>[
                              //       TextSpan(
                              //           text: 'Activity :   ',
                              //           style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold)),
                              //       TextSpan(text: widget.ProjectCategory),
                              //     ],
                              //   ),
                              // ),
                              widget.sector != null
                                  ? SizedBox(
                                height: 10,
                              )
                                  : SizedBox.shrink(),
                              widget.sector != null
                                  ? RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: AppColor.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Sector:  ',
                                        style: TextStyle(
                                            color: AppColor.black,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: widget.sector),
                                  ],
                                ),
                              )
                                  : SizedBox.shrink(),
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
                                        style: TextStyle(
                                            color: AppColor.black,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: historylist?.clearanceType),
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
                                        style: TextStyle(
                                            color: AppColor.black,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text: historylist?.dateOfSubmission
                                            ?.substring(0, 11)),
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
                                        text: 'MoEFCC File No :   ',
                                        style: TextStyle(
                                            color: AppColor.black,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: historylist?.moefccFileNumber),
                                  ],
                                ),
                              ),
                              widget.clearanceId == 2
                                  ? Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "In-Principle Approval : ",
                                        style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              color: AppColor.deeporange),
                                          child: Text("In-Progress",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text("Final Approva : ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              color: AppColor.deeporange),
                                          child: Text("In-Progress",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))),
                                    ],
                                  ),
                                ],
                              )
                                  : SizedBox.shrink(),

                              SizedBox(
                                height: 15,
                              )
                            ],
                          ),
                        ),
                      )
                          : Center(child: Text(""));
                    })
                    : Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 4,
                    ),
                    Text(
                      "No Data Available",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
                    : Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 4,
                    ),
                    CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  ],
                );
              }),
              SizedBox(
                height: 20,
              ),
              Text(
                "Proposal History/Timeline",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              Consumer<ProposalViewModel>(builder: (context, model, child) {
                return model.advanceSearchHistoryModel != null
                    ? model.advanceSearchHistoryModel?.data?.length != 0
                    ? ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: model.advanceSearchHistoryModel?.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      final historylist = model.advanceSearchHistoryModel?.data?[index];

                      return model.advanceSearchHistoryModel?.data?.length != null
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
                          padding: const EdgeInsets.only(
                              top: 15, left: 10, bottom: 15, right: 10),
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
                                        style:
                                        TextStyle(color: AppColor.whitecolor),
                                      )
                                          : Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Text(
                                          " - N/A",
                                          style:
                                          TextStyle(color: AppColor.whitecolor),
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
                                        : Text(
                                      "N/A",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              historylist?.historyWiseWithApplications != null
                                  ? Row(
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
                                            text: "",
                                          ),
                                          // TextSpan(
                                          //     text: "Role name",
                                          //     style: TextStyle(
                                          //         color: AppColor.black, fontWeight: FontWeight.bold)),
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
                                  historylist?.endDate != null
                                      ? Text(
                                      "(${historylist?.endDate?.substring(0, 10) ?? ""})")
                                      : SizedBox.shrink(),
                                ],
                              )
                                  : Container(
                                color: Colors.amber,
                              ),
                            ],
                          ),
                        ),
                      )
                          : Center(child: Text(""));
                    })
                    : Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 5,
                    ),
                    Text(
                      "No Data Available",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
                    : Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 5,
                    ),
                    CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  ],
                );
              })
            ]),
          )
          : Center(
        child: Text(
          "No Data Available",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      )
          : Center(
          child: CircularProgressIndicator(
            color: Colors.green,
          ));
    });

  }
  Widget AgendaView(){
    return Consumer<ProposalViewModel>(builder: (context, model, child) {
      return model.proposalAgendaDetails != null
          ? model.proposalAgendaDetails?.length != 0
          ? Container(
        margin: EdgeInsets.only(top: 10,bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColor.black)
        ),
            child:
          Stack(
            children: [
              ListView.builder(
                // physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: model.proposalAgendaDetails?.length,
                  itemBuilder: (BuildContext context, int index) {
                    final agendaList = model.proposalAgendaDetails?[index];
                    print("ka---? ${agendaList?.toTime.toString()}");

                    return model.proposalAgendaDetails?.length != null
                        ?
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, left: 10, bottom: 15, right: 10),
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
                                      text: 'Agenda No :  ',
                                      style: TextStyle(
                                          color: AppColor.black, fontWeight: FontWeight.bold)),
                                  TextSpan(text: agendaList?.agendaNo),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: AppColor.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Meeting Date :  ',
                                      style: TextStyle(
                                          color: AppColor.black, fontWeight: FontWeight.bold)),
                                  TextSpan(text: agendaList?.strdateOfMeeting?.substring(0,10)),
                                ],
                              ),
                            )
                            ,SizedBox(height: 10,),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: AppColor.black,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Meeting Time :  ',
                                          style: TextStyle(
                                              color: AppColor.black, fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: 'Start Time :  ',
                                          style: TextStyle(
                                              color: AppColor.black, fontWeight: FontWeight.bold)),
                                      TextSpan(text: agendaList?.fromTime),
                                      TextSpan(
                                          text: '  End Time :  ',
                                          style: TextStyle(
                                              color: AppColor.black, fontWeight: FontWeight.bold)),
                                      TextSpan(text: agendaList?.toTime),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Text("Document ",style: TextStyle(color: AppColor.black,fontWeight: FontWeight.bold),),
                                Spacer(),

                                GestureDetector(
                                  onTap:(){
                                    },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 30),
                                    height: 30,
                                    width: 80,
                                    //padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.green),
                                    child: Center(child: Text("View",style: TextStyle(color: AppColor.whitecolor),)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                        : Center(child: Text(""));
                  }),
              Positioned(child:
              GestureDetector(
                onTap: (){
                  setState(() {
                    agenda=false;
                   // mom=false;
                  });
                },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5,right: 5),
                    child: Align(
                      alignment: Alignment.topRight,
                        child: Icon(Icons.cancel,color: Colors.red,)),
                  )))

            ],
          )
          )
          : Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 5,
          ),
          Text(
            "No Data Available",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      )
          : Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 5,
          ),
          CircularProgressIndicator(
            color: Colors.green,
          ),
        ],
      );
    });

  }
  Widget MoMDetails(){
    return Consumer<ProposalViewModel>(builder: (context, model, child) {
      return model.proposalMomDetails != null
          ? model.proposalMomDetails?.length != 0
          ? Container(
        margin: EdgeInsets.only(top: 10,bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColor.black)
        ),
            child:
          Stack(
            children: [
              ListView.builder(
                // physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: model.proposalMomDetails?.length,
                  itemBuilder: (BuildContext context, int index) {
                    final momList = model.proposalMomDetails?[index];
                    print("ka---? ${momList?.toTime.toString()}");

                    return model.proposalMomDetails?.length != null
                        ?
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, left: 10, bottom: 15, right: 10),
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
                                      text: 'Agenda No :  ',
                                      style: TextStyle(
                                          color: AppColor.black, fontWeight: FontWeight.bold)),
                                  TextSpan(text: momList?.momNo),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: AppColor.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Meeting Date :  ',
                                      style: TextStyle(
                                          color: AppColor.black, fontWeight: FontWeight.bold)),
                                  TextSpan(text: momList?.strdateOfMeeting?.substring(0,10)),
                                ],
                              ),
                            )
                            ,SizedBox(height: 10,),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: AppColor.black,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Meeting Time :  ',
                                          style: TextStyle(
                                              color: AppColor.black, fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: 'Start Time :  ',
                                          style: TextStyle(
                                              color: AppColor.black, fontWeight: FontWeight.bold)),
                                      TextSpan(text: momList?.fromTime),
                                      TextSpan(
                                          text: '  End Time :  ',
                                          style: TextStyle(
                                              color: AppColor.black, fontWeight: FontWeight.bold)),
                                      TextSpan(text: momList?.toTime),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Text("Document ",style: TextStyle(color: AppColor.black,fontWeight: FontWeight.bold),),
                                Spacer(),
                                Container(
                                  margin: EdgeInsets.only(right: 30),
                                  height: 30,
                                  width: 80,
                                  //padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.green),
                                  child: Center(child: Text("View",style: TextStyle(color: AppColor.whitecolor),)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                        : Center(child: Text(""));
                  }),
              Positioned
                (child:
              GestureDetector(
                  onTap: (){
                    setState(() {
                      mom=false;
                      // mom=false;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5,right: 5),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.cancel,color: Colors.red,)),
                  )))

            ],
          )
          )
          : Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 5,
          ),
          Text(
            "No Data Available",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      )
          : Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 5,
          ),
          CircularProgressIndicator(
            color: Colors.green,
          ),
        ],
      );
    });

  }


}

