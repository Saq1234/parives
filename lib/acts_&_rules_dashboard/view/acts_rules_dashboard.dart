import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ActsRulesDashBoard extends StatefulWidget {
  const ActsRulesDashBoard({Key? key}) : super(key: key);

  @override
  State<ActsRulesDashBoard> createState() => _ActsRulesDashBoardState();
}

class _ActsRulesDashBoardState extends State<ActsRulesDashBoard> {
  String? ec;

  String? fc;

  bool wild = false;
  bool crz = false;
  bool campa = false;
  bool select = false;

  _launchUrl_ec() async {
    const url = 'http://164.100.213.215/ECDashboard/ECDashboard?statename=ALL';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchUrl_fc() async {
    const url = 'http://164.100.213.215/postgracepublish/FCDashboardreport2?statename=ALL';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchUrl_wild() async {
    const url = 'http://164.100.213.215/ECDashboard/Wildlife_Status';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchUrl_crz() async {
    const url = 'http://164.100.213.215/ECDashboard/CRZ_Status';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchUrl_campa() async {
    const url = 'http://164.100.213.215/ECDashboard/Pending_Payment';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchUrl_compliance() async {
    const url = 'http://164.100.213.215/ECDashboard/Compliance';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  int? selectedRadioTile;

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
      onWillPop: () async {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // leading: BackButton(
          //   onPressed: ()=> SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
          //   ,
          // ),
          title: Text("Proposals status Dashboard"),
          titleSpacing: 2.0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(border: Border.all(color: Colors.green)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          listTileTheme: ListTileThemeData(
                            horizontalTitleGap: 4, //here adjust based on your need
                          ),
                        ),
                        child: RadioListTile(
                          activeColor: Colors.blue,
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: Text(
                            'EC Dashboard for Proposals submitted after 1st March, 2023',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          value: 1,
                          groupValue: selectedRadioTile,
                          onChanged: (val) {
                            setState(() {
                              setSelectedRadioTile(val!);
                              SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

                              _launchUrl_ec();
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          listTileTheme: ListTileThemeData(
                            horizontalTitleGap: 4, //here adjust based on your need
                          ),
                        ),
                        child: RadioListTile(
                          activeColor: Colors.blue,
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: Text(
                            'FC Dashboard for Proposals submitted after 5th September, 2022',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          value: 2,
                          groupValue: selectedRadioTile,
                          onChanged: (val) {
                            setState(() {
                              setSelectedRadioTile(val!);
                              SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

                              _launchUrl_fc();
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          listTileTheme: ListTileThemeData(
                            horizontalTitleGap: 4, //here adjust based on your need
                          ),
                        ),
                        child: RadioListTile(
                          activeColor: Colors.blue,
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: Text(
                            'Wildlife Dashboard for Proposals submitted after 28th March, 2023',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          value: 3,
                          groupValue: selectedRadioTile,
                          onChanged: (val) {
                            setState(() {
                              setSelectedRadioTile(val!);
                              SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

                              _launchUrl_wild();
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          listTileTheme: ListTileThemeData(
                            horizontalTitleGap: 4, //here adjust based on your need
                          ),
                        ),
                        child: RadioListTile(
                          activeColor: Colors.blue,
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: Text(
                            'CRZ Dashboard for Proposals submitted after 31st March, 2023',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          value: 4,
                          groupValue: selectedRadioTile,
                          onChanged: (val) {
                            setState(() {
                              setSelectedRadioTile(val!);
                              SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

                              _launchUrl_crz();
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          listTileTheme: ListTileThemeData(
                            horizontalTitleGap: 4, //here adjust based on your need
                          ),
                        ),
                        child: RadioListTile(
                          activeColor: Colors.blue,
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: Text(
                            'Campa Payment Verification Pending status after 23rd March, 2023',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          value: 5,
                          groupValue: selectedRadioTile,
                          onChanged: (val) {
                            setState(() {
                              setSelectedRadioTile(val!);
                              SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

                              _launchUrl_campa();
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          listTileTheme: ListTileThemeData(
                            horizontalTitleGap: 4, //here adjust based on your need
                          ),
                        ),
                        child: RadioListTile(
                          activeColor: Colors.blue,
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: Text(
                            'Compliance Dashboard for Compliance submitted after 1st July, 2023',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          value: 6,
                          groupValue: selectedRadioTile,
                          onChanged: (val) {
                            setState(() {
                              setSelectedRadioTile(val!);
                              SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

                              _launchUrl_compliance();
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          listTileTheme: ListTileThemeData(
                            horizontalTitleGap: 4, //here adjust based on your need
                          ),
                        ),
                        child: RadioListTile(
                          activeColor: Colors.blue,
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: Text(
                            'CAMPA Management Dashboard',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          value: 7,
                          groupValue: selectedRadioTile,
                          onChanged: (val) {
                            setState(() {
                              setSelectedRadioTile(val!);
                              SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
