import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parivesh/user_manuals/model/user_manuals_model.dart';
import 'package:parivesh/user_manuals/view_model/user_manual_viewmodel.dart';
import 'package:provider/provider.dart';

class UserManuals extends StatefulWidget {
  const UserManuals({Key? key}) : super(key: key);

  @override
  State<UserManuals> createState() => _UserManualsState();
}

class _UserManualsState extends State<UserManuals> {
  UserManualViewModel?userManualViewModel;
  UserManualsOtherModel?userManualsOtherModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userManualViewModel = Provider.of<UserManualViewModel>(context, listen: false);
    userManualViewModel?.getUserManualOtherDetails(category: "others");
    // userManualViewModel?.getUserManualDetails(category: "forest-clearance");
    // userManualViewModel?.getUserManualDetails(category: "wildlife-clearance");
    // userManualViewModel?.getUserManualDetails(category: "crz-clearance");
    // userManualViewModel?.getUserManualDetails(category: "enviormental-clearance");

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Manuals"),
      ),
      body:    Consumer<UserManualViewModel>(builder: (context, model, child) {
              return model.userManualsOtherModel != null
            ? ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: model.userManualsOtherModel?.data?.length,
            itemBuilder: (BuildContext context, int index) {
              final userManualList = model.userManualsOtherModel?.data?[index];
              return  userManualList?.category=="others"
                  ? Card(child:
              Padding(
                padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("User Manual Name"),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Container(
                            color: Colors.amber,
                           // width: MediaQuery.of(context).size.width/1.2,
                              child: Text(userManualList?.title??"",)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),)

                  : Center(child: Text(""));
            })
            
            : Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ));
      }),
    );

  }
}
