import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parivesh/common/appColors.dart';
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

  @override
  void initState() {
    super.initState();

    proposalViewModel = Provider.of<ProposalViewModel>(context, listen: false);

    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}

Widget CardData() {
  return Consumer<ProposalViewModel>(builder: (context, model, child)
  {
    return model.trackPorposalModel != null
        ? ListView.builder(
            itemCount: model.trackPorposalModel?.data?.length,
            itemBuilder: (BuildContext context, int index) {
              final mylist = model.trackPorposalModel?.data?[index];
              return mylist?.proposalNo != null
                  ? Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, AppRoutes.trackproposoldetails,
                              arguments:
                              TrackProposolDetailsArguments(proposolNo: mylist?.proposalNo?[index]));
                        },
                        child: Card(
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
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    );
            })
        : Center(
            child: model.trackPorposalModel != null && model.trackPorposalModel!.data!.isEmpty
                ? Text(
                    "No Data Available",
                    style: TextStyle(color: Colors.black),
                  )
                : CircularProgressIndicator(
                    color: Colors.green,
                  ),
          );
  });
}
