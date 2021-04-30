import 'package:disability_application/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
class FingerPrintAuth extends StatefulWidget {
  @override
  _FingerPrintAuthState createState() => _FingerPrintAuthState();
}

class _FingerPrintAuthState extends State<FingerPrintAuth> {
  final LocalAuthentication auth = LocalAuthentication();
  bool _isAuthenticating = false;
  bool _authorized = false;

  Future<void> _autheniticate() async {
    try {
      setState(() {
        _isAuthenticating = true;
      });

      bool _authenticated = false;

      _authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Please authenticate to show account details',
          useErrorDialogs: true,
          stickyAuth: true);

      setState(() {
        _authorized = _authenticated;
        _isAuthenticating = false;
      });
    } catch (e) {
      setState(() {
        _isAuthenticating = false;
      });
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _authorized
                    ? Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen()))
                    : Text("Cant't authenticate finger print"),
                RaisedButton(
                  child: Text('Get Finger Print'),
                  onPressed: _autheniticate,
                )
              ],
            ),
          ),
        ));
  }
}
