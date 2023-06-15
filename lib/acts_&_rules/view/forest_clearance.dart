import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parivesh/acts_&_rules/view/pdf_page.dart';

import '../model/forest_clearance/acts_model.dart';
import '../model/forest_clearance/compheresive_guideline_model.dart';
import '../model/forest_clearance/rules_model.dart';
import '../model/forest_clearance/two_three_model.dart';

class ForestClearance extends StatefulWidget {
  const ForestClearance({Key? key}) : super(key: key);

  @override
  State<ForestClearance> createState() => _ForestClearanceState();
}

class _ForestClearanceState extends State<ForestClearance> {
  bool enableContainer=false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar:   AppBar(title: Container(
          width: MediaQuery.of(context).size.width/1.1,
          child: Text("Forest CLEARANCE (Acts, Rules & Guidelines)",maxLines: 2,)),
        titleSpacing: 2.0,

      ),
        body:SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 15,top: 15,right: 15),
            child: Column(
              children: [
                Card(
                  elevation: 2,
                  color: Colors.grey.shade100,
                  child:
                  ExpansionTile(
                    tilePadding: EdgeInsets.only(left: 10,right: 10),

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
                                return GestureDetector(
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
                  child:
                  ExpansionTile(
                    tilePadding: EdgeInsets.only(left: 10,right: 10),

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
                                return GestureDetector(
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
                  onTap: (){
                    setState(() {
                      enableContainer=true;
                    });
                  },
                  child: Card(
                    elevation: 2,
                    color: Colors.grey.shade100,
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.only(left: 10,right: 10),

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
                                  elevation:2,
                                  color: Colors.grey.shade100,
                                  child: ExpansionTile(
                                    tilePadding: EdgeInsets.only(left: 10,right: 10),

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
                                                TwoThreeModel TwoThreelist = TwoThreeList[index];
                                                return GestureDetector(
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
                        )
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
                                return GestureDetector(
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
                  visible: enableContainer=true,
                  child: Container(
                    height: MediaQuery.of(context).size.height/6,
                  ),
                )
              ],
            ),
          ),
        )

    );
  }
}
