import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parivesh/common/appColors.dart';
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

  @override
  void initState() {
    super.initState();
    proposalViewModel = Provider.of<ProposalViewModel>(context, listen: false);
    print("karo${widget.proposolNo}");
    proposalViewModel?.getPorposalDetails(porposalNo: widget.proposolNo.toString());
    proposalViewModel?.getProposolHistory(application_id: widget.id ?? 0);
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
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
                              text: 'State :  ', style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold)),
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
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColor.orange),
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
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColor.orange),
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
            Expanded(child: ProposlHistory()),
          ],
        ),
      ),
    ));
  }
}

// Widget DetailsData(){
//   return Consumer<ProposalViewModel>(builder: (context, model, child) {
//     return model.trackPorposalModel != null
//         ? ListView.builder(
//         itemCount: model.trackPorposalModel?.data?.length,
//         itemBuilder: (BuildContext context, int index) {
//           final mylist = model.trackPorposalModel?.data?[index];
//
//           return Padding(
//             padding: const EdgeInsets.all(10),
//             child: Card(
//               elevation: 10,
//               shape: RoundedRectangleBorder(
//                 side: BorderSide(
//                   color: Colors.white,
//                 ),
//                 borderRadius: BorderRadius.circular(20.0),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 10, left: 10),
//                 child:
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     RichText(
//                       text: TextSpan(
//                         style: TextStyle(
//                           color: Colors.black,
//                         ),
//                         children: <TextSpan>[
//                           TextSpan(
//                               text: 'Proposal No :   ',
//                               style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//                           TextSpan(text: mylist?.proposalNo),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     RichText(
//                       text: TextSpan(
//                         style: TextStyle(
//                           color: Colors.black,
//                         ),
//                         children: <TextSpan>[
//                           TextSpan(
//                               text: 'Single Window No :  ',
//                               style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//                           TextSpan(text: mylist?.singleWindowNumber),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     RichText(
//                       text: TextSpan(
//                         style: TextStyle(
//                           color: Colors.black,
//                         ),
//                         children: <TextSpan>[
//                           TextSpan(
//                               text: 'Project Name :   ',
//                               style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//                           TextSpan(text: mylist?.projectName),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     RichText(
//                       text: TextSpan(
//                         style: TextStyle(
//                           color: Colors.black,
//                         ),
//                         children: <TextSpan>[
//                           TextSpan(
//                               text: 'State :  ',
//                               style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//                           TextSpan(text: mylist?.state),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     RichText(
//                       text: TextSpan(
//                         style: TextStyle(
//                           color: Colors.black,
//                         ),
//                         children: <TextSpan>[
//                           TextSpan(
//                               text: 'Project Category :   ',
//                               style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//                           TextSpan(text: mylist?.category),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     RichText(
//                       text: TextSpan(
//                         style: TextStyle(
//                           color: Colors.black,
//                         ),
//                         children: <TextSpan>[
//                           TextSpan(
//                               text: 'Area (ha) :  ',
//                               style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//                           TextSpan(
//                               text: mylist?.forestArea),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     RichText(
//                       text: TextSpan(
//                         style: TextStyle(
//                           color: Colors.black,
//                         ),
//                         children: <TextSpan>[
//                           TextSpan(
//                               text: 'Application For :   ',
//                               style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//                           TextSpan(text: mylist?.clearanceType),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     RichText(
//                       text: TextSpan(
//                         style: TextStyle(
//                           color: Colors.black,
//                         ),
//                         children: <TextSpan>[
//                           TextSpan(
//                               text: 'Date of Submission :   ',
//                               style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//                           TextSpan(text: mylist?.dateOfSubmission?.substring(0,11)),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(children: [
//                       Text("In-Principle Approval : "),
//                       Container(
//                         padding: EdgeInsets.all(5),
//                         decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.orange),
//                           child: Text("In-Progress")),
//                     ],),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(children: [
//                       Text("Final Approva : "),
//                       Container(
//                           padding: EdgeInsets.all(5),
//
//                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.orange),
//                           child: Text("In-Progress")),
//                     ],),
//
//                     SizedBox(
//                       height: 15,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         })
//         : Center(
//       child: model.advanceSearchDetailModel != null && model.advanceSearchDetailModel!.data!.isEmpty
//           ? Text(
//         "No Data Available",
//         style: TextStyle(color: Colors.black),
//       )
//           : CircularProgressIndicator(
//         color: Colors.green,
//       ),
//     );
//   });
//
//
// }
Widget ProposlHistory() {
  return Consumer<ProposalViewModel>(builder: (context, model, child) {
    return Card(
      child: Column(
        children: [
          ExpansionTile(
            title: Row(
              children: [
                Text("hhhjk jh"),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.orange,
                  ),
                  child: Text(
                    "date",
                  ),
                ),
              ],
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 30,bottom: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Start Date"),
                        Spacer(),
                        Text("End Date"),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Text("Start Date"),
                        Spacer(),
                        Text("End Date"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  });
}
