import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';


class ActsRulesDashBoard extends StatefulWidget {
  const ActsRulesDashBoard({Key? key}) : super(key: key);

  @override
  State<ActsRulesDashBoard> createState() => _ActsRulesDashBoardState();
}

class _ActsRulesDashBoardState extends State<ActsRulesDashBoard> {
  bool ec = false;
  bool fc = false;
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
  } _launchUrl_fc() async {
    const url = 'http://164.100.213.215/postgracepublish/FCDashboardreport2?statename=ALL';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  } _launchUrl_wild() async {
    const url = 'http://164.100.213.215/ECDashboard/Wildlife_Status';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  } _launchUrl_crz() async {
    const url = 'http://164.100.213.215/ECDashboard/CRZ_Status';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  } _launchUrl_campa() async {
    const url = 'http://164.100.213.215/ECDashboard/Pending_Payment';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: BackButton(),
          ),
          body: Column(children: [
            actsrules()
          ],),

    ));
  }
  Widget actsrules() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        ec = true;
                        fc = false;
                        wild = false;
                        crz = false;
                        campa = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffC4C8DB),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/1.3,
                            child: Text(
                              "EC Dashboard for Proposals submitted after 1st March, 2023",
                              style: TextStyle(fontSize: 16),

                            ),
                          ),
                          Spacer(),
                          ec == true
                              ? Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                              : SizedBox.shrink()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        ec = false;
                        fc = true;
                        wild = false;
                        crz = false;
                        campa = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffC4C8DB),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/1.3,
                            child: Text(
                              "FC Dashboard for Proposals submitted after 5th September, 2022",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Spacer(),
                          fc == true
                              ? Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                              : SizedBox.shrink()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        ec = false;
                        fc = false;
                        wild = true;
                        crz = false;
                        campa = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffC4C8DB),
                      ),
                      child: Row(
                        children: [
                          Container(width: MediaQuery.of(context).size.width/1.3,
                            child: Text(
                              "Wildlife Dashboard for Proposals submitted after 28th March, 2023",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Spacer(),
                          wild == true
                              ? Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                              : SizedBox.shrink()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        ec = false;
                        fc = false;
                        wild = false;
                        crz = true;
                        campa = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffC4C8DB),
                      ),
                      child: Row(
                        children: [
                          Container(width: MediaQuery.of(context).size.width/1.3,
                            child: Text(
                              "CRZ Dashboard for Proposals submitted after 31st March, 2023",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Spacer(),
                          crz == true
                              ? Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                              : SizedBox.shrink()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        ec = false;
                        fc = false;
                        wild = false;
                        crz = false;
                        campa = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffC4C8DB),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/1.3,
                            child: Text(
                              "Campa Payment Verification Pending status after 23rd March, 2023",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Spacer(),
                          campa == true
                              ? Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                              : SizedBox.shrink()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () async {
              if (ec == true) {
                _launchUrl_ec();

              }
              else if (fc == true) {
                setState(() {
                  ec=false;
                  _launchUrl_fc();
                });

              } else if (wild == true) {
                setState(() {
                  ec=false;
                  fc=false;
                  _launchUrl_wild();
                });
              } else if (crz == true) {
                setState(() {
                  ec=false;
                  fc=false;
                  wild=false;
                  _launchUrl_crz();
                });
              } else if (campa == true) {
                setState(() {
                  ec=false;
                  fc=false;
                  wild=false;
                  campa=false;
                  _launchUrl_campa();
                });
              } else {
                const snackBar = SnackBar(
                  content: Text('Please select Acts & Rules !'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: Container(
              padding: EdgeInsets.all(10),
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xff96D2CF),
              ),
              child: Center(
                  child: Text(
                    "Select",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
            ),
          )
        ],
      ),
    );
  }

}
