import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../acts_&_rules_dashboard/view/acts_rules_dashboard.dart';
import '../../common/appColors.dart';
import '../../common/no_network.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  static const colorizeColors = [
    Colors.purple,
    Colors.white,
    Colors.blue,

    Colors.yellow,
    Colors.red,
    Colors.white,
  ];
  TextEditingController idController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool _isObscure = true;
  bool forgothide=false;
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

    return _connectionStatus == true?

     SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,

          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(''),
            centerTitle: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/logo.png'), fit: BoxFit.fitWidth)),
            ),
          ),

          body:
          SingleChildScrollView(
            child:Column(

              children: [
                Stack(
                  children: [
                    Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height/3.5,
                    child: Image.asset("assets/images/login_top_image.jpg",fit: BoxFit.cover,),
                    
                  ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Center(
                            child: AnimatedTextKit(
                              repeatForever: true,
                              animatedTexts: [
                              ColorizeAnimatedText(
                              'PARIVESH',
                              textStyle: TextStyle(fontSize: 24),
                              colors: colorizeColors,
                            ),
                            ],),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: 
                          Text("Pro Active and Responsive facilitation by ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                        ),
                        Text("Interactive and Virtuous Environmental",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                        Text("Single window Hub",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                        SizedBox(height: 15,),
                        Text("A single window integrated system for Environment, Forest,",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                        SizedBox(height: 10,),

                        Text("Wild Life & CRZ Clearance Process",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                      ],
                    ),
                    ]
                ),
                Stack(
                  children: [
                    Opacity(
                      opacity: 0.3,
                      child: Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Image.asset("assets/images/parivesh.jpg",fit: BoxFit.cover,width: double.infinity,
                          color: Colors.white.withOpacity(0.2),
                          colorBlendMode: BlendMode.hue,
                        ),
                      ),

                    ),

                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            forgothide==true?

                            Text("Forgot Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),):
                            Text("Log In",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.black),),

                          ],
                        ),
                      ),
                    ),

                    Positioned.fill(
                      top: 100,
                      child: Column(
                        children: [
                        forgothide==true?
                        fogot():login(),
                      ],
                      ),
                    )
                  ],
                ),



              ],
            )

          ),
        )
    ):NoNetworkWidget();
  }
  Widget login(){
   return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration:
            BoxDecoration(border: Border.all(color: AppColor.black), borderRadius: BorderRadius.circular(20),),
            child: TextField(
              cursorColor: Colors.grey,
              controller: idController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                border: InputBorder.none,
                hintText: 'Login id *',
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.black), borderRadius: BorderRadius.circular(20)),
              child: TextField(
                  cursorColor: Colors.grey,
                  obscureText: _isObscure,
                  controller: passController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10,top: 12),
                      border: InputBorder.none,
                      hintText: 'Password *',
                      suffixIcon: IconButton(
                          icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off,color: _isObscure?Colors.grey:Colors.black,),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          })))),
          SizedBox(
            height: 15,
          ),
          Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    forgothide=true;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    "Forgot Password ?",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              )),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: ()=>Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (context) => const ActsRulesDashBoard())),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffCAE7DE),
                  border: Border.all(color: Colors.black)),
              child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                  )),
            ),
          ),
        ],
      ),
    );
  }
  Widget fogot(){
   return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration:
            BoxDecoration(border: Border.all(color: AppColor.black), borderRadius: BorderRadius.circular(20)),
            child: TextField(
              cursorColor: Colors.grey,
              controller: idController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                border: InputBorder.none,
                hintText: 'Login id *',
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    forgothide=false;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              )),

          SizedBox(
            height: 40,
          ),
          Container(
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffCAE7DE),
                border: Border.all(color: Colors.black)),
            child: Center(
                child: Text(
                  "Submit",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                )),
          ),
        ],
      ),
    );
  }
}
