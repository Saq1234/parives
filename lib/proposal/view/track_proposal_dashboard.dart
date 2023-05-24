import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parivesh/common/appColors.dart';
import 'package:parivesh/proposal/model/track_proposal_model.dart';
import 'package:provider/provider.dart';

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
    proposalViewModel = Provider.of<ProposalViewModel>(context, listen: false);
   // proposalViewModel?.getPorposalDetails(porposalNo: porposalNo)

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
      model.trackPorposalModel!=null?
      ListView.builder(
        itemCount: model.trackPorposalModel?.data?.length,
        itemBuilder: (BuildContext context, int index) {
          final mylist = model.trackPorposalModel?.data?[index];
          return
              mylist?.proposalNo !=null?
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
          ):Center(child: CircularProgressIndicator(color: Colors.green,),);
        }):
      Center(
        child: model.trackPorposalModel!=null && model.trackPorposalModel!.data!.isEmpty?
        Text("No Data Available",style: TextStyle(color: Colors.black),)
            :CircularProgressIndicator(color: Colors.green,),
      );
  });
}

// Widget TableDate(){
//   return Consumer<PorposalViewModel>(builder: (context, model, child){
//     return
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child:
//         Container(
//
//           child: Table(
//             border: TableBorder.all(color: Colors.black),
//             children: [
//               TableRow(
//                   decoration: BoxDecoration(
//                       color: Colors.green[100]
//                   ),
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 5,left: 5),
//                       child: Text("Sr. No."),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 5,left: 5),
//                       child: Text("Proposal No."),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 5,left: 5),
//                       child: Text("Clearance Details"),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 5,left: 5),
//                       child: Text("Project Name"),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 5,left: 5),
//                       child: Text("Location"),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 5,left: 5),
//                       child: Text("User Agency"),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 5,left: 5),
//                       child: Text("Other Details	"),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 5,left: 5),
//                       child: Text("Proposal Status"),
//                     ),
//                   ]
//               ),
//               TableRow(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 5,left: 5),
//                     child: Text("1"),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 5,left: 5),
//                     child: Text(model.trackPorposalModel?.data?[0].clearanceType??""),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 5,left: 5),
//                     child: Text(model.trackPorposalModel?.data?[0].projectName??""),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 5,left: 5),
//                     child: Text(model.trackPorposalModel?.data?[0].state??""),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 5,left: 5),
//                     child: Text(model.trackPorposalModel?.data?[0].nameOfUserAgency??""),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 5,left: 5),
//                     child: Text(model.trackPorposalModel?.data?[0].proposalStatus??""),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 5,left: 5),
//                     child: Text("Category :${model.trackPorposalModel?.data?[0].category??""},"
//                         " Sector :${model.trackPorposalModel?.data?[0].sector??""},"
//                         "dateOfSubmission :${model.trackPorposalModel?.data?[0].dateOfSubmission??""}"),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 5,left: 5),
//                     child: Text(model.trackPorposalModel?.data?[0].proposalStatus??""),
//                   ),
//                 ]
//               )
//
//             ],
//           ),
//         ),
//       );
//
//   },);
// }
Widget TableDate() {
  return Consumer<ProposalViewModel>(
    builder: (context, model, child) {
      return model.trackPorposalModel?.data != null && model.trackPorposalModel!.data!.isNotEmpty
          ? model.trackPorposalModel!.data![0].proposalNo != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      children: [
                        Table(
                          columnWidths: const <int, TableColumnWidth>{
                            0: FlexColumnWidth(0.4),
                            1: FlexColumnWidth(1),
                          },
                          border: TableBorder.all(color: Colors.black),
                          children: [
                            TableRow(decoration: BoxDecoration(color: Colors.green[100]), children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5, left: 5),
                                child: Text("Sr. No."),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5, left: 5),
                                child: Text("Proposal No."),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5, left: 5),
                                child: Text("Clearance Details"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5, left: 5),
                                child: Text("Project Name"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5, left: 5),
                                child: Text("Location"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5, left: 5),
                                child: Text("User Agency"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5, left: 5),
                                child: Text("Other Details	"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5, left: 5),
                                child: Text("Proposal Status"),
                              ),
                            ]),
                          ],
                        ),
                        Table(
                            columnWidths: const <int, TableColumnWidth>{
                              0: FlexColumnWidth(0.4),
                              1: FlexColumnWidth(1),
                            },
                            border: TableBorder.all(color: Colors.black),
                            children: List<TableRow>.generate(model.trackPorposalModel!.data!.length, (index) {
                              final listdata = model.trackPorposalModel?.data?[index];
                              return TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5, left: 5),
                                  child: Text((index + 1).toString()),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5, left: 5),
                                  child: Text(
                                    listdata?.proposalNo ?? "",
                                    style: TextStyle(color: AppColor.green),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5, left: 5),
                                  child: Text(listdata?.clearanceType ?? ""),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5, left: 5),
                                  child: Text(listdata?.projectName ?? ""),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5, left: 5),
                                  child: Text(listdata?.state ?? ""),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5, left: 5),
                                  child: Text(listdata?.nameOfUserAgency ?? ""),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5, left: 5),
                                  child: Text(listdata?.proposalStatus ?? ""),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5, left: 5),
                                  child: Text(
                                    "Category :${listdata?.category ?? ""},"
                                    " Sector :${listdata?.sector ?? ""},"
                                    "dateOfSubmission :${listdata?.dateOfSubmission ?? ""}",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ]);
                            })),
                      ],
                    ),
                  ),
                )
              : Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    color: AppColor.green,
                  ),
                )
          : Center(child: Center(child: Text("No Data")));
    },
  );
}
