import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snacmate/pages/signup/signup_home.dart';
import 'package:snacmate/widgets/logged_in_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }else if (snapshot.hasData){
            return const LoggedInWidget();
          }else if (snapshot.hasError){
            return const Center(child:  Text("Something went wrong!"),);
          }
          else{
            return const signupHomepage();
          }
          
        }
        ),
    );
  }
}