import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parivesh/proposal/viewmodel/trackporposal_viewmodel.dart';
import 'package:provider/provider.dart';

import '../proposal/view/track_proposal_dashboard.dart';
import '../proposal/view/track_proposal.dart';

class AppRouteGenerator {
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
  }
}

class AppRoutes {
  static const String trackporposal = "trackporposal";
  static const String trackporposaldash = "trackporposaldash";
}
