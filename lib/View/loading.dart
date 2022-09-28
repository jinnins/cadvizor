import 'dart:async';

import 'package:cadvizortestlibrary/View/successbuy.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  startTimer() async{
    var duration = Duration(seconds: 2);
    Future.delayed(duration, () {
      Timer(duration, route);
    });
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SuccessPageWidget()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              child: Image.asset('assets/images/payment.png'),
            ),
            Text(
              'Please wait for payment',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            LoadingAnimationWidget.flickr(
                leftDotColor: Colors.blueAccent,
                rightDotColor: Colors.redAccent,
                size: 100)
          ],
        ),
      ),
    );
  }
}
