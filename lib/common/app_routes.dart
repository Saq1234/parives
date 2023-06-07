import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parivesh/proposal/model/advance_search_arguments.dart';
import 'package:parivesh/proposal/view/advance_search_dashboard.dart';
import 'package:parivesh/proposal/view/track_proposol_details.dart';
import 'package:parivesh/proposal/viewmodel/trackporposal_viewmodel.dart';
import 'package:provider/provider.dart';

import '../proposal/view/advance_searchDetails.dart';
import '../proposal/view/track_proposal_dashboard.dart';
import '../proposal/view/track_proposal.dart';

class AppRouteGenerator {
  late final int clearanceId;
  late final int stateCode;
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return data(settings);
  }
}

data(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.trackporposal:
      return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
                create: (_) => ProposalViewModel(),
                child: TrackPorposal(),
              ));
    case AppRoutes.trackporposaldash:
      return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
                create: (_) => ProposalViewModel(),
                child: TrackPorposalDash(),
              ));
    case AppRoutes.advancesearchdashboard:
      final args = settings.arguments as AdvanceSearchArguments;
      print("appst${args.clearanceId}");
      print("appst${args.stateCode}");
      return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
              create: (_) => ProposalViewModel(),
              child: AdvanceSearchDashboard(clearanceId:args.clearanceId,stateCode: args.stateCode,)));
      case AppRoutes.trackproposoldetails:
      final args = settings.arguments as TrackProposolDetailsArguments;
      return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
              create: (_) => ProposalViewModel(),
              child: TrackProposolDetails(proposolNo: args.proposolNo,ApplicationFor: args.ApplicationFor,
              ProjectCategory: args.ProjectCategory,Area: args.Area,Date: args.Date,ProjectName: args.ProjectName,SingleWindowNo: args.SingleWindowNo,
              state: args.state,id: args.id,)));
      case AppRoutes.advancesearchdetails:
      final args = settings.arguments as AdvanceSearchDetailsArguments;
      return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
              create: (_) => ProposalViewModel(),
              child: AdvanceSearchDetail(
                proposolNo: args.proposolNo,
                clearanceId: args.clearanceId,
                id: args.id,
                sector: args.sector,
              )));

  }
}

class AppRoutes {
  static const String trackporposal = "trackporposal";
  static const String trackporposaldash = "trackporposaldash";
  static const String advancesearchdashboard = "advancesearchdashboard";
  static const String trackproposoldetails = "trackproposoldetails";
  static const String advancesearchdetails = "advancesearchdetails";
}
