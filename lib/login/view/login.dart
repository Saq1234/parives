import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/appColors.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(200)), color: Color(0xffCAE7DE)),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: Align(
                  alignment: Alignment.center,
                  child:forgothide==true?
                  Text("Forgot Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),):
                  Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
              ),
            ),
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
    ));
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
