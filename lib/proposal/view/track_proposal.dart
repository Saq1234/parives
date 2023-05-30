import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parivesh/proposal/view/advance_search_porposal.dart';
import 'package:parivesh/proposal/view/track_proposal_dashboard.dart';
import 'package:provider/provider.dart';

import '../viewmodel/trackporposal_viewmodel.dart';

class TrackPorposal extends StatefulWidget {
  const TrackPorposal({Key? key}) : super(key: key);

  @override
  State<TrackPorposal> createState() => _TrackPorposalState();
}

class _TrackPorposalState extends State<TrackPorposal> {
  TextEditingController porposalController = TextEditingController();

  late ProposalViewModel porposalViewModel;

  @override
  void initState() {
    super.initState();
    porposalViewModel = Provider.of<ProposalViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('') ,
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.fitWidth
                )
            ),
          ),

        ),

        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child:
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Container(
                    height: MediaQuery.of(context).size.height/4,),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,),
                    child: Center(
                      child: Text(
                        "Track Your Proposal",
                        style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15,top: 50),
                    child: SingleChildScrollView(
                      child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Enter Proposal Number/Single Window Number:',
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

                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: porposalController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter Proposal Number/Single Window Number',
                            ),
                          ),


                          Container(
                            height: MediaQuery.of(context).size.height/10,),
                          GestureDetector(
                            onTap: () async{
                              if (porposalController.text.isNotEmpty) {

                                await  porposalViewModel.getPorposalDetails(porposalNo: porposalController.text);

                                Navigator.push(context, MaterialPageRoute(builder: (context) => const TrackPorposalDash()));
                                FocusManager.instance.primaryFocus?.unfocus();
                                porposalController.clear();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text("Please fill Porposal Number"),
                                ));
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.green),
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const AdvanceSearchPorposal()));
                              porposalController.clear();

                            },
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.orange),
                              width: double.infinity,
                              child: Center(
                                  child: Text(
                                    "Show Advance Search",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),


                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
