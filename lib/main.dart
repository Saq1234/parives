import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parivesh/proposal/view/track_proposal.dart';
import 'package:parivesh/proposal/viewmodel/trackporposal_viewmodel.dart';
import 'package:provider/provider.dart';

import 'common/app_routes.dart';

void main() async{
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_)=>ProposalViewModel(),
            child: TrackPorposal(),
          ),
        ],
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const SplashScreen(),
          onGenerateRoute: AppRouteGenerator.generateRoute,
    ),
      );
  }
}



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState(){
    startTime();
  }

  startTime() async {
    Timer(
        const Duration(seconds: 3),
            () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const TrackPorposal())));

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Container(
          width: MediaQuery.of(context).size.width/1.1,
            child: Image.asset('assets/images/pariveshLogo.png',fit: BoxFit.cover,)),
        Container(
            width: MediaQuery.of(context).size.width/1.1,
            child: Image.asset('assets/images/pariveshTitle.png',fit: BoxFit.cover,)),
      ],
    ),);
  }
}

