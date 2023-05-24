import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/advance_search_detail_model.dart';
import '../viewmodel/trackporposal_viewmodel.dart';

class AdvanceSearchDashboard extends StatefulWidget {
  int? clearanceId;
 int? stateCode;
  AdvanceSearchDashboard({this.clearanceId,this.stateCode});
  @override
  State<AdvanceSearchDashboard> createState() => _AdvanceSearchDashboardState();
}

class _AdvanceSearchDashboardState extends State<AdvanceSearchDashboard> {
  AdvanceSearchDetailModel? advanceSearchDetailModel;
  ProposalViewModel? proposalViewModel;

  @override
  void initState() {
    print("myyy${widget.clearanceId}");
    print("myyy${widget.stateCode}");
    proposalViewModel = Provider.of<ProposalViewModel>(context, listen: false);
    proposalViewModel?.getAdvanceSearchDetails(
        majorClearanceType: widget.clearanceId.toString(),
        state: widget.stateCode.toString(),
    //     sector: "",
    //     proposalStatus: "",
    //     proposalType: "",
    //     issuingAuthority: "",
    //     activityId: "",
    //     category: "",
    //     startDate:
    // "",
    //     endDate: "",
    //     area: "",
    //     text: ""
    );

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
  return
    Consumer<ProposalViewModel>(builder: (context, model, child) {
      return
      model.advanceSearchDetailModel!=null?
        ListView.builder(
            itemCount: model.advanceSearchDetailModel?.data?.length,
            itemBuilder: (BuildContext context, int index) {
              final mylist = model.advanceSearchDetailModel?.data?[index];
              return
                Padding(
                  padding: const EdgeInsets.all(10),
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
                                    text: 'Location :  ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
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
                                        "dateOfSubmission :${mylist?.dateOfSubmission ?? ""}"),
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
                          SizedBox(height: 15,)
                        ],
                      ),
                    ),
                  ),
                );
            }):
      Center(
        child: model.advanceSearchDetailModel!=null && model.advanceSearchDetailModel!.data!.isEmpty?
        Text("No Data Available"):CircularProgressIndicator(color: Colors.green,),
      );
    });
}
