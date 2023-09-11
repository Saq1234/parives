import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:parivesh/login/view/flow.dart';
import '../../acts_&_rules_dashboard/view/acts_rules_dashboard.dart';
import '../../common/appColors.dart';
import '../../common/app_url.dart';
import '../../common/no_network.dart';

class Login extends StatefulWidget {

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
  TextEditingController forgetIdController = TextEditingController();
  TextEditingController captchaController = TextEditingController();
  bool _isObscure = true;
  bool forgothide = false;
  bool _connectionStatus = true;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  String? randomString;
  String? showCaptcha;
  bool id=false;
  bool pass=false;
  bool captcha=false;
  bool forgotId=false;
  var keyBase64;
  var encrypted;
  var decrypted;
  var keyBase64Encoded;
  var encryptedBase64;
  var decodedString;



  String generateRandomString() {
    const int keyLength = 32; // 32 bytes = 256 bits
    final random = Random.secure();
    final List<int> bytes = List.generate(keyLength, (index) => random.nextInt(256));

    final key = base64UrlEncode(bytes);

    return key;
  }

  showRandomNumber() {
    randomString = generateRandomString();
    showCaptcha = randomString!.substring(0, 5);
    print(randomString);
  }


  String _responseText = '';

  Future<void> makePostRequest({required String username, required String password,required String propParivesh}) async {
    final url = Uri.parse(AppUrls.loginpi); // Replace with your API endpoint

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        username:username,
        password:password,
        propParivesh:propParivesh
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        _responseText = 'Response: ${response.body}';
        print("Output >> $_responseText");
      });
    } else {
      setState(() {
        _responseText = 'Error: ${response.statusCode}';
        print("FailOutput >> $_responseText");

      });
    }
  }


  // Future dob({required String Encodepassword})async {
  //   var strinArray = ['s', 'e', 'c', 'r', 'e', 't', 'k', 'e', 'y'];
  //   var screteKeyText = '';
  //   for (var j = 1; j < strinArray.length; j++) {
  //     screteKeyText += strinArray[DateTime.now().millisecondsSinceEpoch % strinArray.length];
  //   }
  //   print("secret>>$screteKeyText");
  //
  //   keyBase64 = base64.encode(utf8.encode(screteKeyText + DateTime.now().millisecondsSinceEpoch.toRadixString(36)));
  //   print("Base64key>>$keyBase64");
  //   keyBase64Encoded = base64.encode(utf8.encode(keyBase64));
  //   print("Base64Encodedkey >>$keyBase64Encoded");
  //
  //
  //   // var key = crypto.base64.parse(keyBase64);
  //   //  var srcs = utf8.encode(Encodepassword.trim());
  //   // var encrypted = crypto.AES.encrypt(srcs, key,
  //   //     mode: crypto.AESMode.ecb, padding: crypto.Padding.pkcs7);
  //   // print(encrypted.base64);
  //
  //
  //   // encrypted = Encryptor.encrypt(keyBase64Encoded, Encodepassword);
  //   //  decrypted = Encryptor.decrypt(keyBase64Encoded, encrypted);
  //   //
  //   //
  //   // print("Base64+Password>>$encrypted");
  //   // print("Decrypt>>$decrypted");
  //
  //
  //
  //
  //
  //   // var srcs = utf8.encode(Encodepassword);
  //   // encrypted= encryptAESCryptoJS(Encodepassword, keyBase64Encoded);
  //   // final des = decryptAESCryptoJS(encrypted!, keyBase64Encoded);
  //   // print("Decrypt>>$encrypted");
  //   // print("Decrypt>>$des");
  //
  //
  //   // final des = decryptAESCryptoJS(encrypted, Encodepassword );
  //   // print(des);
  //
  // }

  Future<void> work({required String pd}) async {

    var strinArray = ['s', 'e', 'c', 'r', 'e', 't', 'k', 'e', 'y'];
    var screteKeyText = '';
    var keyBase64;

    for (var j = 1; j < strinArray.length; j++) {
      screteKeyText += strinArray[DateTime.now().millisecondsSinceEpoch % strinArray.length];
    }
    print("secret>>$screteKeyText");

    keyBase64 = base64.encode(utf8.encode(screteKeyText + DateTime.now().millisecondsSinceEpoch.toRadixString(36)));
    print("Base64key>>$keyBase64");
     keyBase64Encoded = base64.encode(utf8.encode(keyBase64));
    print("Base64Encodedkey >>$keyBase64Encoded");

    final plainText = pd;
    final key = keyBase64Encoded;

    print('Plain text for encryption: $plainText');

    //Encrypt
    Encrypted encrypted = encryptWithAES(key, plainText);
     encryptedBase64 = encrypted.base64;
    print('Encrypted data in base64 encoding: $encryptedBase64');

    //Decrypt
    String decryptedText = decryptWithAES(key, encrypted);
    print('Decrypted data: $decryptedText');

  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    showRandomNumber();
   // dob(password:passController.text );
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
    return _connectionStatus == true ?

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
              child: Column(
                children: [
                  Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 3.5,
                          child: Image.asset("assets/images/login_top_image.jpg", fit: BoxFit.cover,),

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
                              Text("Pro Active and Responsive facilitation by ", style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),),
                            ),
                            Text("Interactive and Virtuous Environmental",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                            Text("Single window Hub",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                            SizedBox(height: 15,),
                            Text("A single window integrated system for Environment, Forest,",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),),
                            SizedBox(height: 10,),

                            Text("Wild Life & CRZ Clearance Process",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),),
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
                          child: Image.asset("assets/images/parivesh.jpg", fit: BoxFit.cover, width: double.infinity,
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
                              forgothide == true ?

                              Text("Forgot Password", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),) :
                              Text("Log In",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),),

                            ],
                          ),
                        ),
                      ),

                      Positioned.fill(
                        top: 100,
                        child: Column(
                          children: [
                            forgothide == true ?
                            forgot() : login(),
                          ],
                        ),
                      )
                    ],
                  ),


                ],
              )

          ),
        )
    ) : NoNetworkWidget();
  }

  Widget login() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration:
            BoxDecoration(border: Border.all(color: id==true?Colors.red:AppColor.black), borderRadius: BorderRadius.circular(20),),
            child: TextField(
              cursorColor: Colors.grey,
              controller: idController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                border: InputBorder.none,
                hintText: 'Login id *',
              ),
              onChanged: (v){
                setState(() {
                  id=false;
                });
              },
            ),

          ),
          SizedBox(
            height: 40,
          ),
          Container(
              decoration: BoxDecoration(
                  border: Border.all(color:pass==true?Colors.red: AppColor.black), borderRadius: BorderRadius.circular(20)),
              child: TextField(
                  cursorColor: Colors.grey,
                  obscureText: _isObscure,
                  controller: passController,
                  decoration: InputDecoration(

                      contentPadding: EdgeInsets.only(left: 10, top: 12),
                      border: InputBorder.none,
                      hintText: 'Password *',
                      suffixIcon: IconButton(
                          icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off,
                            color: _isObscure ? Colors.grey : Colors.black,),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          })),
                onChanged: (v){
                    setState(() {
                      pass=false;
                    });

                },
              )),
          SizedBox(
            height: 15,
          ),
          Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    forgothide = true;
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
            height: 15,
          ),
          Row(
            children: [
              Container(
                color: Colors.black,
                padding: EdgeInsets.all(8),
                child: Text(showCaptcha.toString(),
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
              ),
              SizedBox(width: 20,),
              GestureDetector(
                onTap: () {
                  setState(() {
                  //  randomString = generateRandomString();
                    showCaptcha = randomString!.substring(0, 5);

                    print(randomString);
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.black),
                    ),
                    child: Icon(Icons.refresh, color: Colors.green, size: 30,)),
              ),
              Spacer(),
              Container(
                height: 45,
                margin: EdgeInsets.only(right: 10),
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 2.2,
                decoration: BoxDecoration(
                    border: Border.all(color:captcha==true?Colors.red: AppColor.black),
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: captchaController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20,),
                      border: InputBorder.none,
                      hintText: 'Enter Captcha',
                      hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)
                  ),
                  onChanged: (v){
                    setState(() {
                      captcha=false;
                      if(captchaController.text.length>5){
                        FocusManager.instance.primaryFocus?.unfocus();

                      }

                    });
                  },
                ),),
            ],),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              // setState(() {
              //   work(pd: passController.text);
              //    makePostRequest(username: idController.text,password:encryptedBase64 ,propParivesh: keyBase64Encoded);
              // });
              if(idController.text.isEmpty && passController.text.isEmpty && captchaController.text.isEmpty){
                setState(() {
                  id=true;
                  pass=true;
                  captcha=true;
                });

              }
              else if(idController.text.isEmpty){
                setState(() {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Please Enter Login Id"),
                  ));
                   id=true;
                });

              }else if(passController.text.isEmpty){
                setState(() {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Please Enter Password"),
                  ));
                   pass=true;

                });

              }
              else if(captchaController.text.isEmpty){
                setState(() {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Please Enter Captcha"),
                  ));
                   captcha=true;
                });

              }
              else if(showCaptcha !=captchaController.text){
                setState(() {
                  //randomString = generateRandomString();
                  showCaptcha = randomString!.substring(0, 5);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Please Enter Valid Captcha"),
                  ));
                  captchaController.clear();
                });

              }else if(idController.text.isNotEmpty || passController.text.isNotEmpty || showCaptcha==captchaController.text){
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const ActsRulesDashBoard()));
              }

            },


            child: Container(
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffCAE7DE),
                  border: Border.all(color: Colors.black)),
              child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget forgot() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration:
            BoxDecoration(border: Border.all(color:forgotId==true?Colors.red: AppColor.black), borderRadius: BorderRadius.circular(20)),
            child: TextField(
              cursorColor: Colors.grey,
              controller: forgetIdController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                border: InputBorder.none,
                hintText: 'Login id *',
              ),
              onChanged: (v){
                setState(() {
                  forgotId=false;
                });
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    forgothide = false;
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
          GestureDetector(
            onTap: (){
              if(forgetIdController.text.isEmpty){
                setState(() {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Please Enter Login Id"),
                  ));
                  forgotId=true;
                });
              }
            },
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffCAE7DE),
                  border: Border.all(color: Colors.black)),
              child: Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
