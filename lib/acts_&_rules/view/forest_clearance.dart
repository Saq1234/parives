import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parivesh/acts_&_rules/view/pdf_page.dart';
import '../model/forest_clearance/2_0_0_0_model.dart';
import '../model/forest_clearance/2_0_0_4_model.dart';
import '../model/forest_clearance/2_0_0_5_model.dart';
import '../model/forest_clearance/2_0_0_6_model.dart';
import '../model/forest_clearance/2_0_0_7_model.dart';
import '../model/forest_clearance/2_0_0_8_model.dart';
import '../model/forest_clearance/2_0_0_9_model.dart';
import '../model/forest_clearance/2_0_1_0_model.dart';
import '../model/forest_clearance/2_0_1_1_model.dart';
import '../model/forest_clearance/2_0_1_2_model.dart';
import '../model/forest_clearance/2_0_1_3_model.dart';
import '../model/forest_clearance/2_0_1_4_model.dart';
import '../model/forest_clearance/2_0_1_5_model.dart';
import '../model/forest_clearance/2_0_1_6_model.dart';
import '../model/forest_clearance/2_0_1_7_model.dart';
import '../model/forest_clearance/2_0_1_8_model.dart';
import '../model/forest_clearance/2_0_1_9_model.dart';
import '../model/forest_clearance/acts_model.dart';
import '../model/forest_clearance/compheresive_guideline_model.dart';
import '../model/forest_clearance/rules_model.dart';
import '../model/forest_clearance/2_0_2_3_model.dart';
import '../model/forest_clearance/2_0_2_1_model.dart';
import '../model/forest_clearance/2_0_2_0_model.dart';
import '../model/forest_clearance/2_0_2_2_model.dart';

class ForestClearance extends StatefulWidget {
  const ForestClearance({Key? key}) : super(key: key);

  @override
  State<ForestClearance> createState() => _ForestClearanceState();
}

class _ForestClearanceState extends State<ForestClearance> {
  bool enableContainer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Container(
              width: MediaQuery.of(context).size.width / 1.1,
              child: Text(
                "Forest CLEARANCE (Acts, Rules & Guidelines)",
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
                      "ACTS",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
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
                              itemCount: ActsList.length,
                              itemBuilder: (BuildContext context, int index) {
                                ActsModel Actslist = ActsList[index];
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
                      "RULES",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      enableContainer = true;
                    });
                  },
                  child: Card(
                    elevation: 2,
                    color: Colors.grey.shade100,
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.only(left: 10, right: 10),
                      title: Text(
                        "GUIDELINED",
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
                                              itemCount: TwoThreeList.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                Model2023 TwoThreelist = TwoThreeList[index];
                                                return
                                                  Column(
                                                    children: [
                                                      Divider(color: Colors.black,),
                                                      GestureDetector(
                                                      onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => PfdPage(
                                                                    filepath: TwoThreelist.url,
                                                                  ))),
                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons.picture_as_pdf,
                                                          color: Colors.red,
                                                        ),
                                                        title: Text(
                                                          TwoThreelist.name.toString(),
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
                                              itemCount: TwoZeroTwoList.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                Model2022 TwoZeroTwolist = TwoZeroTwoList[index];
                                                return Column(
                                                  children: [
                                                    Divider(color: Colors.black,),

                                                    GestureDetector(
                                                      onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => PfdPage(
                                                                    filepath: TwoZeroTwolist.url,
                                                                  ))),
                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons.picture_as_pdf,
                                                          color: Colors.red,
                                                        ),
                                                        title: Text(
                                                          TwoZeroTwolist.name.toString(),
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
                                              itemCount: TwoZTwoOneList.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                Model2021 TwoZTwoOnelist = TwoZTwoOneList[index];
                                                return Column(
                                                  children: [
                                                    Divider(color: Colors.black,),

                                                    GestureDetector(
                                                      onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => PfdPage(
                                                                    filepath: TwoZTwoOnelist.url,
                                                                  ))),
                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons.picture_as_pdf,
                                                          color: Colors.red,
                                                        ),
                                                        title: Text(
                                                          TwoZTwoOnelist.name.toString(),
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
                                        height: MediaQuery.of(context).size.height / 3,
                                        child: Scrollbar(
                                          isAlwaysShown: true,
                                          thickness: 10,
                                          showTrackOnHover: true,
                                          child: ListView.builder(
                                              physics: BouncingScrollPhysics(),
                                              itemCount: TwoZeroTwoZeroList.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                Model2020 TwoZeroTwoZerolist = TwoZeroTwoZeroList[index];
                                                return Column(
                                                  children: [                                                      Divider(color: Colors.black,),

                                                    GestureDetector(
                                                      onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => PfdPage(
                                                                    filepath: TwoZeroTwoZerolist.url,
                                                                  ))),
                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons.picture_as_pdf,
                                                          color: Colors.red,
                                                        ),
                                                        title: Text(
                                                          TwoZeroTwoZerolist.name.toString(),
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
                                        height: MediaQuery.of(context).size.height / 3,
                                        child: Scrollbar(
                                          isAlwaysShown: true,
                                          thickness: 10,
                                          showTrackOnHover: true,
                                          child: ListView.builder(
                                              physics: BouncingScrollPhysics(),
                                              itemCount: Model2019List.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                Model2019 Model2019list = Model2019List[index];
                                                return Column(
                                                  children: [
                                                    Divider(color: Colors.black,),

                                                    GestureDetector(
                                                      onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => PfdPage(
                                                                    filepath: Model2019list.url,
                                                                  ))),
                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons.picture_as_pdf,
                                                          color: Colors.red,
                                                        ),
                                                        title: Text(
                                                          Model2019list.name.toString(),
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
                               //   color: Colors.grey.shade100,
                                  child: ExpansionTile(
                                    tilePadding: EdgeInsets.only(left: 10, right: 10),
                                    title: Text(
                                      "2018",
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
                                              itemCount: Model2018List.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                Model2018 Model2018list = Model2018List[index];
                                                return Column(
                                                  children: [
                                                    Divider(color: Colors.black,),

                                                    GestureDetector(
                                                      onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => PfdPage(
                                                                    filepath: Model2018list.url,
                                                                  ))),
                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons.picture_as_pdf,
                                                          color: Colors.red,
                                                        ),
                                                        title: Text(
                                                          Model2018list.name.toString(),
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
                                      "2017",
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
                                              itemCount: Model2017List.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                Model2017 Model2017list = Model2017List[index];
                                                return Column(
                                                  children: [
                                                    Divider(color: Colors.black,),

                                                    GestureDetector(
                                                      onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => PfdPage(
                                                                    filepath: Model2017list.url,
                                                                  ))),
                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons.picture_as_pdf,
                                                          color: Colors.red,
                                                        ),
                                                        title: Text(
                                                          Model2017list.name.toString(),
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
                                      "2016",
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
                                              itemCount: Model2016List.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                Model2016 Model2016list = Model2016List[index];
                                                return Column(
                                                  children: [
                                                    Divider(color: Colors.black,),

                                                    GestureDetector(
                                                      onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => PfdPage(
                                                                    filepath: Model2016list.url,
                                                                  ))),
                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons.picture_as_pdf,
                                                          color: Colors.red,
                                                        ),
                                                        title: Text(
                                                          Model2016list.name.toString(),
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
                                      "2015",
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
                                              itemCount: Model2015List.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                Model2015 Model2015list = Model2015List[index];
                                                return Column(
                                                  children: [
                                                    Divider(color: Colors.black,),

                                                    GestureDetector(
                                                      onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => PfdPage(
                                                                    filepath: Model2015list.url,
                                                                  ))),
                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons.picture_as_pdf,
                                                          color: Colors.red,
                                                        ),
                                                        title: Text(
                                                          Model2015list.name.toString(),
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
                                      "2014",
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
                                              itemCount: Model2014List.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                Model2014 Model2014list = Model2014List[index];
                                                return Column(
                                                  children: [
                                                    Divider(color: Colors.black,),

                                                    GestureDetector(
                                                      onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => PfdPage(
                                                                    filepath: Model2014list.url,
                                                                  ))),
                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons.picture_as_pdf,
                                                          color: Colors.red,
                                                        ),
                                                        title: Text(
                                                          Model2014list.name.toString(),
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
                                      "2013",
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
                                              itemCount: Model2013List.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                Model2013 Model2013list = Model2013List[index];
                                                return Column(
                                                  children: [
                                                    Divider(color: Colors.black,),

                                                    GestureDetector(
                                                      onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => PfdPage(
                                                                    filepath: Model2013list.url,
                                                                  ))),
                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons.picture_as_pdf,
                                                          color: Colors.red,
                                                        ),
                                                        title: Text(
                                                          Model2013list.name.toString(),
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
                                      "2012",
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
                                              itemCount: Model2012List.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                Model2012 Model2012list = Model2012List[index];
                                                return Column(
                                                  children: [
                                                    Divider(color: Colors.black,),

                                                    GestureDetector(
                                                      onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => PfdPage(
                                                                    filepath: Model2012list.url,
                                                                  ))),
                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons.picture_as_pdf,
                                                          color: Colors.red,
                                                        ),
                                                        title: Text(
                                                          Model2012list.name.toString(),
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
                                      "2011",
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
                                              itemCount: Model2011List.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                Model2011 Model2011list = Model2011List[index];
                                                return Column(
                                                  children: [
                                                    Divider(color: Colors.black,),

                                                    GestureDetector(
                                                      onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => PfdPage(
                                                                    filepath: Model2011list.url,
                                                                  ))),
                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons.picture_as_pdf,
                                                          color: Colors.red,
                                                        ),
                                                        title: Text(
                                                          Model2011list.name.toString(),
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
                               //   color: Colors.grey.shade100,
                                  child: ExpansionTile(
                                    tilePadding: EdgeInsets.only(left: 10, right: 10),
                                    title: Text(
                                      "2010",
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
                                              itemCount: Model2010List.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                Model2010 Model2010list = Model2010List[index];
                                                return Column(
                                                  children: [
                                                    Divider(color: Colors.black,),

                                                    GestureDetector(
                                                      onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => PfdPage(
                                                                    filepath: Model2010list.url,
                                                                  ))),
                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons.picture_as_pdf,
                                                          color: Colors.red,
                                                        ),
                                                        title: Text(
                                                          Model2010list.name.toString(),
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
                               //   color: Colors.grey.shade100,
                                  child: ExpansionTile(
                                    tilePadding: EdgeInsets.only(left: 10, right: 10),
                                    title: Text(
                                      "2009",
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
                                              itemCount: Model2009List.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                Model2009 Model2009list = Model2009List[index];
                                                return Column(
                                                  children: [
                                                    Divider(color: Colors.black,),

                                                    GestureDetector(
                                                      onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => PfdPage(
                                                                    filepath: Model2009list.url,
                                                                  ))),
                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons.picture_as_pdf,
                                                          color: Colors.red,
                                                        ),
                                                        title: Text(
                                                          Model2009list.name.toString(),
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
                                      "2008",
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
                                              itemCount: Model2008List.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                Model2008 Model2008list = Model2008List[index];
                                                return Column(
                                                  children: [
                                                    Divider(color: Colors.black,),

                                                    GestureDetector(
                                                      onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => PfdPage(
                                                                    filepath: Model2008list.url,
                                                                  ))),
                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons.picture_as_pdf,
                                                          color: Colors.red,
                                                        ),
                                                        title: Text(
                                                          Model2008list.name.toString(),
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
                                      "2007",
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
                                              itemCount: Model2007List.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                Model2007 Model2007list = Model2007List[index];
                                                return Column(
                                                  children: [
                                                    Divider(color: Colors.black,),

                                                    GestureDetector(
                                                      onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => PfdPage(
                                                                    filepath: Model2007list.url,
                                                                  ))),
                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons.picture_as_pdf,
                                                          color: Colors.red,
                                                        ),
                                                        title: Text(
                                                          Model2007list.name.toString(),
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
                                      "2006",
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
                                              itemCount: Model2006List.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                Model2006 Model2006list = Model2006List[index];
                                                return Column(
                                                  children: [
                                                    Divider(color: Colors.black,),

                                                    GestureDetector(
                                                      onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => PfdPage(
                                                                    filepath: Model2006list.url,
                                                                  ))),
                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons.picture_as_pdf,
                                                          color: Colors.red,
                                                        ),
                                                        title: Text(
                                                          Model2006list.name.toString(),
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
                                      "2005",
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
                                              itemCount: Model2005List.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                Model2005 Model2005list = Model2005List[index];
                                                return Column(
                                                  children: [
                                                    Divider(color: Colors.black,),

                                                    GestureDetector(
                                                      onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => PfdPage(
                                                                    filepath: Model2005list.url,
                                                                  ))),
                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons.picture_as_pdf,
                                                          color: Colors.red,
                                                        ),
                                                        title: Text(
                                                          Model2005list.name.toString(),
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
                                      "2004",
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
                                              itemCount: Model2004List.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                Model2004 Model2004list = Model2004List[index];
                                                return Column(
                                                  children: [
                                                    Divider(color: Colors.black,),

                                                    GestureDetector(
                                                      onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => PfdPage(
                                                                    filepath: Model2004list.url,
                                                                  ))),
                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons.picture_as_pdf,
                                                          color: Colors.red,
                                                        ),
                                                        title: Text(
                                                          Model2004list.name.toString(),
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
                                      "2000",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    children: <Widget>[
                                      Container(
                                        height:
                                            Model2000List.length >= 2 ? MediaQuery.of(context).size.height / 3 : 100,
                                        child: Scrollbar(
                                          isAlwaysShown: true,
                                          thickness: 10,
                                          showTrackOnHover: true,
                                          child: ListView.builder(
                                              physics: BouncingScrollPhysics(),
                                              itemCount: Model2000List.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                Model2000 Model2000list = Model2000List[index];
                                                return Column(
                                                  children: [
                                                    Divider(color: Colors.black,),

                                                    GestureDetector(
                                                      onTap: () => Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => PfdPage(
                                                                    filepath: Model2000list.url,
                                                                  ))),
                                                      child: ListTile(
                                                        leading: Icon(
                                                          Icons.picture_as_pdf,
                                                          color: Colors.red,
                                                        ),
                                                        title: Text(
                                                          Model2000list.name.toString(),
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
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 2,
                  color: Colors.grey.shade100,
                  child: ExpansionTile(
                    title: Text(
                      "COMPREHENSIVE GUIDELINE",
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
                              itemCount: CompherensiveList.length,
                              itemBuilder: (BuildContext context, int index) {
                                CompherensiveModel Compherensivelist = CompherensiveList[index];
                                return Column(
                                  children: [
                                    Divider(color: Colors.black,),

                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => PfdPage(
                                                    filepath: Compherensivelist.url,
                                                  ))),
                                      child: ListTile(
                                        leading: Icon(
                                          Icons.picture_as_pdf,
                                          color: Colors.red,
                                        ),
                                        title: Text(
                                          Compherensivelist.name.toString(),
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
        ));
  }
}
