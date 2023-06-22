import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parivesh/acts_&_rules/view/acts_&_rules.dart';
import 'package:parivesh/login/view/login.dart';
import 'package:parivesh/proposal/view/track_proposal.dart';
import '../../common/app_routes.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       // backgroundColor: Color(0xffE8F8F5),
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
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Login())),
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Color(0xffFCF3CF),
                          border: Border.all(color: Colors.black)),
                      child: Center(
                          child: Text(
                        "Login",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TrackPorposal())),
                  child: Card(
                   // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: Colors.white,
                    elevation: 10,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 4.5,
                      decoration: BoxDecoration(border: Border.all(color: Colors.black),color: Color(0xffD6EAF8 )),
                      child: Center(
                          child: Text(
                        "Track Your Proposal",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ActsAndRules())),
                  child: Card(
                    color: Colors.white,
                   // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    elevation: 10,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 4.5,
                      decoration: BoxDecoration(border: Border.all(color: Colors.black),color: Color(0xffE9F7EF)),
                      child: Center(
                          child: Text(
                        "Act & Rules",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, AppRoutes.usermanuals),

                    child: Card(
                   // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: Colors.white,
                    elevation: 10,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 4.5,
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.only(bottomRight: Radius.circular(200))   ,                   color: Color(0XffD2CFC8),
                          border: Border.all(color: Colors.black),color: Color(0xffEAECEE)),
                      child: Center(
                          child: Text(
                        "User Manuals",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
