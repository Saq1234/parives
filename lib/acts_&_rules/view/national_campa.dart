import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parivesh/acts_&_rules/view/pdf_page.dart';

import '../../common/no_network.dart';
import '../model/national_campa/acts_model.dart';
import '../model/national_campa/apo/apo20221_model.dart';
import '../model/national_campa/apo/apo2022_model.dart';
import '../model/national_campa/apo/apo2023_model.dart';
import '../model/national_campa/guideline_model.dart';
import '../model/national_campa/rules_model.dart';
import '../model/national_campa/sanction/sanction2019_model.dart';
import '../model/national_campa/sanction/sanction2020_model.dart';
import '../model/national_campa/sanction/sanction20221_model.dart';
import '../model/national_campa/sanction/sanction2022_model.dart';
import '../model/national_campa/sanction/sanction2023_model.dart';

class NationalCampa extends StatefulWidget {
  const NationalCampa({Key? key}) : super(key: key);

  @override
  State<NationalCampa> createState() => _NationalCampaState();
}

class _NationalCampaState extends State<NationalCampa> {
  bool enableContainer = false;
  bool _connectionStatus = true;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    Snac2021Model();
  }
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
  Widget build(BuildContext context) {
    return _connectionStatus == true?
      Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Container(
              width: MediaQuery.of(context).size.width / 1.1,
              child: Text(
                "National Campa",
                maxLines: 2,
              )),
          titleSpacing: 2.0,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
            child: Column(
              children: [
                Card(
                  elevation: 2,
                  color: Colors.grey.shade100,
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.only(left: 10, right: 10),
                    title: Text(
                      "Acts",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    children: <Widget>[
                      Container(
                        height: ActsLiist.length >= 2 ? MediaQuery.of(context).size.height / 3 : 80,
                        child: Scrollbar(
                          isAlwaysShown: true,
                          thickness: 10,
                          showTrackOnHover: true,
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: ActsLiist.length,
                              itemBuilder: (BuildContext context, int index) {
                                ActsModel Actslist = ActsLiist[index];
                                return Column(
                                  children: [
                                    Divider(color: Colors.black,),

                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => PfdPage(
                                                    filepath: Actslist.url,
                                                  ))),
                                      child: ListTile(
                                        leading: Icon(
                                          Icons.picture_as_pdf,
                                          color: Colors.red,
                                        ),
                                        title: Text(
                                          Actslist.name.toString(),
                                          style: TextStyle(),
                                        ),
                                        minLeadingWidth: 2,
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 2,
                  color: Colors.grey.shade100,
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.only(left: 10, right: 10),
                    title: Text(
                      "Rules",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height / 8,
                        child: Scrollbar(
                          isAlwaysShown: true,
                          thickness: 10,
                          showTrackOnHover: true,
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: RulesList.length,
                              itemBuilder: (BuildContext context, int index) {
                                RulesModel Ruleslist = RulesList[index];
                                return Column(
                                  children: [
                                    Divider(color: Colors.black,),

                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => PfdPage(
                                                    filepath: Ruleslist.url,
                                                  ))),
                                      child: ListTile(
                                        leading: Icon(
                                          Icons.picture_as_pdf,
                                          color: Colors.red,
                                        ),
                                        title: Text(
                                          Ruleslist.name.toString(),
                                          style: TextStyle(),
                                        ),
                                        minLeadingWidth: 2,
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 2,
                  color: Colors.grey.shade100,
                  child: ExpansionTile(
                    title: Text(
                      "Guideline",
                      style: TextStyle(fontSize: 16),
                    ),
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height / 8,
                        child: Scrollbar(
                          isAlwaysShown: true,
                          thickness: 10,
                          showTrackOnHover: true,
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: GuidelineList.length,
                              itemBuilder: (BuildContext context, int index) {
                                GuidelineModel GuidelinelList = GuidelineList[index];
                                return Column(
                                  children: [
                                    Divider(color: Colors.black,),

                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => PfdPage(
                                                    filepath: GuidelinelList.url,
                                                  ))),
                                      child: ListTile(
                                        leading: Icon(
                                          Icons.picture_as_pdf,
                                          color: Colors.red,
                                        ),
                                        title: Text(
                                          GuidelinelList.name.toString(),
                                          style: TextStyle(),
                                        ),
                                        minLeadingWidth: 2,
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      enableContainer = true;
                    });
                  },
                  child:
                  Card(
                    elevation: 2,
                    color: Colors.grey.shade100,
                    child: ExpansionTile(
                     // tilePadding: EdgeInsets.only(left: 10, right: 10),
                      title: Text(
                        "Sanctions",
                        style: TextStyle(fontSize: 16),
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              Card(
                                elevation: 2,
                                //   color: Colors.grey.shade100,
                                child: ExpansionTile(
                                 // tilePadding: EdgeInsets.only(left: 10, right: 20),
                                  title: Text(
                                    "2023",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  children: <Widget>[
                                    Container(
                                      height: MediaQuery.of(context).size.height / 3,
                                      child: Scrollbar(
                                        isAlwaysShown: true,
                                        thickness: 10,
                                        showTrackOnHover: true,
                                        child: ListView.builder(
                                            physics: BouncingScrollPhysics(),
                                            itemCount: Snac2023List.length,
                                            itemBuilder: (BuildContext context, int index) {
                                              Snac2023Model Snac2023list = Snac2023List[index];
                                              return Card(
                                                color: Colors.white,
                                                elevation: 2,
                                                child: ExpansionTile(
                                                  title: Text(Snac2023list.name.toString()),
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(right: 15, left: 5, bottom: 5),
                                                      child: Table(
                                                        border: TableBorder.all(width: 1, color: Colors.black45),
                                                        //table border

                                                        children: [
                                                          TableRow(children: [
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets.only(left: 15, top: 10, right: 5),
                                                              child: TableCell(child: Text("	File No")),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.only(top: 10),
                                                              child: TableCell(child: Text("	Sanction Date")),
                                                            ),
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets.only(top: 10, left: 15, bottom: 5),
                                                              child: TableCell(child: Text("	View Sanction Letter")),
                                                            ),
                                                          ]),
                                                          TableRow(
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets.only(
                                                                    left: 5, top: 15, bottom: 10),
                                                                child: TableCell(
                                                                    child: Text(Snac2023list.fileNo.toString())),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.only(
                                                                    left: 5, top: 15, bottom: 10),
                                                                child: TableCell(
                                                                    child:
                                                                    Text(Snac2023list.sanctionDate.toString())),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.only(top: 15, bottom: 10),
                                                                child: GestureDetector(
                                                                    onTap: () => Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) => PfdPage(
                                                                              filepath: Snac2023list.url,
                                                                            ))),
                                                                    child: TableCell(
                                                                        child: Icon(
                                                                          Icons.picture_as_pdf,
                                                                          color: Colors.red,
                                                                        ))),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          title: Container(
                            child: Column(
                              children: [
                                Card(
                                  elevation: 2,
                                //  color: Colors.grey.shade100,
                                  child: ExpansionTile(
                                    tilePadding: EdgeInsets.only(left: 10, right: 10),
                                    title: Text(
                                      "2022",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    children: <Widget>[
                                      Container(
                                        height: MediaQuery.of(context).size.height / 3,
                                        child: Scrollbar(
                                          isAlwaysShown: true,
                                          thickness: 10,
                                          showTrackOnHover: true,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                              physics: BouncingScrollPhysics(),
                                              itemCount: Snac2022List.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                Snac2022Model Snac2022list = Snac2022List[index];
                                                return Card(
                                                  elevation: 2,
                                                  child: ExpansionTile(
                                                    title: Text(Snac2022list.name.toString()),
                                                    children: [
                                                      Column(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 5,right: 15),
                                                                  child: Table(
                                                                    border: TableBorder.all(width: 1, color: Colors.black45),
                                                                    //table border
                                                                    children: [
                                                                      TableRow(children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              left: 15, top: 10, right: 5),
                                                                          child: TableCell(child: Text("	File No")),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(top: 10),
                                                                          child: TableCell(child: Text("	Sanction Date")),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              top: 10, left: 15, bottom: 5),
                                                                          child:
                                                                              TableCell(child: Text("	View Sanction Letter")),
                                                                        ),
                                                                      ]),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                    height: MediaQuery.of(context).size.height/7,
                                                                    margin: const EdgeInsets.only(right: 15, left: 5, bottom: 5),
                                                                    child: ListView.builder(
                                                                        itemCount: Snac2022List[index].data?.length,
                                                                        itemBuilder: (BuildContext context, int index) {
                                                                          return Table(
                                                                            border: TableBorder.all(
                                                                                width: 1, color: Colors.black45),
                                                                            //table border

                                                                            children: [
                                                                              TableRow(
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(
                                                                                        left: 5, top: 15, bottom: 10),
                                                                                    child: TableCell(
                                                                                        child: Text(Snac2022list
                                                                                            .data![index].FileNo
                                                                                            .toString())),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(
                                                                                        left: 5, top: 15, bottom: 10),
                                                                                    child: TableCell(
                                                                                        child: Text(Snac2022list
                                                                                            .data![index].sanctionDate
                                                                                            .toString())),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(
                                                                                        top: 15, bottom: 10),
                                                                                    child: GestureDetector(
                                                                                        onTap: () => Navigator.push(
                                                                                            context,
                                                                                            MaterialPageRoute(
                                                                                                builder: (context) => PfdPage(
                                                                                                      filepath: Snac2022list
                                                                                                          .data![index].url,
                                                                                                    ))),
                                                                                        child: TableCell(
                                                                                            child: Icon(
                                                                                          Icons.picture_as_pdf,
                                                                                          color: Colors.red,
                                                                                        ))),
                                                                                  )
                                                                                ],
                                                                              )
                                                                            ],
                                                                          );
                                                                        })),
                                                              ],
                                                            )
                                                    ],
                                                  ),
                                                );
                                              }),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                        ListTile(
                          title: Container(
                            child: Column(
                              children: [
                                Card(
                                  elevation: 2,
                                //  color: Colors.grey.shade100,
                                  child: ExpansionTile(
                                    tilePadding: EdgeInsets.only(left: 10, right: 10),
                                    title: Text(
                                      "2021",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    children: <Widget>[
                                      Container(
                                        height: MediaQuery.of(context).size.height / 2,
                                        child: Scrollbar(
                                          isAlwaysShown: true,
                                          thickness: 10,
                                          showTrackOnHover: true,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                              physics: BouncingScrollPhysics(),
                                              itemCount: Snac2021List.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                Snac2021Model Snac2021list = Snac2021List[index];
                                                return Card(
                                                  elevation: 2,
                                                  child: ExpansionTile(
                                                    title: Text(Snac2021list.name.toString()),
                                                    children: [
                                                      Column(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 5,right: 15),
                                                                  child: Table(
                                                                    border: TableBorder.all(width: 1, color: Colors.black45),
                                                                    //table border
                                                                    children: [
                                                                      TableRow(children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              left: 15, top: 10, right: 5),
                                                                          child: TableCell(child: Text("	File No")),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(top: 10),
                                                                          child: TableCell(child: Text("	Sanction Date")),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              top: 10, left: 15, bottom: 5),
                                                                          child:
                                                                              TableCell(child: Text("	View Sanction Letter")),
                                                                        ),
                                                                      ]),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                //  color:Colors.amber,
                                                                    height:MediaQuery.of(context).size.height/3.5,
                                                                    margin: const EdgeInsets.only(right: 15, left: 5, bottom: 5),
                                                                    child: ListView.builder(
                                                                      physics: BouncingScrollPhysics(),
                                                                        itemCount: Snac2021List[index].data?.length,
                                                                        itemBuilder: (BuildContext context, int index) {
                                                                          return Table(
                                                                            border: TableBorder.all(
                                                                                width: 1, color: Colors.black45),
                                                                            //table border

                                                                            children: [
                                                                              TableRow(
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(
                                                                                        left: 5, top: 15, bottom: 10),
                                                                                    child: TableCell(
                                                                                        child: Text(Snac2021list
                                                                                            .data![index].FileNo
                                                                                            .toString())),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(
                                                                                        left: 5, top: 15, bottom: 10),
                                                                                    child: TableCell(
                                                                                        child: Text(Snac2021list
                                                                                            .data![index].sanctionDate
                                                                                            .toString())),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(
                                                                                        top: 15, bottom: 10),
                                                                                    child: GestureDetector(
                                                                                        onTap: () => Navigator.push(
                                                                                            context,
                                                                                            MaterialPageRoute(
                                                                                                builder: (context) => PfdPage(
                                                                                                      filepath: Snac2021list
                                                                                                          .data![index].url,
                                                                                                    ))),
                                                                                        child: TableCell(
                                                                                            child: Icon(
                                                                                          Icons.picture_as_pdf,
                                                                                          color: Colors.red,
                                                                                        ))),
                                                                                  )
                                                                                ],
                                                                              )
                                                                            ],
                                                                          );
                                                                        })),
                                                              ],
                                                            )
                                                    ],
                                                  ),
                                                );
                                              }),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                        ListTile(
                          title: Container(
                            child: Column(
                              children: [
                                Card(
                                  elevation: 2,
                                 // color: Colors.grey.shade100,
                                  child: ExpansionTile(
                                    tilePadding: EdgeInsets.only(left: 10, right: 10),
                                    title: Text(
                                      "2020",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    children: <Widget>[
                                      Container(
                                        height: MediaQuery.of(context).size.height / 2,
                                        child: Scrollbar(
                                          isAlwaysShown: true,
                                          thickness: 10,
                                          showTrackOnHover: true,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                              physics: BouncingScrollPhysics(),
                                              itemCount: Snac2020List.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                Snac2020Model Snac2020list = Snac2020List[index];
                                                return Card(
                                                  elevation: 2,
                                                  child: ExpansionTile(
                                                    title: Text(Snac2020list.name.toString()),
                                                    children: [
                                                      Column(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 5,right: 15),
                                                                  child: Table(
                                                                    border: TableBorder.all(width: 1, color: Colors.black45),
                                                                    //table border
                                                                    children: [
                                                                      TableRow(children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              left: 15, top: 10, right: 5),
                                                                          child: TableCell(child: Text("	File No")),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(top: 10),
                                                                          child: TableCell(child: Text("	Sanction Date")),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              top: 10, left: 15, bottom: 5),
                                                                          child:
                                                                              TableCell(child: Text("	View Sanction Letter")),
                                                                        ),
                                                                      ]),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                //  color:Colors.amber,
                                                                    height:MediaQuery.of(context).size.height/3.5,
                                                                    margin: const EdgeInsets.only(right: 15, left: 5, bottom: 5),
                                                                    child: ListView.builder(
                                                                      physics: BouncingScrollPhysics(),
                                                                        itemCount: Snac2020List[index].data?.length,
                                                                        itemBuilder: (BuildContext context, int index) {
                                                                          return Table(
                                                                            border: TableBorder.all(
                                                                                width: 1, color: Colors.black45),
                                                                            //table border

                                                                            children: [
                                                                              TableRow(
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(
                                                                                        left: 5, top: 15, bottom: 10),
                                                                                    child: TableCell(
                                                                                        child: Text(Snac2020list
                                                                                            .data![index].FileNo
                                                                                            .toString())),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(
                                                                                        left: 5, top: 15, bottom: 10),
                                                                                    child: TableCell(
                                                                                        child: Text(Snac2020list
                                                                                            .data![index].sanctionDate
                                                                                            .toString())),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(
                                                                                        top: 15, bottom: 10),
                                                                                    child: GestureDetector(
                                                                                        onTap: () => Navigator.push(
                                                                                            context,
                                                                                            MaterialPageRoute(
                                                                                                builder: (context) => PfdPage(
                                                                                                      filepath: Snac2020list
                                                                                                          .data![index].url,
                                                                                                    ))),
                                                                                        child: TableCell(
                                                                                            child: Icon(
                                                                                          Icons.picture_as_pdf,
                                                                                          color: Colors.red,
                                                                                        ))),
                                                                                  )
                                                                                ],
                                                                              )
                                                                            ],
                                                                          );
                                                                        })),
                                                              ],
                                                            )
                                                    ],
                                                  ),
                                                );
                                              }),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                        ListTile(
                          title: Container(
                            child: Column(
                              children: [
                                Card(
                                  elevation: 2,
                                //  color: Colors.grey.shade100,
                                  child: ExpansionTile(
                                    tilePadding: EdgeInsets.only(left: 10, right: 10),
                                    title: Text(
                                      "2019",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    children: <Widget>[
                                      Container(
                                        height: MediaQuery.of(context).size.height / 2,
                                        child: Scrollbar(
                                          isAlwaysShown: true,
                                          thickness: 10,
                                          showTrackOnHover: true,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                              physics: BouncingScrollPhysics(),
                                              itemCount: Snac2019List.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                Snac2019Model Snac2019list = Snac2019List[index];
                                                return Card(
                                                  elevation: 2,
                                                  child: ExpansionTile(
                                                    title: Text(Snac2019list.name.toString()),
                                                    children: [
                                                      Column(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 5,right: 15),
                                                                  child: Table(
                                                                    border: TableBorder.all(width: 1, color: Colors.black45),
                                                                    //table border
                                                                    children: [
                                                                      TableRow(children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              left: 15, top: 10, right: 5),
                                                                          child: TableCell(child: Text("	File No")),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(top: 10),
                                                                          child: TableCell(child: Text("	Sanction Date")),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              top: 10, left: 15, bottom: 5),
                                                                          child:
                                                                              TableCell(child: Text("	View Sanction Letter")),
                                                                        ),
                                                                      ]),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                //  color:Colors.amber,
                                                                    height:MediaQuery.of(context).size.height/3.5,
                                                                    margin: const EdgeInsets.only(right: 15, left: 5, bottom: 5),
                                                                    child: ListView.builder(
                                                                      physics: BouncingScrollPhysics(),
                                                                        itemCount: Snac2019List[index].data?.length,
                                                                        itemBuilder: (BuildContext context, int index) {
                                                                          return Table(
                                                                            border: TableBorder.all(
                                                                                width: 1, color: Colors.black45),
                                                                            //table border

                                                                            children: [
                                                                              TableRow(
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(
                                                                                        left: 5, top: 15, bottom: 10),
                                                                                    child: TableCell(
                                                                                        child: Text(Snac2019list
                                                                                            .data![index].FileNo
                                                                                            .toString())),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(
                                                                                        left: 5, top: 15, bottom: 10),
                                                                                    child: TableCell(
                                                                                        child: Text(Snac2019list
                                                                                            .data![index].sanctionDate
                                                                                            .toString())),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsets.only(
                                                                                        top: 15, bottom: 10),
                                                                                    child: GestureDetector(
                                                                                        onTap: () => Navigator.push(
                                                                                            context,
                                                                                            MaterialPageRoute(
                                                                                                builder: (context) => PfdPage(
                                                                                                      filepath: Snac2019list
                                                                                                          .data![index].url,
                                                                                                    ))),
                                                                                        child: TableCell(
                                                                                            child: Icon(
                                                                                          Icons.picture_as_pdf,
                                                                                          color: Colors.red,
                                                                                        ))),
                                                                                  )
                                                                                ],
                                                                              )
                                                                            ],
                                                                          );
                                                                        })),
                                                              ],
                                                            )
                                                    ],
                                                  ),
                                                );
                                              }),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 2,
                  color: Colors.grey.shade100,
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.only(left: 10, right: 10),
                    title: Text(
                      "Apo",
                      style: TextStyle(fontSize: 16),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Container(
                          child: Column(
                            children: [
                              Card(
                                elevation: 2,
                              //  color: Colors.grey.shade100,
                                child: ExpansionTile(
                                  tilePadding: EdgeInsets.only(left: 10, right: 10),
                                  title: Text(
                                    "2023",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  children: <Widget>[
                                    Container(
                                      height: MediaQuery.of(context).size.height / 3,
                                      child: Scrollbar(
                                        isAlwaysShown: true,
                                        thickness: 10,
                                        showTrackOnHover: true,
                                        child: ListView.builder(
                                            physics: BouncingScrollPhysics(),
                                            itemCount: Apo2023List.length,
                                            itemBuilder: (BuildContext context, int index) {
                                              Apo2023Model Apo2023list = Apo2023List[index];
                                              return Card(
                                                elevation: 2,
                                                child: ExpansionTile(
                                                  title: Text(Apo2023list.name.toString()),
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 5,right: 15),
                                                          child: Table(
                                                            border: TableBorder.all(width: 1, color: Colors.black45),
                                                            //table border
                                                            children: [
                                                              TableRow(children: [
                                                                Padding(
                                                                  padding: const EdgeInsets.only(
                                                                      left: 15, top: 10, right: 5),
                                                                  child: TableCell(child: Text("	File No")),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(top: 10,left: 10),
                                                                  child: TableCell(child: Text("Apo Date")),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(
                                                                      top: 10, left: 15, bottom: 5),
                                                                  child:
                                                                  TableCell(child: Text("	View Apo Letter")),
                                                                ),
                                                              ]),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          //  color:Colors.amber,
                                                            height:MediaQuery.of(context).size.height/3.5,
                                                            margin: const EdgeInsets.only(right: 15, left: 5, bottom: 5),
                                                            child: ListView.builder(
                                                                physics: BouncingScrollPhysics(),
                                                                itemCount: Apo2023List[index].apodata?.length,
                                                                itemBuilder: (BuildContext context, int index) {
                                                                  return Table(
                                                                    border: TableBorder.all(
                                                                        width: 1, color: Colors.black45),
                                                                    //table border

                                                                    children: [
                                                                      TableRow(
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsets.only(
                                                                                left: 5, top: 15, bottom: 10),
                                                                            child: TableCell(
                                                                                child: Text(Apo2023list
                                                                                    .apodata![index].FileNo
                                                                                    .toString())),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsets.only(
                                                                                left: 5, top: 15, bottom: 10),
                                                                            child: TableCell(
                                                                                child: Text(Apo2023list
                                                                                    .apodata![index].apoDate
                                                                                    .toString())),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsets.only(
                                                                                top: 15, bottom: 10),
                                                                            child: GestureDetector(
                                                                                onTap: () => Navigator.push(
                                                                                    context,
                                                                                    MaterialPageRoute(
                                                                                        builder: (context) => PfdPage(
                                                                                          filepath: Apo2023list
                                                                                              .apodata![index].url,
                                                                                        ))),
                                                                                child: TableCell(
                                                                                    child: Icon(
                                                                                      Icons.picture_as_pdf,
                                                                                      color: Colors.red,
                                                                                    ))),
                                                                          )
                                                                        ],
                                                                      )
                                                                    ],
                                                                  );
                                                                })),
                                                      ],
                                                    )                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        title: Container(
                          child: Column(
                            children: [
                              Card(
                                elevation: 2,
                              //  color: Colors.grey.shade100,
                                child: ExpansionTile(
                                  tilePadding: EdgeInsets.only(left: 10, right: 10),
                                  title: Text(
                                    "2022",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  children: <Widget>[
                                    Container(
                                      height: MediaQuery.of(context).size.height / 3,
                                      child: Scrollbar(
                                        isAlwaysShown: true,
                                        thickness: 10,
                                        showTrackOnHover: true,
                                        child: ListView.builder(
                                            physics: BouncingScrollPhysics(),
                                            itemCount: Apo2022List.length,
                                            itemBuilder: (BuildContext context, int index) {
                                              Apo2022Model Apo2022list = Apo2022List[index];
                                              return Card(
                                                elevation: 2,
                                                child: ExpansionTile(
                                                  title: Text(Apo2022list.name.toString()),
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 5,right: 15),
                                                          child: Table(
                                                            border: TableBorder.all(width: 1, color: Colors.black45),
                                                            //table border
                                                            children: [
                                                              TableRow(children: [
                                                                Padding(
                                                                  padding: const EdgeInsets.only(
                                                                      left: 15, top: 10, right: 5),
                                                                  child: TableCell(child: Text("	File No")),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(top: 10,left: 10),
                                                                  child: TableCell(child: Text("APO Date")),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(
                                                                      top: 10, left: 15, bottom: 5),
                                                                  child:
                                                                  TableCell(child: Text("	View Apo Letter")),
                                                                ),
                                                              ]),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          //  color:Colors.amber,
                                                            height:MediaQuery.of(context).size.height/3.5,
                                                            margin: const EdgeInsets.only(right: 15, left: 5, bottom: 5),
                                                            child: ListView.builder(
                                                                physics: BouncingScrollPhysics(),
                                                                itemCount: Apo2022List[index].Apodata?.length,
                                                                itemBuilder: (BuildContext context, int index) {
                                                                  return Table(
                                                                    border: TableBorder.all(
                                                                        width: 1, color: Colors.black45),
                                                                    //table border

                                                                    children: [
                                                                      TableRow(
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsets.only(
                                                                                left: 5, top: 15, bottom: 10),
                                                                            child: TableCell(
                                                                                child: Text(Apo2022list
                                                                                    .Apodata![index].FileNo
                                                                                    .toString())),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsets.only(
                                                                                left: 5, top: 15, bottom: 10),
                                                                            child: TableCell(
                                                                                child: Text(Apo2022list
                                                                                    .Apodata![index].apoDate
                                                                                    .toString())),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsets.only(
                                                                                top: 15, bottom: 10),
                                                                            child: GestureDetector(
                                                                                onTap: () => Navigator.push(
                                                                                    context,
                                                                                    MaterialPageRoute(
                                                                                        builder: (context) => PfdPage(
                                                                                          filepath: Apo2022list
                                                                                              .Apodata![index].url,
                                                                                        ))),
                                                                                child: TableCell(
                                                                                    child: Icon(
                                                                                      Icons.picture_as_pdf,
                                                                                      color: Colors.red,
                                                                                    ))),
                                                                          )
                                                                        ],
                                                                      )
                                                                    ],
                                                                  );
                                                                })),
                                                      ],
                                                    )                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        title: Container(
                          child: Column(
                            children: [
                              Card(
                                elevation: 2,
                              //  color: Colors.grey.shade100,
                                child: ExpansionTile(
                                  tilePadding: EdgeInsets.only(left: 10, right: 10),
                                  title: Text(
                                    "2021",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  children: <Widget>[
                                    Container(
                                      height: MediaQuery.of(context).size.height / 3,
                                      child: Scrollbar(
                                        isAlwaysShown: true,
                                        thickness: 10,
                                        showTrackOnHover: true,
                                        child: ListView.builder(
                                            physics: BouncingScrollPhysics(),
                                            itemCount: Apo2021List.length,
                                            itemBuilder: (BuildContext context, int index) {
                                              Apo2021Model Apo2021list = Apo2021List[index];
                                              return Card(
                                                elevation: 2,
                                                child: ExpansionTile(
                                                  title: Text(Apo2021list.name.toString()),
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 5,right: 15),
                                                          child: Table(
                                                            border: TableBorder.all(width: 1, color: Colors.black45),
                                                            //table border
                                                            children: [
                                                              TableRow(children: [
                                                                Padding(
                                                                  padding: const EdgeInsets.only(
                                                                      left: 15, top: 10, right: 5),
                                                                  child: TableCell(child: Text("	File No")),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(top: 10,left: 10),
                                                                  child: TableCell(child: Text("APO Date")),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(
                                                                      top: 10, left: 15, bottom: 5),
                                                                  child:
                                                                  TableCell(child: Text("	View Apo Letter")),
                                                                ),
                                                              ]),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          //  color:Colors.amber,
                                                            height:MediaQuery.of(context).size.height/3.5,
                                                            margin: const EdgeInsets.only(right: 15, left: 5, bottom: 5),
                                                            child: ListView.builder(
                                                                physics: BouncingScrollPhysics(),
                                                                itemCount: Apo2021List[index].Apodata?.length,
                                                                itemBuilder: (BuildContext context, int index) {
                                                                  return Table(
                                                                    border: TableBorder.all(
                                                                        width: 1, color: Colors.black45),
                                                                    //table border

                                                                    children: [
                                                                      TableRow(
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsets.only(
                                                                                left: 5, top: 15, bottom: 10),
                                                                            child: TableCell(
                                                                                child: Text(Apo2021list
                                                                                    .Apodata![index].FileNo
                                                                                    .toString())),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsets.only(
                                                                                left: 5, top: 15, bottom: 10),
                                                                            child: TableCell(
                                                                                child: Text(Apo2021list
                                                                                    .Apodata![index].apoDate
                                                                                    .toString())),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsets.only(
                                                                                top: 15, bottom: 10),
                                                                            child: GestureDetector(
                                                                                onTap: () => Navigator.push(
                                                                                    context,
                                                                                    MaterialPageRoute(
                                                                                        builder: (context) => PfdPage(
                                                                                          filepath: Apo2021list
                                                                                              .Apodata![index].url,
                                                                                        ))),
                                                                                child: TableCell(
                                                                                    child: Icon(
                                                                                      Icons.picture_as_pdf,
                                                                                      color: Colors.red,
                                                                                    ))),
                                                                          )
                                                                        ],
                                                                      )
                                                                    ],
                                                                  );
                                                                })),
                                                      ],
                                                    )                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        title: Container(
                          child: Column(
                            children: [
                              Card(
                                elevation: 2,
                              //  color: Colors.grey.shade100,
                                child: ExpansionTile(
                                  tilePadding: EdgeInsets.only(left: 10, right: 10),
                                  title: Text(
                                    "2020",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  children: <Widget>[
                                    Container(
                                      height: MediaQuery.of(context).size.height / 3,
                                      child: Scrollbar(
                                        isAlwaysShown: true,
                                        thickness: 10,
                                        showTrackOnHover: true,
                                        child: ListView.builder(
                                            physics: BouncingScrollPhysics(),
                                            itemCount: Apo2021List.length,
                                            itemBuilder: (BuildContext context, int index) {
                                              Apo2021Model Apo2021list = Apo2021List[index];
                                              return Card(
                                                elevation: 2,
                                                child: ExpansionTile(
                                                  title: Text(Apo2021list.name.toString()),
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 5,right: 15),
                                                          child: Table(
                                                            border: TableBorder.all(width: 1, color: Colors.black45),
                                                            //table border
                                                            children: [
                                                              TableRow(children: [
                                                                Padding(
                                                                  padding: const EdgeInsets.only(
                                                                      left: 15, top: 10, right: 5),
                                                                  child: TableCell(child: Text("	File No")),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(top: 10,left: 10),
                                                                  child: TableCell(child: Text("APO Date")),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(
                                                                      top: 10, left: 15, bottom: 5),
                                                                  child:
                                                                  TableCell(child: Text("	View Apo Letter")),
                                                                ),
                                                              ]),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          //  color:Colors.amber,
                                                            height:MediaQuery.of(context).size.height/3.5,
                                                            margin: const EdgeInsets.only(right: 15, left: 5, bottom: 5),
                                                            child: ListView.builder(
                                                                physics: BouncingScrollPhysics(),
                                                                itemCount: Apo2021List[index].Apodata?.length,
                                                                itemBuilder: (BuildContext context, int index) {
                                                                  return Table(
                                                                    border: TableBorder.all(
                                                                        width: 1, color: Colors.black45),
                                                                    //table border

                                                                    children: [
                                                                      TableRow(
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsets.only(
                                                                                left: 5, top: 15, bottom: 10),
                                                                            child: TableCell(
                                                                                child: Text(Apo2021list
                                                                                    .Apodata![index].FileNo
                                                                                    .toString())),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsets.only(
                                                                                left: 5, top: 15, bottom: 10),
                                                                            child: TableCell(
                                                                                child: Text(Apo2021list
                                                                                    .Apodata![index].apoDate
                                                                                    .toString())),
                                                                          ),
                                                                          Padding(
                                                                            padding: const EdgeInsets.only(
                                                                                top: 15, bottom: 10),
                                                                            child: GestureDetector(
                                                                                onTap: () => Navigator.push(
                                                                                    context,
                                                                                    MaterialPageRoute(
                                                                                        builder: (context) => PfdPage(
                                                                                          filepath: Apo2021list
                                                                                              .Apodata![index].url,
                                                                                        ))),
                                                                                child: TableCell(
                                                                                    child: Icon(
                                                                                      Icons.picture_as_pdf,
                                                                                      color: Colors.red,
                                                                                    ))),
                                                                          )
                                                                        ],
                                                                      )
                                                                    ],
                                                                  );
                                                                })),
                                                      ],
                                                    )                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: enableContainer = true,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 6,
                  ),
                )
              ],
            ),
          ),
        )):NoNetworkWidget();
  }
}
