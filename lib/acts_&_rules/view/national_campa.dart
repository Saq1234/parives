import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parivesh/acts_&_rules/view/pdf_page.dart';

import '../model/national_campa/acts_model.dart';
import '../model/national_campa/guideline_model.dart';
import '../model/national_campa/rules_model.dart';
import '../model/national_campa/sanction/sanction2022_model.dart';
import '../model/national_campa/sanction/sanction2023_model.dart';

class NationalCampa extends StatefulWidget {
  const NationalCampa({Key? key}) : super(key: key);

  @override
  State<NationalCampa> createState() => _NationalCampaState();
}

class _NationalCampaState extends State<NationalCampa> {
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
                        height: ActsLiist.length >= 2 ? MediaQuery.of(context).size.height / 3 : 100,
                        child: Scrollbar(
                          isAlwaysShown: true,
                          thickness: 10,
                          showTrackOnHover: true,
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: ActsLiist.length,
                              itemBuilder: (BuildContext context, int index) {
                                ActsModel Actslist = ActsLiist[index];
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
                Card(
                  elevation: 2,
                  color: Colors.grey.shade100,
                  child: ExpansionTile(
                    title: Text(
                      "GUIDELINE",
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
                              itemCount: GuidelineList.length,
                              itemBuilder: (BuildContext context, int index) {
                                GuidelineModel GuidelinelList = GuidelineList[index];
                                return GestureDetector(
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
                                );
                              }),
                        ),
                      )
                    ],
                  ),
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
                        "SANCTIONS",
                        style: TextStyle(fontSize: 16),
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Container(
                            child: Column(
                              children: [
                                Card(
                                  elevation: 2,
                                  color: Colors.grey.shade100,
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
                                              itemCount: Snac2023List.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                Snac2023Model Snac2023list = Snac2023List[index];
                                                return Card(
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
                        ),
                        ListTile(
                          title: Container(
                            child: Column(
                              children: [
                                Card(
                                  elevation: 2,
                                  color: Colors.grey.shade100,
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

                                                                       // physics: BouncingScrollPhysics(),
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
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
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
