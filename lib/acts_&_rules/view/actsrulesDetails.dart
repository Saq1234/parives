import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parivesh/acts_&_rules/view/pdf_page.dart';

import '../../common/no_network.dart';
import '../model/enviorment_clearance/coastalRegulationZone.dart';
import '../model/enviorment_clearance/delegationPowerModel.dart';
import '../model/enviorment_clearance/echoMarkSchemeModel.dart';
import '../model/enviorment_clearance/echo_sensitive_zone_model.dart';
import '../model/enviorment_clearance/enviormental_impact_model.dart';
import '../model/enviorment_clearance/environmental_labs_model.dart';
import '../model/enviorment_clearance/environmental_standards_model.dart';
import '../model/enviorment_clearance/envoirment_clearance_model.dart';
import '../model/enviorment_clearance/hazardous_substances_management_model.dart';
import '../model/enviorment_clearance/loss_of_ecology_model.dart';
import '../model/enviorment_clearance/noise_pollution_model.dart';
import '../model/enviorment_clearance/ozone_layer_depletion_model.dart';
import '../model/enviorment_clearance/regional_empowored_model.dart';
import '../model/enviorment_clearance/t_oil_model.dart';
import '../model/enviorment_clearance/wWater_pollution_model.dart';

class ActsrulesDetails extends StatefulWidget {
  const ActsrulesDetails({Key? key}) : super(key: key);

  @override
  State<ActsrulesDetails> createState() => _ActsrulesDetailsState();
}

class _ActsrulesDetailsState extends State<ActsrulesDetails> {
  bool enableContainer=false;
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
    return  _connectionStatus == true?
      Scaffold(
        backgroundColor: Colors.white,

        appBar:
      AppBar(title: Container(
        width: MediaQuery.of(context).size.width/1.1,
          child: Text("Enviorment Clearance",maxLines: 2,)),
        titleSpacing: 2.0,

      ),
      body:SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 15,left: 15,right: 15),
              // decoration: BoxDecoration(border: Border.all(color: Colors.black),
              // ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Card(
                      elevation: 2,
                      color:Colors.grey.shade100,
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.only(left: 10,right: 10),
                        title: Text(
                          "Acts",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        children: <Widget>[
                          Divider(color: Colors.black,),

                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PfdPage(
                                      filepath: "https://parivesh.nic.in/writereaddata/ENV/eprotect_act_1986.pdf",
                                    ))),
                            child: ListTile(
                              leading: Icon(
                                Icons.picture_as_pdf_outlined,
                                color: Colors.red,
                              ),
                              title: Text(
                                "No.29 of 1986, [23/5/1986] - The Environment (Protection) Act, 1986, amended 1991",
                                style: TextStyle(),
                              ),
                              minLeadingWidth: 2,
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
                          "Rules",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        children: <Widget>[
                          Divider(color: Colors.black,),

                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PfdPage(
                                      filepath: "https://parivesh.nic.in/writereaddata/ENV/THE%20ENVIRONMENT.pdf",
                                    ))),
                            child: ListTile(
                              leading: Icon(
                                Icons.picture_as_pdf_outlined,
                                color: Colors.red,
                              ),
                              title: Text(
                                "S.O.844(E), [19/11/1986] - The Environment (Protection) Rules, 1986",
                                style: TextStyle(),
                              ),
                              minLeadingWidth: 2,
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
                            "Power Conferred By The Environment Protection Act",
                            style: TextStyle(fontSize: 16),
                          ),
                          children: <Widget>[
                            ListTile(
                              title: Container(
                                child: Column(
                                  children: [
                                    Card(
                                      elevation:2,
                                      //color: Colors.grey.shade100,
                                      child:
                                      ExpansionTile(
                                        tilePadding: EdgeInsets.only(left: 10,right: 10),

                                        title: Text(
                                          "Amendments to Principal Rules",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        children: <Widget>[

                                          Column(
                                            children: [
                                              Divider(color: Colors.black,),
                                              GestureDetector(
                                                onTap: () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => PfdPage(
                                                          filepath: "writereaddata/ENV/gsr-02e.pdf",
                                                        ))),
                                                child: ListTile(
                                                  leading: Icon(
                                                    Icons.picture_as_pdf,
                                                    color: Colors.red,
                                                  ),
                                                  title: Text(
                                                    "G.S.R.02(E), [02/01/2014] - Use of Washed, Blended or Beneficiated Coal in Thermal Power Plant",
                                                    style: TextStyle(),
                                                  ),
                                                  minLeadingWidth: 2,
                                                ),
                                              ),
                                              Divider(color: Colors.black,),

                                              GestureDetector(
                                                onTap: () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => PfdPage(
                                                          filepath: "https://parivesh.nic.in/writereaddata/ENV/gsr513e.pdf",
                                                        ))),
                                                child: ListTile(
                                                  leading: Icon(
                                                    Icons.picture_as_pdf,
                                                    color: Colors.red,
                                                  ),
                                                  title: Text(
                                                    "G.S.R. 513(E), dated 28.06.2012",
                                                    style: TextStyle(),
                                                  ),
                                                  minLeadingWidth: 2,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Card(
                                      elevation: 2,
                                     // color: Colors.grey.shade100,
                                      child: ExpansionTile(
                                        tilePadding: EdgeInsets.only(left: 10,right: 10),

                                        title: Text(
                                          "Coastal Regulation Zone (CRZ)",
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
                                                  itemCount: coastalmodellist.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    CoastalRegulationZoneModel costallist = coastalmodellist[index];
                                                    return Column(
                                                      children: [
                                                        Divider(color: Colors.black,),

                                                        GestureDetector(
                                                          onTap: () => Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => PfdPage(
                                                                    filepath: costallist.url,
                                                                  ))),
                                                          child: ListTile(
                                                            leading: Icon(
                                                              Icons.picture_as_pdf,
                                                              color: Colors.red,
                                                            ),
                                                            title: Text(
                                                              costallist.name.toString(),
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
                                    //  color: Colors.grey.shade100,
                                      child: ExpansionTile(
                                        tilePadding: EdgeInsets.only(left: 10,right: 10),

                                        title: Text(
                                          "Delegation of Powers",
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

                                                  itemCount: delegationlist.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    DelegationPowerModel delegationdata = delegationlist[index];
                                                    return Column(
                                                      children: [
                                                        Divider(color: Colors.black,),

                                                        GestureDetector(
                                                          onTap: () => Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => PfdPage(
                                                                    filepath: delegationdata.url,
                                                                  ))),
                                                          child: ListTile(
                                                            leading: Icon(
                                                              Icons.picture_as_pdf,
                                                              color: Colors.red,
                                                            ),
                                                            title: Text(
                                                              delegationdata.name.toString(),
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
                                     // color: Colors.grey.shade100,
                                      child: ExpansionTile(
                                        tilePadding: EdgeInsets.only(left: 10,right: 10),

                                        title: Text(
                                          "Eco-marks Scheme",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        children: <Widget>[
                                          Container(
                                            height: echomarkList.length > 2 ? MediaQuery.of(context).size.height / 3 : 100,
                                            child: Scrollbar(
                                              isAlwaysShown: true,
                                              thickness: 10,
                                              showTrackOnHover: true,
                                              child: ListView.builder(
                                                  physics: BouncingScrollPhysics(),

                                                  itemCount: echomarkList.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    EchoMarkModel echomarklist = echomarkList[index];
                                                    return Column(
                                                      children: [
                                                        Divider(color: Colors.black,),

                                                        GestureDetector(
                                                          onTap: () => Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => PfdPage(
                                                                    filepath: echomarklist.url,
                                                                  ))),
                                                          child: ListTile(
                                                            leading: Icon(
                                                              Icons.picture_as_pdf,
                                                              color: Colors.red,
                                                            ),
                                                            title: Text(
                                                              echomarklist.name.toString(),
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
                                     // color: Colors.grey.shade100,
                                      child: ExpansionTile(
                                        tilePadding: EdgeInsets.only(left: 10,right: 10),

                                        title: Text(
                                          "Eco-sensitive Zone",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        children: <Widget>[
                                          Container(
                                            height: echosensitiveList.length > 2 ? MediaQuery.of(context).size.height / 3 : 100,
                                            child: Scrollbar(
                                              isAlwaysShown: true,
                                              thickness: 10,
                                              showTrackOnHover: true,
                                              child: ListView.builder(
                                                  physics: BouncingScrollPhysics(),

                                                  itemCount: echosensitiveList.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    EcosensitiveModel echosensitivelist = echosensitiveList[index];
                                                    return Column(
                                                      children: [
                                                        Divider(color: Colors.black,),

                                                        GestureDetector(
                                                          onTap: () => Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => PfdPage(
                                                                    filepath: echosensitivelist.url,
                                                                  ))),
                                                          child: ListTile(
                                                            leading: Icon(
                                                              Icons.picture_as_pdf,
                                                              color: Colors.red,
                                                            ),
                                                            title: Text(
                                                              echosensitivelist.name.toString(),
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
                                    //  color: Colors.grey.shade100,
                                      child: ExpansionTile(
                                        tilePadding: EdgeInsets.only(left: 10,right: 10),

                                        title: Text(
                                          "Environmental Clearance - General",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        children: <Widget>[
                                          Container(
                                            height:  MediaQuery.of(context).size.height / 3 ,
                                            child: Scrollbar(
                                              isAlwaysShown: true,
                                              thickness: 10,
                                              showTrackOnHover: true,
                                              child: ListView.builder(
                                                  physics: BouncingScrollPhysics(),

                                                  itemCount: enviormentclearanceList.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    EnviormentClearanceModel enviormentlist = enviormentclearanceList[index];
                                                    return Column(
                                                      children: [
                                                        Divider(color: Colors.black,),

                                                        GestureDetector(
                                                          onTap: () => Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => PfdPage(
                                                                    filepath: enviormentlist.url,
                                                                  ))),
                                                          child: ListTile(
                                                            leading: Icon(
                                                              Icons.picture_as_pdf,
                                                              color: Colors.red,
                                                            ),
                                                            title: Text(
                                                              enviormentlist.name.toString(),
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
                                     // color: Colors.grey.shade100,
                                      child: ExpansionTile(
                                        tilePadding: EdgeInsets.only(left: 10,right: 10),

                                        title: Text(
                                          "Environmental Impact Assessment Notification - 2006",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        children: <Widget>[
                                          Container(
                                            height: MediaQuery.of(context).size.height / 3 ,
                                            child: Scrollbar(
                                              isAlwaysShown: true,
                                              thickness: 10,
                                              showTrackOnHover: true,
                                              child: ListView.builder(
                                                  physics: BouncingScrollPhysics(),

                                                  itemCount: enviormentalList.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    EnviormentalImpactModel enviormentallist = enviormentalList[index];
                                                    return Column(
                                                      children: [
                                                        Divider(color: Colors.black,),

                                                        GestureDetector(
                                                          onTap: () => Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => PfdPage(
                                                                    filepath: enviormentallist.url,
                                                                  ))),
                                                          child: ListTile(
                                                            leading: Icon(
                                                              Icons.picture_as_pdf,
                                                              color: Colors.red,
                                                            ),
                                                            title: Text(
                                                              enviormentallist.name.toString(),
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
                                     // color: Colors.grey.shade100,
                                      child: ExpansionTile(
                                        tilePadding: EdgeInsets.only(left: 10,right: 10),

                                        title: Text(
                                          "Environmental Labs",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        children: <Widget>[
                                          Container(
                                            height:  MediaQuery.of(context).size.height / 3 ,
                                            child: Scrollbar(
                                              isAlwaysShown: true,
                                              thickness: 10,
                                              showTrackOnHover: true,
                                              child: ListView.builder(
                                                  physics: BouncingScrollPhysics(),

                                                  itemCount: environmentallabsList.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    EnvironmentalLabsModel environmentallabslist = environmentallabsList[index];
                                                    return Column(
                                                      children: [
                                                        Divider(color: Colors.black,),

                                                        GestureDetector(
                                                          onTap: () => Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => PfdPage(
                                                                    filepath: environmentallabslist.url,
                                                                  ))),
                                                          child: ListTile(
                                                            leading: Icon(
                                                              Icons.picture_as_pdf,
                                                              color: Colors.red,
                                                            ),
                                                            title: Text(
                                                              environmentallabslist.name.toString(),
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
                                     // color: Colors.grey.shade100,
                                      child: ExpansionTile(
                                        tilePadding: EdgeInsets.only(left: 10,right: 10),

                                        title: Text(
                                          "Environmental Standards",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        children: <Widget>[
                                          Container(
                                            height:  MediaQuery.of(context).size.height / 3 ,
                                            child: Scrollbar(
                                              isAlwaysShown: true,
                                              thickness: 10,
                                              showTrackOnHover: true,
                                              child: ListView.builder(
                                                  physics: BouncingScrollPhysics(),

                                                  itemCount: environmentalstandardList.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    EnvironmentalStandardsModel environmentalstandardlist =
                                                    environmentalstandardList[index];
                                                    return Column(
                                                      children: [
                                                        Divider(color: Colors.black,),

                                                        GestureDetector(
                                                          onTap: () => Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => PfdPage(
                                                                    filepath: environmentalstandardlist.url,
                                                                  ))),
                                                          child: ListTile(
                                                            leading: Icon(
                                                              Icons.picture_as_pdf,
                                                              color: Colors.red,
                                                            ),
                                                            title: Text(
                                                              environmentalstandardlist.name.toString(),
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
                                    //  color: Colors.grey.shade100,
                                      child: ExpansionTile(
                                        tilePadding: EdgeInsets.only(left: 10,right: 10),

                                        title: Text(
                                          "Hazardous Substances Management",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        children: <Widget>[
                                          Container(
                                            height:  MediaQuery.of(context).size.height / 3 ,
                                            child: Scrollbar(
                                              isAlwaysShown: true,
                                              thickness: 10,
                                              showTrackOnHover: true,
                                              child: ListView.builder(
                                                  physics: BouncingScrollPhysics(),

                                                  itemCount: HazardousSubstancesList.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    HazardousSubstancesModel HazardousSubstanceslist =
                                                    HazardousSubstancesList[index];
                                                    return Column(
                                                      children: [
                                                        Divider(color: Colors.black,),

                                                        GestureDetector(
                                                          onTap: () => Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => PfdPage(
                                                                    filepath: HazardousSubstanceslist.url,
                                                                  ))),
                                                          child: ListTile(
                                                            leading: Icon(
                                                              Icons.picture_as_pdf,
                                                              color: Colors.red,
                                                            ),
                                                            title: Text(
                                                              HazardousSubstanceslist.name.toString(),
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
                                     // color: Colors.grey.shade100,
                                      child: ExpansionTile(
                                        tilePadding: EdgeInsets.only(left: 10,right: 10),

                                        title: Text(
                                          "Loss of Ecology",
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

                                                  itemCount: LossOfEcologyList.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    LossOfEcologyModel LossOfEcologylist = LossOfEcologyList[index];
                                                    return Column(
                                                      children: [
                                                        Divider(color: Colors.black,),

                                                        GestureDetector(
                                                          onTap: () => Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => PfdPage(
                                                                    filepath: LossOfEcologylist.url,
                                                                  ))),
                                                          child: ListTile(
                                                            leading: Icon(
                                                              Icons.picture_as_pdf,
                                                              color: Colors.red,
                                                            ),
                                                            title: Text(
                                                              LossOfEcologylist.name.toString(),
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
                                    //  color: Colors.grey.shade100,
                                      child: ExpansionTile(
                                        tilePadding: EdgeInsets.only(left: 10,right: 10),

                                        title: Text(
                                          "Noise Pollution",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        children: <Widget>[
                                          Container(
                                            height:  MediaQuery.of(context).size.height / 3 ,
                                            child: Scrollbar(
                                              isAlwaysShown: true,
                                              thickness: 10,
                                              showTrackOnHover: true,
                                              child: ListView.builder(
                                                  physics: BouncingScrollPhysics(),

                                                  itemCount: NoisePollutionList.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    NoisePollutionModel NoisePollutionlist = NoisePollutionList[index];
                                                    return Column(
                                                      children: [
                                                        Divider(color: Colors.black,),

                                                        GestureDetector(
                                                          onTap: () => Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => PfdPage(
                                                                    filepath: NoisePollutionlist.url,
                                                                  ))),
                                                          child: ListTile(
                                                            leading: Icon(
                                                              Icons.picture_as_pdf,
                                                              color: Colors.red,
                                                            ),
                                                            title: Text(
                                                              NoisePollutionlist.name.toString(),
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
                                    //  color: Colors.grey.shade100,
                                      child: ExpansionTile(
                                        tilePadding: EdgeInsets.only(left: 10,right: 10),

                                        title: Text(
                                          "Ozone Layer Depletion",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        children: <Widget>[
                                          Container(
                                            height: MediaQuery.of(context).size.height / 3 ,
                                            child: Scrollbar(
                                              isAlwaysShown: true,
                                              thickness: 10,
                                              showTrackOnHover: true,
                                              child: ListView.builder(
                                                  physics: BouncingScrollPhysics(),

                                                  itemCount: OzoneLayerList.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    OzoneLayerModel OzoneLayerlist = OzoneLayerList[index];
                                                    return Column(
                                                      children: [
                                                        Divider(color: Colors.black,),

                                                        GestureDetector(
                                                          onTap: () => Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => PfdPage(
                                                                    filepath: OzoneLayerlist.url,
                                                                  ))),
                                                          child: ListTile(
                                                            leading: Icon(
                                                              Icons.picture_as_pdf,
                                                              color: Colors.red,
                                                            ),
                                                            title: Text(
                                                              OzoneLayerlist.name.toString(),
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
                                     // color: Colors.grey.shade100,
                                      child: ExpansionTile(
                                        tilePadding: EdgeInsets.only(left: 10,right: 10),

                                        title: Text(
                                          "Water Pollution",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        children: <Widget>[
                                          Container(
                                            height: MediaQuery.of(context).size.height / 3 ,
                                            child: Scrollbar(
                                              isAlwaysShown: true,
                                              thickness: 10,
                                              showTrackOnHover: true,
                                              child: ListView.builder(
                                                  physics: BouncingScrollPhysics(),

                                                  itemCount: WaterPollutionList.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    WaterPollutionModel WaterPollutionlist = WaterPollutionList[index];
                                                    return Column(
                                                      children: [
                                                        Divider(color: Colors.black,),

                                                        GestureDetector(
                                                          onTap: () => Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => PfdPage(
                                                                    filepath: WaterPollutionlist.url,
                                                                  ))),
                                                          child: ListTile(
                                                            leading: Icon(
                                                              Icons.picture_as_pdf,
                                                              color: Colors.red,
                                                            ),
                                                            title: Text(
                                                              WaterPollutionlist.name.toString(),
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
                                     // color: Colors.grey.shade100,
                                      child: ExpansionTile(
                                        tilePadding: EdgeInsets.only(left: 10,right: 10),

                                        title: Text(
                                          "2-T Oil",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        children: <Widget>[
                                          Container(
                                            height: MediaQuery.of(context).size.height / 3 ,
                                            child: Scrollbar(
                                              isAlwaysShown: true,
                                              thickness: 10,
                                              showTrackOnHover: true,
                                              child: ListView.builder(
                                                  physics: BouncingScrollPhysics(),

                                                  itemCount: TOilList.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    TOilModel TOillist = TOilList[index];
                                                    return Column(
                                                      children: [
                                                        Divider(color: Colors.black,),

                                                        GestureDetector(
                                                          onTap: () => Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder: (context) => PfdPage(
                                                                    filepath: TOillist.url,
                                                                  ))),
                                                          child: ListTile(
                                                            leading: Icon(
                                                              Icons.picture_as_pdf,
                                                              color: Colors.red,
                                                            ),
                                                            title: Text(
                                                              TOillist.name.toString(),
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
                                  ],
                                ),
                              ),
                            )
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
                        tilePadding: EdgeInsets.only(left: 10,right: 10),

                        title: Text(
                          "Regional Empowered Committee",
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

                                  itemCount: RegionalEmpowerrdList.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    RegionalEmpoweredModel RegionalEmpowerrdlist = RegionalEmpowerrdList[index];
                                    return Column(
                                      children: [
                                        Divider(color: Colors.black,),

                                        GestureDetector(
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => PfdPage(
                                                    filepath: RegionalEmpowerrdlist.url,
                                                  ))),
                                          child: ListTile(
                                            leading: Icon(
                                              Icons.picture_as_pdf,
                                              color: Colors.red,
                                            ),
                                            title: Text(
                                              RegionalEmpowerrdlist.name.toString(),
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
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PfdPage(
                                  filepath: "http://moef.gov.in/wp-content/uploads/2019/04/Compendium-of-OMs_reduce.pdf"))),
                      child: Card(
                        elevation: 2,
                        color: Colors.grey.shade100,
                        child: Container(
                          margin: EdgeInsets.only(left: 10,right: 10),
                          height: 50,
                          child: Row(
                            children: [
                              Text(
                                "Compendium Of Eia Notification",
                                style: TextStyle(fontSize: 16),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Icon(Icons.keyboard_arrow_down),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: enableContainer=true,
              child: Container(
                height: MediaQuery.of(context).size.height/6,
              ),
            )
          ],
        ),
      )

    ):NoNetworkWidget();
  }
}
