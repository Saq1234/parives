import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parivesh/common/custom_widget.dart';
import 'package:parivesh/proposal/model/advance_search_arguments.dart';
import 'package:parivesh/proposal/view/advance_search_dashboard.dart';
import 'package:parivesh/proposal/view/track_proposal.dart';
import 'package:parivesh/proposal/view/track_proposal_dashboard.dart';
import 'package:provider/provider.dart';

import '../../common/appColors.dart';
import '../../common/app_routes.dart';
import '../model/clearanceType_model.dart';
import '../viewmodel/trackporposal_viewmodel.dart';

class AdvanceSearchPorposal extends StatefulWidget {
  const AdvanceSearchPorposal({Key? key}) : super(key: key);

  @override
  State<AdvanceSearchPorposal> createState() => _AdvanceSearchPorposalState();
}

class _AdvanceSearchPorposalState extends State<AdvanceSearchPorposal> {
  late DateTime startCreation, endCreation;
  DateTime selectedDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  String startDateOfCreation = "";
  String endDateOfCreation = "";
  late TextEditingController _startDateController = TextEditingController();
  late TextEditingController _endDateController = TextEditingController();
  late TextEditingController areaController = TextEditingController();
  late TextEditingController _endAreaController = TextEditingController();
  late TextEditingController _enterTextController = TextEditingController();
  late ProposalViewModel proposalViewModel;
  ClearanceTypeModel? clearanceTypeModel;
  bool clearancevisible = false;
  bool statevisible = false;

  Future<Null> selectStartDateForAndroid(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context, initialDate: DateTime.now(), firstDate: DateTime(2020, 8), lastDate: DateTime(2101));
    if (picked != null) {
      startCreation = picked;
      String formattedDate = DateFormat('yyyy-MM-dd').format(picked);

      if (mounted) {
        setState(() {
          startDateOfCreation = formattedDate;
          if (startDateOfCreation != null) {
            startDateOfCreation = formattedDate;
            _startDateController.text =
                startDateOfCreation != "" ? DateFormat('dd-MM-yyyy').format(DateTime.parse(startDateOfCreation)) : "";
          }
        });
      }
    }
  }

  Future<Null> selectEndDateForAndroid(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context, initialDate: selectedDate, firstDate: DateTime(2020, 8), lastDate: DateTime(2101));
    if (picked != null) {
      endCreation = picked;
      String formattedDate = DateFormat('yyyy-MM-dd').format(picked);

      if (mounted) {
        setState(() {
          endDateOfCreation = formattedDate;
          if (endDateOfCreation != null) {
            endDateOfCreation = formattedDate;
            _endDateController.text =
                endDateOfCreation != "" ? DateFormat('dd-MM-yyyy').format(DateTime.parse(endDateOfCreation)) : "";
          }
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();

    proposalViewModel = Provider.of<ProposalViewModel>(context, listen: false);
    proposalViewModel.getDataClearanceType();
    proposalViewModel.getDataStateType();
    proposalViewModel.getPorposalStatus(workgroupId: 0);
    proposalViewModel.getDataAuthority();
    proposalViewModel.getDataSheduleNo();
    proposalViewModel.getDataSectorType();

  }

  var clearencevalue;
  var authorityvalue;
  var shedulenovalue;
  var categoryvalue;
  var proposolStatusValue;
  var proposolTypeevalue;
  var sectorTypeevalue;
  var statevalue;
  var clearanceId;
  var stateCode;

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
        body: Container(
          child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Consumer<ProposalViewModel>(builder: (context, model, child) {
                return Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Track Your Proposal",
                      style: TextStyle(fontSize: 32),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Clearances Type',
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
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.black),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width * 0.94,
                            child: Column(
                              children: [
                                DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    isExpanded: true,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: AppColor.black,
                                    ),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    scrollbarAlwaysShow: true,
                                    scrollbarThickness: 8.0,
                                    dropdownMaxHeight: 200,
                                    selectedItemHighlightColor: AppColor.blue,
                                    itemPadding: EdgeInsets.only(left: 10),
                                    isDense: true,
                                    hint: Text("Select"),
                                    items: model.clearanceTypeModel?.data?.map((item) {
                                      return DropdownMenuItem(
                                        value: item.id,
                                        child: Text(item.name.toString()),
                                      );
                                    }).toList(),
                                    onChanged: (newVal) {
                                      setState(() {
                                        clearencevalue = newVal;
                                        print("check${clearencevalue}");
                                        clearancevisible = true;
                                        proposalViewModel.proposolTypeModel?.data?.clear();
                                        proposolTypeevalue;
                                      });
                                       proposalViewModel.getPorposalType(id: clearencevalue);

                                    },
                                    value: clearencevalue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'State',
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
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.black),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width * 0.94,
                            child: Column(
                              children: [
                                DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    isExpanded: true,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: AppColor.black,
                                    ),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    scrollbarAlwaysShow: true,
                                    scrollbarThickness: 8.0,
                                    dropdownMaxHeight: 200,
                                    selectedItemHighlightColor: AppColor.blue,
                                    itemPadding: EdgeInsets.only(left: 10),
                                    isDense: true,
                                    hint: Text("Select"),
                                    items: model.stateTypeModel?.data?.map((item) {
                                      return DropdownMenuItem(
                                        value: item.code,
                                        child: Text(item.name.toString()),
                                      );
                                    }).toList(),
                                    onChanged: (newVal) {
                                      setState(() {
                                        statevalue = newVal;
                                        print("stt${statevalue}");
                                        statevisible = true;
                                      });
                                    },
                                    value: statevalue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Visibility(
                            visible: clearencevalue==1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                RichText(
                                  text: TextSpan(
                                      text: 'Issuing Authority',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      children: [
                                        // TextSpan(
                                        //     text: ' *',
                                        //     style: TextStyle(
                                        //       color: Colors.red,
                                        //     ))
                                      ]),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColor.black),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.only(top: 10),
                                  width: MediaQuery.of(context).size.width * 0.94,
                                  child: Column(
                                    children: [
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton2(
                                          isExpanded: true,
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            color: AppColor.black,
                                          ),
                                          dropdownDecoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          scrollbarAlwaysShow: true,
                                          scrollbarThickness: 8.0,
                                          dropdownMaxHeight: 200,
                                          selectedItemHighlightColor: AppColor.blue,
                                          itemPadding: EdgeInsets.only(left: 10),
                                          isDense: true,
                                          hint: Text("Select"),
                                          items: model.authorityModel?.data?.map((item) {
                                            return DropdownMenuItem(
                                              value: item.name,
                                              child: Text(item.name.toString()),
                                            );
                                          }).toList(),
                                          onChanged: (newVal)async {
                                            setState(() {
                                              authorityvalue = newVal;
                                              print("check${authorityvalue}");
                                            });

                                          },
                                          value: authorityvalue,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Visibility(
                          //   visible: clearencevalue==1,
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //
                          //       RichText(
                          //         text: TextSpan(
                          //             text: 'Schedule No',
                          //             style: TextStyle(
                          //               color: Colors.black,
                          //             ),
                          //             children: [
                          //               // TextSpan(
                          //               //     text: ' *',
                          //               //     style: TextStyle(
                          //               //       color: Colors.red,
                          //               //     ))
                          //             ]),
                          //       ),
                          //       Container(
                          //         decoration: BoxDecoration(
                          //           border: Border.all(color: AppColor.black),
                          //           borderRadius: BorderRadius.circular(25),
                          //         ),
                          //         padding: const EdgeInsets.all(8),
                          //         margin: const EdgeInsets.only(top: 10),
                          //         width: MediaQuery.of(context).size.width * 0.94,
                          //         child: Column(
                          //           children: [
                          //             DropdownButtonHideUnderline(
                          //               child: DropdownButton2(
                          //                 isExpanded: true,
                          //                 icon: Icon(
                          //                   Icons.keyboard_arrow_down_outlined,
                          //                   color: AppColor.black,
                          //                 ),
                          //                 dropdownDecoration: BoxDecoration(
                          //                   borderRadius: BorderRadius.circular(10),
                          //                 ),
                          //                 scrollbarAlwaysShow: true,
                          //                 scrollbarThickness: 8.0,
                          //                 dropdownMaxHeight: 200,
                          //                 selectedItemHighlightColor: AppColor.blue,
                          //                 itemPadding: EdgeInsets.only(left: 10),
                          //                 isDense: true,
                          //                 hint: Text("Select"),
                          //                 items: model.categoryModel?.data?.map((item) {
                          //                   return DropdownMenuItem(
                          //                     value: item.id,
                          //                     child: Text(item.name.toString()),
                          //                   );
                          //                 }).toList(),
                          //                 onChanged: (newVal)async {
                          //                   setState(() {
                          //                     shedulenovalue = newVal;
                          //                     print("check${shedulenovalue}");
                          //
                          //                   });
                          //
                          //                 },
                          //                 value: shedulenovalue,
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),

                          SizedBox(
                            height: 10,
                          ),
                          Text("Proposal Date"),
                          SizedBox(
                            height: 10,
                          ),
                          Stack(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      // decoration: BoxDecoration(
                                      //   border: Border.all(color: AppColor.black)
                                      // ),
                                      child: TextField(
                                        readOnly: true,
                                        onTap: () {
                                          selectStartDateForAndroid(context);
                                        },
                                        controller: _startDateController,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding: const EdgeInsets.all(8),
                                          border: OutlineInputBorder(borderSide: BorderSide(color: AppColor.black)),
                                          hintText: "mm/dd/yyyy",
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("To"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: TextField(
                                        readOnly: true,
                                        onTap: () {
                                          selectEndDateForAndroid(context);
                                        },
                                        controller: _endDateController,
                                        decoration: const InputDecoration(
                                          isDense: true,
                                          contentPadding: const EdgeInsets.all(8),
                                          border: OutlineInputBorder(),
                                          hintText: "mm/dd/yyyy",
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 85, top: 5),
                                        child: Icon(
                                          Icons.calendar_month,
                                          size: 20,
                                          color: AppColor.black,
                                        ),
                                      ))),
                              Positioned(
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 20, top: 5),
                                        child: Icon(
                                          Icons.calendar_month,
                                          size: 20,
                                          color: AppColor.black,
                                        ),
                                      ))),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Visibility(
                            visible: clearencevalue==2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                      text: 'Area (ha):',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      children: []),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 50,
                                        child: TextField(
                                          controller: areaController,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Enter Area (ha)',
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("To"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 50,
                                        child: TextField(
                                          controller: _endAreaController,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Enter Area (ha)',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'Proposal Type',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                children: []),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.black),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width * 0.94,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    if(clearancevisible==false){
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                        content: Text("Please Select Clearances Type"),
                                      ));
                                    }
                                    },
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      isExpanded: true,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: AppColor.black,
                                      ),
                                      dropdownDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      scrollbarAlwaysShow: true,
                                      scrollbarThickness: 8.0,
                                      dropdownMaxHeight: 200,
                                      selectedItemHighlightColor: AppColor.blue,
                                      itemPadding: EdgeInsets.only(left: 10),
                                      isDense: true,
                                      hint: Text("Select"),
                                      items: model.proposolTypeModel?.data?.map((item) {
                                        return
                                          DropdownMenuItem(
                                          value: item.id,
                                          child: Text(item.name.toString()),
                                        );
                                      }).toList(),
                                      onChanged: (newVal) {
                                        setState(() {
                                          proposolTypeevalue = newVal;
                                          print("check${proposolTypeevalue}");
                                        });

                                      },
                                      value: proposolTypeevalue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'Proposal Status',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                children: []),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.black),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width * 0.94,
                            child: Column(
                              children: [
                                DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    isExpanded: true,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: AppColor.black,
                                    ),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    scrollbarAlwaysShow: true,
                                    scrollbarThickness: 8.0,
                                    dropdownMaxHeight: 200,
                                    selectedItemHighlightColor: AppColor.blue,
                                    itemPadding: EdgeInsets.only(left: 10),
                                    isDense: true,
                                    hint: Text("Select status..."),
                                    items: model.proposolStatusModel?.data?.map((item) {
                                      return DropdownMenuItem(
                                        value: item.name,
                                        child: Text(item.name.toString()),
                                      );
                                    }).toList(),
                                    onChanged: (newVal)async {
                                      setState(() {
                                        proposolStatusValue = newVal;
                                        print("check${proposolStatusValue}");
                                      });

                                    },
                                    value: proposolStatusValue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'Enter Text',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                children: []),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 50,
                            child: TextField(
                              controller: _enterTextController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter Text to Search',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          //category

                          Visibility(
                            visible: clearencevalue==2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                      text: 'Category',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      children: []),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColor.black),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.only(top: 10),
                                  width: MediaQuery.of(context).size.width * 0.94,
                                  child: Column(
                                    children: [
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton2(
                                          isExpanded: true,
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            color: AppColor.black,
                                          ),
                                          dropdownDecoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          scrollbarAlwaysShow: true,
                                          scrollbarThickness: 8.0,
                                          dropdownMaxHeight: 200,
                                          selectedItemHighlightColor: AppColor.blue,
                                          itemPadding: EdgeInsets.only(left: 10),
                                          isDense: true,
                                          hint: Text("Select"),
                                          items: model.categoryModel?.data?.map((item) {
                                            return DropdownMenuItem(
                                              value: item.id,
                                              child: Text(item.name.toString()),
                                            );
                                          }).toList(),
                                          onChanged: (newVal)async {
                                            setState(() {
                                              categoryvalue = newVal;
                                              print("check${categoryvalue}");

                                            });

                                          },
                                          value: categoryvalue,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        //  SizedBox(height: 10,),

                          Visibility(
                            visible: clearencevalue==1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                      text: 'Sector ',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      children: [

                                      ]),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColor.black),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.only(top: 10),
                                  width: MediaQuery.of(context).size.width * 0.94,
                                  child: Column(
                                    children: [
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton2(
                                          isExpanded: true,
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            color: AppColor.black,
                                          ),
                                          dropdownDecoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          scrollbarAlwaysShow: true,
                                          scrollbarThickness: 8.0,
                                          dropdownMaxHeight: 200,
                                          selectedItemHighlightColor: AppColor.blue,
                                          itemPadding: EdgeInsets.only(left: 10),
                                          isDense: true,
                                          hint: Text("Select"),
                                          items: model.sectorTypeModel?.data?.map((item) {
                                            return
                                              DropdownMenuItem(
                                                value: item.id,
                                                child: Text(item.name.toString()),
                                              );
                                          }).toList(),
                                          onChanged: (newVal) {
                                            setState(() {
                                              sectorTypeevalue = newVal;
                                              print("check${sectorTypeevalue}");
                                            });

                                          },
                                          value: sectorTypeevalue,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () async {
                              print(("cler${clearanceId}"));
                              print(("stat${stateCode}"));
                              if (clearancevisible == true) {
                                if (statevisible == true) {
                                  await proposalViewModel.getAdvanceSearchDetails(
                                    majorClearanceType: clearencevalue.toString(),
                                    state: statevalue.toString(),
                                    // sector: "",
                                    // proposalStatus: "",
                                    // proposalType: "",
                                    // issuingAuthority: "",
                                    // activityId: "",
                                    // category: "category",
                                    // startDate: "startDate",
                                    // endDate: "",
                                    // area: "",
                                    // text: ""
                                  );
                                  Navigator.pushNamed(context, AppRoutes.advancesearchdashboard,
                                      arguments:
                                          AdvanceSearchArguments(clearanceId: clearencevalue, stateCode: statevalue));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text("Please Select State"),
                                  ));
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text("Please Select Clearance Type"),
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
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const TrackPorposal()));
                            },
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.orange),
                              width: double.infinity,
                              child: Center(
                                  child: Text(
                                "Hide Advance Search",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              })),
        ),
      ),
    );
  }
}
