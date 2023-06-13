import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parivesh/common/appColors.dart';
import 'package:parivesh/common/date_time_convert.dart';
import 'package:parivesh/proposal/model/advance_search_arguments.dart';
import 'package:provider/provider.dart';

import '../../common/app_routes.dart';
import '../model/advance_search_detail_model.dart';
import '../viewmodel/trackporposal_viewmodel.dart';

class AdvanceSearchDashboard extends StatefulWidget {
  int? clearanceId;
  int? stateCode;

  AdvanceSearchDashboard({this.clearanceId, this.stateCode});

  @override
  State<AdvanceSearchDashboard> createState() => _AdvanceSearchDashboardState();
}

class _AdvanceSearchDashboardState extends State<AdvanceSearchDashboard> {
  AdvanceSearchDetailModel? advanceSearchDetailModel;
  ProposalViewModel? proposalViewModel;
  TextEditingController searchController = TextEditingController();
  String search="";

  @override
  void initState() {
    super.initState();

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
        body: Padding(
          padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.black,width: 1),
                    borderRadius: BorderRadius.circular(20),

                ),
                child: TextField(

                  controller: searchController,
                  decoration:  InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.only(left: 10,top: 10),
                    border: InputBorder.none,
                    hintText: 'Search Proposal Status....',
                    hintStyle: TextStyle(fontWeight: FontWeight.bold)
                  ),
                  onChanged: (String? value){
                    setState(() {
                      search=value.toString();
                    });
                  },
                ),
              ),

               Expanded(
                child: Container(
                  child: Consumer<ProposalViewModel>(builder: (context, model, child) {
                    return model.advanceSearchDetailModel != null
                        ? model.advanceSearchDetailModel?.data?.length != 0
                            ? ListView.builder(
                                itemCount: model.advanceSearchDetailModel?.data?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final mylist = model.advanceSearchDetailModel?.data?[index];
                                   String? name=model.advanceSearchDetailModel?.data?[index].proposalStatus;
                                  if(searchController.text.isEmpty){
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(context, AppRoutes.advancesearchdetails,
                                              arguments: AdvanceSearchDetailsArguments(
                                                  proposolNo: mylist?.proposalNo,
                                                  id: mylist?.id,
                                                  sector: mylist?.sector,
                                                  clearanceId: widget.clearanceId
                                                  ));

                                          FocusManager.instance.primaryFocus?.unfocus();
                                          searchController.clear();
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
                                                          style: TextStyle(
                                                              color: Colors.black, fontWeight: FontWeight.bold)),
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
                                                          style: TextStyle(
                                                              color: Colors.black, fontWeight: FontWeight.bold)),TextSpan(
                                                          text: 'Clearance Type :  ',
                                                          style: TextStyle(
                                                              color: Colors.black, fontWeight: FontWeight.bold)),
                                                      TextSpan(text: mylist?.clearanceType),
                                                    ],
                                                  ),
                                                ),
                                                widget.clearanceId==2||widget.clearanceId==3||widget.clearanceId==4?

                                                SizedBox(
                                                  height: 10,
                                                ):SizedBox.shrink(),
                                                widget.clearanceId==2 ||widget.clearanceId==3||widget.clearanceId==4?
                                                RichText(
                                                  text: TextSpan(
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: 'CAF No :  ',
                                                          style: TextStyle(
                                                              color: Colors.black, fontWeight: FontWeight.bold)),
                                                      TextSpan(text: mylist?.cafnumber),
                                                    ],
                                                  ),
                                                ):SizedBox.shrink(),
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
                                                          text: 'S/W No :  ',
                                                          style: TextStyle(
                                                              color: Colors.black, fontWeight: FontWeight.bold)),
                                                      TextSpan(text: mylist?.singleWindowNumber),
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
                                                          style: TextStyle(
                                                              color: Colors.black, fontWeight: FontWeight.bold)),
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
                                                          style: TextStyle(
                                                              color: Colors.black, fontWeight: FontWeight.bold)),
                                                      TextSpan(text: mylist?.state),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                widget.clearanceId==1?
                                                RichText(
                                                  text: TextSpan(
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: 'Project Proponent :   ',
                                                          style: TextStyle(
                                                              color: Colors.black, fontWeight: FontWeight.bold)),
                                                      TextSpan(text: mylist?.nameOfUserAgency),
                                                    ],
                                                  ),
                                                ):
                                                RichText(
                                                  text: TextSpan(
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: 'User Agency :   ',
                                                          style: TextStyle(
                                                              color: Colors.black, fontWeight: FontWeight.bold)),
                                                      TextSpan(text: mylist?.nameOfUserAgency),
                                                    ],
                                                  ),
                                                ),
                                                mylist?.forestArea !=null?
                                                SizedBox(
                                                  height: 10,
                                                ):SizedBox.shrink(),
                                                mylist?.forestArea !=null?

                                                RichText(
                                                  text: TextSpan(
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: 'Area (ha) :   ',
                                                          style: TextStyle(
                                                              color: Colors.black, fontWeight: FontWeight.bold)),
                                                      TextSpan(text: mylist?.forestArea),
                                                    ],
                                                  ),
                                                ):SizedBox.shrink(),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    RichText(
                                                      text: TextSpan(
                                                        text: 'Other Details :  ',

                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold
                                                        ),
                                                      ),
                                                    ),
                                                    mylist?.category!=null?
                                                    RichText(
                                                      text: TextSpan(
                                                        text: 'Category :  ',

                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold
                                                        ),
                                                        children: [
                                                          TextSpan(
                                                            text: mylist?.category,
                                                            style: TextStyle(fontWeight: FontWeight.normal)
                                                          )
                                                        ]
                                                      ),
                                                    ):SizedBox.shrink(),
                                                  ],
                                                ),
                                                mylist?.sector!=null?
                                                SizedBox(
                                                  height: 10,
                                                ):SizedBox.shrink(),
                                                mylist?.sector!=null?
                                                RichText(
                                                  text: TextSpan(
                                                      text: 'Sector :  ',

                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                            text: mylist?.sector,
                                                            style: TextStyle(fontWeight: FontWeight.normal)
                                                        )
                                                      ]
                                                  ),
                                                  maxLines: 2,
                                                ):SizedBox.shrink(),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                      text: 'Date of Submission :  ',

                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                            text: mylist?.dateOfSubmission?.substring(0,10),
                                                            style: TextStyle(fontWeight: FontWeight.normal)
                                                        )
                                                      ]
                                                  ),
                                                ),
                                                mylist?.issuingAuthority !=null?

                                                SizedBox(
                                                  height: 10,
                                                ):SizedBox.shrink(),
                                                mylist?.issuingAuthority !=null?
                                                RichText(
                                                  text: TextSpan(
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: 'Issuing Authority :   ',
                                                          style: TextStyle(
                                                              color: Colors.black, fontWeight: FontWeight.bold)),
                                                      TextSpan(text: mylist?.issuingAuthority),
                                                    ],
                                                  ),
                                                ):SizedBox.shrink(),
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
                                                          style: TextStyle(
                                                              color: Colors.black, fontWeight: FontWeight.bold)),
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
                                    );

                                  }else if(name!.toLowerCase().contains(searchController.text.toLowerCase())){
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(context, AppRoutes.advancesearchdetails,
                                              arguments: AdvanceSearchDetailsArguments(
                                                  proposolNo: mylist?.proposalNo,
                                                  sector: mylist?.sector,
                                                  id: mylist?.id,
                                              ));
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
                                                          style: TextStyle(
                                                              color: Colors.black, fontWeight: FontWeight.bold)),
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
                                                          style: TextStyle(
                                                              color: Colors.black, fontWeight: FontWeight.bold)),
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
                                                          style: TextStyle(
                                                              color: Colors.black, fontWeight: FontWeight.bold)),
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
                                                          style: TextStyle(
                                                              color: Colors.black, fontWeight: FontWeight.bold)),
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
                                                          style: TextStyle(
                                                              color: Colors.black, fontWeight: FontWeight.bold)),
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
                                                          style: TextStyle(
                                                              color: Colors.black, fontWeight: FontWeight.bold)),
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
                                                          style: TextStyle(
                                                              color: Colors.black, fontWeight: FontWeight.bold)),
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
                                    );
                                  }
                                  else{
                                    return Container();
                                  }



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
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Widget CardData() {
//   return
//     Consumer<ProposalViewModel>(builder: (context, model, child) {
//     return model.advanceSearchDetailModel != null ?
//     model.advanceSearchDetailModel?.data?.length !=0?
//     Column(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//               border: Border.all(color: AppColor.black),
//               borderRadius: BorderRadius.circular(20)
//           ),
//           child: TextField(
//             controller: searchController,
//             decoration:  InputDecoration(
//               contentPadding: EdgeInsets.only(left: 10),
//               border: InputBorder.none,
//               hintText: 'Enter Proposal Number/Single Window Number',
//             ),
//           ),
//         ),
//         ListView.builder(
//                 itemCount: model.advanceSearchDetailModel?.data?.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final mylist = model.advanceSearchDetailModel?.data?[index];
//
//                   return Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: GestureDetector(
//                       onTap: (){
//                         Navigator.pushNamed(context, AppRoutes.advancesearchdetails,
//                             arguments:
//                             AdvanceSearchDetailsArguments(proposolNo: mylist?.proposalNo,ApplicationFor: mylist?.clearanceType,
//                                 Date: mylist?.dateOfSubmission,ProjectName: mylist?.projectName,SingleWindowNo: mylist?.singleWindowNumber,
//                                 state: mylist?.state,ProjectCategory: mylist?.category,Area: mylist?.forestArea,id: mylist?.id,
//                             proposalfor: mylist?.proposalType,sector: mylist?.sector,MoEFCCFileNo: mylist?.moefccFileNumber));
//                       },
//                       child: Card(
//                         elevation: 2,
//                         shape: RoundedRectangleBorder(
//                           side: BorderSide(
//                             color: Colors.white,
//                           ),
//                           borderRadius: BorderRadius.circular(20.0),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 20, left: 10,bottom: 20),
//                           child:
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               RichText(
//                                 text: TextSpan(
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                   ),
//                                   children: <TextSpan>[
//                                     TextSpan(
//                                         text: 'Proposal No :   ',
//                                         style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//                                     TextSpan(text: mylist?.proposalNo),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               RichText(
//                                 text: TextSpan(
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                   ),
//                                   children: <TextSpan>[
//                                     TextSpan(
//                                         text: 'Clearance Details :  ',
//                                         style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//                                     TextSpan(text: mylist?.clearanceType),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               RichText(
//                                 text: TextSpan(
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                   ),
//                                   children: <TextSpan>[
//                                     TextSpan(
//                                         text: 'Project Name :   ',
//                                         style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//                                     TextSpan(text: mylist?.projectName),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               RichText(
//                                 text: TextSpan(
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                   ),
//                                   children: <TextSpan>[
//                                     TextSpan(
//                                         text: 'Location :  ',
//                                         style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//                                     TextSpan(text: mylist?.state),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               RichText(
//                                 text: TextSpan(
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                   ),
//                                   children: <TextSpan>[
//                                     TextSpan(
//                                         text: 'User Agency :   ',
//                                         style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//                                     TextSpan(text: mylist?.nameOfUserAgency),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               RichText(
//                                 text: TextSpan(
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                   ),
//                                   children: <TextSpan>[
//                                     TextSpan(
//                                         text: 'Other Details :  ',
//                                         style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//                                     TextSpan(
//                                         text: "Category :${mylist?.category ?? ""},"
//                                             " Sector :${mylist?.sector ?? ""},"
//                                             "dateOfSubmission :${mylist?.dateOfSubmission?.substring(0, 10) ?? ""}"),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               RichText(
//                                 text: TextSpan(
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                   ),
//                                   children: <TextSpan>[
//                                     TextSpan(
//                                         text: 'Proposal Status :   ',
//                                         style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//                                     TextSpan(text: mylist?.proposalStatus),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 15,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//       ],
//     )
//         :Center(
//       child: Text(
//         "No Data Available",
//         style: TextStyle(color: Colors.black),
//       ),
//     ):
//     Center(child: CircularProgressIndicator(color: Colors.green,));
//   });
// }
