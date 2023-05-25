import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parivesh/proposal/model/track_proposol_details_model.dart';
import 'package:provider/provider.dart';

import '../model/track_proposal_model.dart';
import '../viewmodel/trackporposal_viewmodel.dart';

class TrackProposolDetails extends StatefulWidget {
  String? proposolNo;
  TrackProposolDetails({this.proposolNo});

  @override
  State<TrackProposolDetails> createState() => _TrackProposolDetailsState();
}

class _TrackProposolDetailsState extends State<TrackProposolDetails> {

  ProposalViewModel? proposalViewModel;
  TrackProposolDetailsModel? trackProposolDetailsModel;

  @override
  void initState() {
    super.initState();
    proposalViewModel = Provider.of<ProposalViewModel>(context, listen: false);
    print("karo${widget.proposolNo}");

  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      body: Column(
        children: [
          Expanded(child:
          DetailsData())
        ],
      ),

    ));


  }
}
Widget DetailsData(){
  return
    Card();

}
