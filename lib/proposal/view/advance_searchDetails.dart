import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parivesh/common/appColors.dart';
import 'package:parivesh/proposal/model/advance_search_history_model.dart';

import 'package:provider/provider.dart';

import '../model/track_proposal_model.dart';
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
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    proposalViewModel = Provider.of<ProposalViewModel>(context, listen: false);
    proposalViewModel?.getAdvanceSearchProposolHistory(application_id: widget.id ?? 0);
    proposalViewModel?.getTrackPorposalDetails(porposalNo: widget.proposolNo ?? "");
    print("history-id${widget.id}");


  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Proposal Details"),
              titleSpacing: 0.1,
            ),
            body: Consumer<ProposalViewModel>(builder: (context, model, child) {

              return
                model.trackProposolDetailsModel != null || model.advanceSearchHistoryModel != null
              ? model.trackProposolDetailsModel?.data?.length != 0 ||model.advanceSearchHistoryModel?.data?.length != 0
                    ?

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Consumer<ProposalViewModel>(builder: (context, model, child) {
                        return model.trackProposolDetailsModel != null
                            ? model.trackProposolDetailsModel?.data?.length != 0
                                ?
                        ListView.builder(
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
                                                                  color: AppColor.black, fontWeight: FontWeight.bold)),
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
                                                                  color: AppColor.black, fontWeight: FontWeight.bold)),
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
                                                                  color: AppColor.black, fontWeight: FontWeight.bold)),
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
                                                                  color: AppColor.black, fontWeight: FontWeight.bold)),
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
                                                                  color: AppColor.black, fontWeight: FontWeight.bold)),
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
                                                    widget.sector!=null?
                                                    SizedBox(
                                                      height: 10,
                                                    ):SizedBox.shrink(),
                                                    widget.sector!=null?
                                                    RichText(
                                                      text: TextSpan(
                                                        style: TextStyle(
                                                          color: AppColor.black,
                                                        ),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text: 'Sector:  ',
                                                              style: TextStyle(
                                                                  color: AppColor.black, fontWeight: FontWeight.bold)),
                                                          TextSpan(text: widget.sector),
                                                        ],
                                                      ),
                                                    ):SizedBox.shrink(),
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
                                                                  color: AppColor.black, fontWeight: FontWeight.bold)),
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
                                                                  color: AppColor.black, fontWeight: FontWeight.bold)),
                                                          TextSpan(
                                                              text: historylist?.dateOfSubmission?.substring(0, 11)),
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
                                                                  color: AppColor.black, fontWeight: FontWeight.bold)),
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
                                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                                  ),
                                                                  Container(
                                                                      padding: EdgeInsets.all(5),
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(10),
                                                                          color: AppColor.deeporange),
                                                                      child: Text("In-Progress",
                                                                          style:
                                                                              TextStyle(fontWeight: FontWeight.bold))),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text("Final Approva : ",
                                                                      style: TextStyle(fontWeight: FontWeight.bold)),
                                                                  Container(
                                                                      padding: EdgeInsets.all(5),
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(10),
                                                                          color: AppColor.deeporange),
                                                                      child: Text("In-Progress",
                                                                          style:
                                                                              TextStyle(fontWeight: FontWeight.bold))),
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
                                      height: MediaQuery.of(context).size.height/4,
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
                                  height: MediaQuery.of(context).size.height/4,
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
                                                    historylist?.historyWiseWithApplications!=null?
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
                                                                    text:"",
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
                                                       historylist?.endDate!=null? Text("(${historylist?.endDate?.substring(0, 10) ?? ""})"):SizedBox.shrink(),
                                                      ],
                                                    ):Container(color: Colors.amber,),
                                                  ],
                                                ),
                                              ),
                                            )
                                          : Center(child: Text(""));
                                    })
                                : Column(
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.height/5,
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
                                  height: MediaQuery.of(context).size.height/5,
                                ),
                                CircularProgressIndicator(
                                color: Colors.green,
                                  ),
                              ],
                            );
                      })
                    ]),
                  ))  : Center(
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
            })));
  }
}
