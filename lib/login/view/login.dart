import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/appColors.dart';
import '../../common/no_network.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Opacity(
                opacity: 1,
                child: Image.asset('assets/images/moefcc_ministry_logo.png',fit: BoxFit.fill,height: double.infinity,width: double.infinity,
                  color: Colors.white.withOpacity(0.9), colorBlendMode: BlendMode.screen, ),
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,

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
                child: Column(
                  children: [

                    Container(
                      height: MediaQuery.of(context).size.height / 6,
                    ),
                    forgothide==true?
                    Text("Forgot Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),):
                    Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.black),),
                    Container(
                      height: MediaQuery.of(context).size.height / 6,
                    ),
                    Column(
                      children: [
                        forgothide==true?
                        fogot():login(),
                      ],
                    ),
                  ],
                ),
              ),
            )

          ],
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
          Container(
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
