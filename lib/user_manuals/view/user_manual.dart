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

class UserManuals extends StatefulWidget {
  const UserManuals({Key? key}) : super(key: key);

  @override
  State<UserManuals> createState() => _UserManualsState();
}

class _UserManualsState extends State<UserManuals> {
  UserManualViewModel? userManualViewModel;
  UserManualsOtherModel? userManualsOtherModel;
  UserManualsForestModel?userManualsForestModel;
  UserManualsWildModel?userManualsWildModel;
  UserManualsCrzModel?userManualsCrzModel;
  UserManualsEnviormentModel?userManualsEnviormentModel;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User Manuals"),
          titleSpacing: 2.0,
        ),
        body:
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                      TableRow(
                          children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 5),
                          child: TableCell(
                              child: Text(
                            "Category",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 25),
                          child: TableCell(child: Text("User Manual Name	", style: TextStyle(fontWeight: FontWeight.bold))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 10,bottom: 5),
                          child: TableCell(child: Text("Download Manual", style: TextStyle(fontWeight: FontWeight.bold))),
                        ),
                      ]),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1,
                ),

                othersDetails(),
                forestDetails(),
                wildDetails(),
                crzDetails(),
                enviormentDetails(),



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
  return
    Consumer<UserManualViewModel>(builder: (context, model, child) {
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
  return
    Consumer<UserManualViewModel>(builder: (context, model, child) {
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
  return
    Consumer<UserManualViewModel>(builder: (context, model, child) {
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

