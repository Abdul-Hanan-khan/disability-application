import 'package:disability_application/home_page.dart';
import 'package:disability_application/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:introduction_screen/introduction_screen.dart';


//import on board me dependency

class IntroScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _IntroScreen();
  }

}

class _IntroScreen extends State<IntroScreen>{

  @override
  Widget build(BuildContext context) {

    //this is a page decoration for intro screen
    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0,
          fontWeight: FontWeight.w700,
          color:Colors.black
      ), //tile font size, weight and color
      bodyTextStyle:TextStyle(fontSize: 19.0, color:Colors.black54),
      //body text size and color
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      //decription padding
      imagePadding: EdgeInsets.all(20), //image padding
      boxDecoration:BoxDecoration(
        // color: Colors.white
        //     graciatnt is owsome
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.white,
            Colors.grey[200],
            Colors.grey[300],
            Colors.grey,
          ],
        ),
      ), //show linear gradient background of page
    );

    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      //main background of screen
      pages: [ //set your page view here
        PageViewModel(
          title: "Fractional shares",
          body: "Instead of having to buy an entire share, invest any amount you want.",
          image: introImage('assets/onboard1.PNG'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fractional shares",
          body: "Instead of having to buy an entire share, invest any amount you want.",
          image: introImage('assets/onboard2.PNG'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fractional shares",
          body: "Instead of having to buy an entire share, invest any amount you want.",
          image: introImage('assets/onboard3.PNG'),
          decoration: pageDecoration,
        ),

        //add more screen here
      ],

      onDone: () => goLoginPage(context), //go to home page on done
      onSkip: () => goLoginPage(context), // You can override on skip
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: Text('Skip', style: TextStyle(color: Colors.white),),
      next: Icon(Icons.arrow_forward, color: Colors.white,),
      done: Text('Getting Stated', style: TextStyle(
          fontWeight: FontWeight.w600, color:Colors.white
      ),),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0), //size of dots
        color: Colors.white, //color of dots
        activeSize: Size(22.0, 10.0),
        //activeColor: Colors.white, //color of active dot
        activeShape: RoundedRectangleBorder( //shave of active dot
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }

  void goHomepage(context){
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context){
          return HomeScreen();
        }
        ), (Route<dynamic> route) => false);
    //Navigate to home page and remove the intro screen history
    //so that "Back" button wont work.
  }
  void goLoginPage(context){
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context){
          return LoginScreen();
        }
        ), (Route<dynamic> route) => false);
  }

  Widget introImage(String assetName) {
    //widget to show intro image
    return Align(
      child: Container(
        width: 300,
        height: 200,
        child: Image.asset('$assetName', width: 350.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),

        color: Colors.white,
        border: Border.all(color: Colors.blue),
      ),),
      alignment: Alignment.bottomCenter,
    );
  }
}