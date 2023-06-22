import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parivesh/user_manuals/model/user_manual_crz_model.dart';
import 'package:parivesh/user_manuals/model/user_manual_enviorment_model.dart';
import 'package:parivesh/user_manuals/model/user_manual_wild_model.dart';
import 'package:parivesh/user_manuals/model/user_manuals_forest_model.dart';
import 'package:parivesh/user_manuals/model/user_manuals_model.dart';
import 'package:parivesh/user_manuals/view/pdf_page.dart';
import 'package:parivesh/user_manuals/view_model/user_manual_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../common/appColors.dart';

class UserManuals extends StatefulWidget {
  const UserManuals({Key? key}) : super(key: key);

  @override
  State<UserManuals> createState() => _UserManualsState();
}

class _UserManualsState extends State<UserManuals> {
  UserManualViewModel? userManualViewModel;
  UserManualsOtherModel? userManualsOtherModel;
  UserManualsForestModel? userManualsForestModel;
  UserManualsWildModel? userManualsWildModel;
  UserManualsCrzModel? userManualsCrzModel;
  UserManualsEnviormentModel? userManualsEnviormentModel;
  TextEditingController searchControllerManual = TextEditingController();
  String search = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userManualViewModel = Provider.of<UserManualViewModel>(context, listen: false);
    userManualViewModel?.getUserManualOtherDetails(category: "others");
    userManualViewModel?.getUserManualForestDetails(category: "forest-clearance");
    userManualViewModel?.getUserManualWildDetails(category: "wildlife-clearance");
    userManualViewModel?.getUserManualCrzDetails(category: "crz-clearance");
    userManualViewModel?.getUserManualEnviormentDetails(category: "enviormental-clearance");
  }

  bool other = false;
  bool forest = false;
  bool wild = false;
  bool crz = false;
  bool env = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User Manuals"),
          titleSpacing: 2.0,
          actions: [
            PopupMenuButton(
                // add icon, by default "3 dot" icon
                // icon: Icon(Icons.book)
                itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text("General"),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text("Forest Clearance"),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: Text("Wild Clearance"),
                ),
                PopupMenuItem<int>(
                  value: 3,
                  child: Text("Crz Clearance"),
                ),
                PopupMenuItem<int>(
                  value: 4,
                  child: Text("Enviorment Clearance"),
                ),
              ];
            }, onSelected: (value) {
              if (value == 0) {
                setState(() {
                  other = true;
                  forest = false;
                  wild = false;
                  crz = false;
                  env = false;
                });
              } else if (value == 1) {
                setState(() {
                  other = false;
                  forest = true;
                  wild = false;
                  crz = false;
                  env = false;
                });
              } else if (value == 2) {
                setState(() {
                  other = false;
                  forest = false;
                  wild = true;
                  crz = false;
                  env = false;
                });
              } else if (value == 3) {
                setState(() {
                  other = false;
                  forest = false;
                  wild = false;
                  crz = true;
                  env = false;
                });
              } else if (value == 4) {
                setState(() {
                  other = false;
                  forest = false;
                  wild = false;
                  crz = false;
                  env = true;
                });
              }
            }),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Container(
                //   decoration: BoxDecoration(
                //     border: Border.all(color: AppColor.black,width: 1),
                //     borderRadius: BorderRadius.circular(20),
                //
                //   ),
                //   child: TextField(
                //
                //     controller: searchControllerManual,
                //     decoration:  InputDecoration(
                //         suffixIcon: Icon(Icons.search),
                //         contentPadding: EdgeInsets.only(left: 10,top: 10),
                //         border: InputBorder.none,
                //         hintText: 'Search Category....',
                //         hintStyle: TextStyle(fontWeight: FontWeight.bold)
                //     ),
                //     onChanged: (String? value){
                //       setState(() {
                //         search=value.toString();
                //       });
                //     },
                //   ),
                // ),
                // SizedBox(height: 10,),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Replace with your desired background color
                  ),
                  child: Table(
                    columnWidths: const <int, TableColumnWidth>{
                      0: FlexColumnWidth(1.3),
                      1: FlexColumnWidth(3),
                      2: FlexColumnWidth(1.2),
                    },
                    border: TableBorder.all(width: 2, color: Colors.black45),
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: TableCell(
                              child: Center(
                            child: Text(
                              "Category",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: TableCell(
                              child: Center(child: Text("Manual", style: TextStyle(fontWeight: FontWeight.bold)))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 5),
                          child: TableCell(
                              child: Center(child: Text("View", style: TextStyle(fontWeight: FontWeight.bold)))),
                        ),
                      ]),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                other == true || forest == true || wild == true || crz == true || env == true
                    ? Column(
                        children: [
                          other == true ? othersDetails() : SizedBox.shrink(),
                          forest == true ? forestDetails() :SizedBox.shrink(),
                          wild == true ? wildDetails() : SizedBox.shrink(),
                          crz == true ? crzDetails() : SizedBox.shrink(),
                          env == true ? enviormentDetails() :SizedBox.shrink(),
                        ],
                      )
                    : Column(
                        children: [
                          othersDetails(),
                          forestDetails(),
                          wildDetails(),
                          crzDetails(),
                          enviormentDetails(),
                        ],
                      ),
              ],
            ),
          ),
        ));
  }
}

Widget othersDetails() {
  return Consumer<UserManualViewModel>(builder: (context, model, child) {
    return model.userManualsOtherModel != null
        ? model.userManualsOtherModel?.data?.length != 0
            ? ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: model.userManualsOtherModel?.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  final userManualList = model.userManualsOtherModel?.data?[index];
                  return userManualList?.category == "others"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200, // Replace with your desired background color
                              ),
                              child: Table(
                                columnWidths: const <int, TableColumnWidth>{
                                  0: FlexColumnWidth(1.3),
                                  1: FlexColumnWidth(3),
                                  2: FlexColumnWidth(1.2),
                                },
                                border: TableBorder.all(width: 1, color: Colors.black45),
                                children: [
                                  TableRow(children: [
                                    Container(
                                        margin: EdgeInsets.all(10),
                                        child: TableCell(child: Text(userManualList?.category ?? ""))),
                                    Container(
                                        margin: EdgeInsets.all(10),
                                        child: TableCell(child: Text(userManualList?.title ?? ""))),
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child: GestureDetector(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => PfdPage(
                                                      filepath: userManualList?.pdf,
                                                    ))),
                                        child: TableCell(
                                            child: Icon(
                                          Icons.picture_as_pdf,
                                          color: Colors.red,
                                        )),
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                          ],
                        )
                      : SizedBox.shrink();
                })
            : Center(
                child: Text(
                  "No Data Available (others)",
                  style: TextStyle(color: Colors.black),
                ),
              )
        : Center(
            child: CircularProgressIndicator(
            color: Colors.green,
          ));
  });
}

Widget forestDetails() {
  return Consumer<UserManualViewModel>(builder: (context, model, child) {
    return model.userManualsForestModel != null
        ? model.userManualsForestModel?.data?.length != 0
            ? ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: model.userManualsForestModel?.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  final userManualForestList = model.userManualsForestModel?.data?[index];
                  return userManualForestList?.category == "forest-clearance"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.tealAccent.shade100, // Replace with your desired background color
                              ),
                              child: Table(
                                columnWidths: const <int, TableColumnWidth>{
                                  0: FlexColumnWidth(1.3),
                                  1: FlexColumnWidth(3),
                                  2: FlexColumnWidth(1.2),
                                },
                                border: TableBorder.all(width: 1, color: Colors.black45),
                                children: [
                                  TableRow(children: [
                                    Container(
                                        margin: EdgeInsets.all(10),
                                        child: TableCell(child: Text(userManualForestList?.category ?? ""))),
                                    Container(
                                        margin: EdgeInsets.all(10),
                                        child: TableCell(child: Text(userManualForestList?.title ?? ""))),
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child: GestureDetector(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => PfdPage(
                                                      filepath: userManualForestList?.pdf,
                                                    ))),
                                        child: TableCell(
                                            child: Icon(
                                          Icons.picture_as_pdf,
                                          color: Colors.red,
                                        )),
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                          ],
                        )
                      : SizedBox.shrink();
                })
            : Center(
                child: Text(
                  "No Data Available(forest-clearance)",
                  style: TextStyle(color: Colors.black),
                ),
              )
        : Center(
            child: CircularProgressIndicator(
            color: Colors.green,
          ));
  });
}

Widget wildDetails() {
  return Consumer<UserManualViewModel>(builder: (context, model, child) {
    return model.userManualsWildModel != null
        ? model.userManualsWildModel?.data?.length != 0
            ? ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: model.userManualsWildModel?.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  final userManualWildList = model.userManualsWildModel?.data?[index];
                  return userManualWildList?.category == "wildlife-clearance"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.yellow.shade200, // Replace with your desired background color
                              ),
                              child: Table(
                                columnWidths: const <int, TableColumnWidth>{
                                  0: FlexColumnWidth(1.3),
                                  1: FlexColumnWidth(3),
                                  2: FlexColumnWidth(1.2),
                                },
                                border: TableBorder.all(width: 1, color: Colors.black45),
                                children: [
                                  TableRow(children: [
                                    Container(
                                        margin: EdgeInsets.all(10),
                                        child: TableCell(child: Text(userManualWildList?.category ?? ""))),
                                    Container(
                                        margin: EdgeInsets.all(10),
                                        child: TableCell(child: Text(userManualWildList?.title ?? ""))),
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child: GestureDetector(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => PfdPage(
                                                      filepath: userManualWildList?.pdf,
                                                    ))),
                                        child: TableCell(
                                            child: Icon(
                                          Icons.picture_as_pdf,
                                          color: Colors.red,
                                        )),
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                          ],
                        )
                      : SizedBox.shrink();
                })
            : Center(
                child: Text(
                  "No Data Available (wildlife-clearance)",
                  style: TextStyle(color: Colors.black),
                ),
              )
        : Center(
            child: CircularProgressIndicator(
            color: Colors.green,
          ));
  });
}

Widget crzDetails() {
  return Consumer<UserManualViewModel>(builder: (context, model, child) {
    return model.userManualsCrzModel != null
        ? model.userManualsCrzModel?.data?.length != 0
            ? ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: model.userManualsCrzModel?.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  final userManualCrzList = model.userManualsCrzModel?.data?[index];
                  return userManualCrzList?.category == "crz-clearance"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue.shade100, // Replace with your desired background color
                              ),
                              child: Table(
                                columnWidths: const <int, TableColumnWidth>{
                                  0: FlexColumnWidth(1.3),
                                  1: FlexColumnWidth(3),
                                  2: FlexColumnWidth(1.2),
                                },
                                border: TableBorder.all(width: 1, color: Colors.black45),
                                children: [
                                  TableRow(children: [
                                    Container(
                                        margin: EdgeInsets.all(10),
                                        child: TableCell(child: Text(userManualCrzList?.category ?? ""))),
                                    Container(
                                        margin: EdgeInsets.all(10),
                                        child: TableCell(child: Text(userManualCrzList?.title ?? ""))),
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child: GestureDetector(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => PfdPage(
                                                      filepath: userManualCrzList?.pdf,
                                                    ))),
                                        child: TableCell(
                                            child: Icon(
                                          Icons.picture_as_pdf,
                                          color: Colors.red,
                                        )),
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                          ],
                        )
                      : SizedBox.shrink();
                })
            : Center(
                child: Text(
                  "No Data Available (crz-clearance)",
                  style: TextStyle(color: Colors.black),
                ),
              )
        : Center(
            child: CircularProgressIndicator(
            color: Colors.green,
          ));
  });
}

Widget enviormentDetails() {
  return Consumer<UserManualViewModel>(builder: (context, model, child) {
    return model.userManualsEnviormentModel != null
        ? model.userManualsEnviormentModel?.data?.length != 0
            ? ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: model.userManualsEnviormentModel?.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  final userManualEnviormentList = model.userManualsEnviormentModel?.data?[index];
                  return userManualEnviormentList?.category == "enviormental-clearance"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Table(
                              columnWidths: const <int, TableColumnWidth>{
                                0: FlexColumnWidth(1.3),
                                1: FlexColumnWidth(3),
                                2: FlexColumnWidth(1.2),
                              },
                              border: TableBorder.all(width: 1, color: Colors.black45),
                              children: [
                                TableRow(children: [
                                  Container(
                                      margin: EdgeInsets.all(10),
                                      child: TableCell(child: Text(userManualEnviormentList?.category ?? ""))),
                                  Container(
                                      margin: EdgeInsets.all(10),
                                      child: TableCell(child: Text(userManualEnviormentList?.title ?? ""))),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => PfdPage(
                                                    filepath: userManualEnviormentList?.pdf,
                                                  ))),
                                      child: TableCell(
                                          child: Icon(
                                        Icons.picture_as_pdf,
                                        color: Colors.red,
                                      )),
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ],
                        )
                      : SizedBox.shrink();
                })
            : Center(
                child: Text(
                  "No Data Available (enviormental-clearance)",
                  style: TextStyle(color: Colors.black),
                ),
              )
        : Center(
            child: CircularProgressIndicator(
            color: Colors.green,
          ));
  });
}
