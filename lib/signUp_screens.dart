import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disability_application/top_bar.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'login_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference ref = FirebaseFirestore.instance.collection("Users");

  final formKey = GlobalKey<FormState>();

  bool formValidationSuccess = false;

  var fNameCtr = TextEditingController();
  var lNameCtr = TextEditingController();
  var mobileNoCtr = TextEditingController();
  var emailCtr = TextEditingController();
  var passwordCtr = TextEditingController();
  var nationalityCtr = TextEditingController();
  bool valuefirst = false;
  String disabilityType;

  String birthDateInString;
  DateTime birthDate;
  bool isDateSelected;



  @override
  void initState() {
    // TODO: implement initState
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(),
            SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //fname
                    Card(
                      elevation: 7,
                      margin:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 4),
                        child: TextFormField(
                          maxLines: 1,
                          controller: fNameCtr,
                          validator: firstNameValidation,
                          decoration: InputDecoration(
                              hintText: " First Name",
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                icon: Icon(Icons.cancel_outlined),
                                onPressed: () => fNameCtr.clear(),
                              )),
                        ),
                      ),
                    ),
                    //lname
                    Card(
                      elevation: 7,
                      margin:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 4),
                        child: TextFormField(
                          controller: lNameCtr,
                          validator: lastNameValidation,
                          decoration: InputDecoration(
                              hintText: " Last Name",
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                icon: Icon(Icons.cancel_outlined),
                                onPressed: () => lNameCtr.clear(),
                              )),
                        ),
                      ),
                    ),
                    //Gender
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        "Gender",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Row(
                        children: <Widget>[
                          addRadioButton(0, 'Male'),
                          addRadioButton(1, 'Female'),
                          addRadioButton(2, 'Others'),
                        ],
                      ),
                    ),

                    // date of birth
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                "Please Select date of Birth",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.calendar_today),
                          ],
                        ),
                        onTap: () async {
                          final datePick = await showDatePicker(
                              context: context,
                              initialDate: new DateTime.now(),
                              firstDate: new DateTime(1900),
                              lastDate: new DateTime(2100));
                          if (datePick != null && datePick != birthDate) {
                            setState(() {
                              birthDate = datePick;
                              isDateSelected = true;

                              // put it here
                              birthDateInString =
                              "${birthDate.month}/${birthDate.day}/${birthDate.year}"; // 08/14/2019
                            });
                          }
                        }),
                    SizedBox(
                      height: 10,
                    ),
                    //naitonality
                    Card(
                      elevation: 7,
                      margin:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 4),
                        child: TextFormField(
                          controller: nationalityCtr,
                          validator: nationalityValidation,
                          decoration: InputDecoration(
                              hintText: " Nationality",
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                icon: Icon(Icons.cancel_outlined),
                                onPressed: () => nationalityCtr.clear(),
                              )),
                        ),
                      ),
                    ),
                    //mobileno
                    Card(
                      elevation: 7,
                      margin:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 4),
                        child: TextFormField(
                          controller: mobileNoCtr,
                          validator: phoneNoValidation,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: " Phone #",
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                icon: Icon(Icons.cancel_outlined),
                                onPressed: () => mobileNoCtr.clear(),
                              )),
                        ),
                      ),
                    ),

                    Padding(
                      padding:
                      const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: CheckboxListTile(
                        title: Text(
                          'Are you Disable ?',
                          style: TextStyle(
                            color: Colors.red.withOpacity(0.5),
                          ),
                        ),
                        value: this.valuefirst,
                        onChanged: (bool value) {
                          setState(() {
                            this.valuefirst = value;
                          });
                        },
                      ),
                    ),
                    valuefirst
                        ? Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        children: [
                          Text("Please Select one"),
                          DropdownButton<String>(
                            items: <String>[
                              'Mental',
                              'Physical',
                              'Sensory',
                              'Intellect',
                              'Epilepsy',
                              'Albinism',
                              'Multiple'
                            ].map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              disabilityType = value;
                            },
                          ),
                        ],
                      ),
                    )
                        : Container(),

                    //email;
                    Card(
                      elevation: 7,
                      margin:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 4),
                        child: TextFormField(
                          controller: emailCtr,
                          validator: emailValidation,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: " Email",
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                icon: Icon(Icons.cancel_outlined),
                                onPressed: () => emailCtr.clear(),
                              )),
                        ),
                      ),
                    ),
                    //passeword
                    Card(
                      elevation: 7,
                      margin:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 4),
                        child: TextFormField(
                          controller: passwordCtr,
                          validator: passwordValidation,
                          decoration: InputDecoration(
                            hintText: " Password",
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(Icons.cancel_outlined),
                              onPressed: () => passwordCtr.clear(),
                            ),
                          ),
                          obscureText: true,
                        ),
                      ),
                    ),

                    //sing-up button
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton(
                            onPressed: () {
                              if (formKey.currentState.validate()) {
                                formKey.currentState.save();
                                formValidationSuccess = true;
                              }

                              if (formValidationSuccess == true) {
                                userSignUp();



                               //
                                 //clearForm();
                              }
                              //
                            },
                            //         onPressed:(){
                            //
                            //       print(fNameCtr.text+"\n"+lNameCtr.text+"\n"+genderSelected+"\n"+birthDateInString+"\n"+nationalityCtr.text+"\n"+mobileNoCtr.text+"\n"+disabilityType+"\n"+emailCtr.text+"\n"+passwordCtr.text+"\n");
                            // },
                            //         onPressed: () {
                            //           ref.add({
                            //             'FirstName': fNameCtr.text,
                            //             'LastName': lNameCtr.text,
                            //             'Gender':genderSelected,
                            //             'DOB':birthDateInString,
                            //             'Nationality':nationalityCtr.text,
                            //             'Phone No':mobileNoCtr.text,
                            //             'Disability Type':disabilityType,
                            //             'Email':emailCtr.text,
                            //             'Password':passwordCtr.text
                            //           }).whenComplete(() => Navigator.pop(context));
                            //         },
                            child: SizedBox(
                              width: 100,
                              height: 50,
                              child: Center(
                                child: Text(
                                  "SignUp",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "I already have an Account",
                          style: TextStyle(color: Colors.green),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.blue.withOpacity(0.7),
                                fontSize: 25),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List gender = ["Male", "Female", "Other"];

  String genderSelected;

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: gender[btnValue],
          groupValue: genderSelected,
          onChanged: (value) {
            setState(() {
              // print(value);
              genderSelected = value;
              print(genderSelected);
            });
          },
        ),
        Text(title)
      ],
    );
  }

  String firstNameValidation(String value) {
    if (value.isEmpty) {
      return 'Please Enter First Name';
    }
  }

  String lastNameValidation(String value) {
    if (value.isEmpty) {
      return 'Please Enter Last Name';
    }
  }

  String genderValidation(String value) {
    if (value.isEmpty) {
      return 'Please Select Gender';
    }
  }

  String dateValidation(String value) {
    if (value.isEmpty) {
      return 'Please Select Date of Birth';
    }
  }

  String nationalityValidation(String value) {
    if (value.isEmpty) {
      return 'Please Enter Your Nationality';
    }
  }

  String phoneNoValidation(String value) {
    if (value.length < 11 || value.isEmpty) {
      return 'In Valid Phone No';
    }
  }

  String emailValidation(String value) {
    if (!value.contains('@gmail.com')) {
      return "Invalid Email address !";
    }
  }

  String passwordValidation(String value) {
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
  }

  void clearForm() {
    fNameCtr.clear();
    lNameCtr.clear();
    nationalityCtr.clear();
    mobileNoCtr.clear();
    emailCtr.clear();
    passwordCtr.clear();
  }


  Future userSignUp() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .where('Email', isEqualTo: emailCtr.text)
        .get()
        .then((value) {
      if (value.docs.length > 0) {
        showDialog(
            barrierColor: Colors.red[100],
            context: context,
            builder: (context) {
              return Container(
                decoration:
                BoxDecoration(border: Border.all(color: Colors.amber[300])),
                child: AlertDialog(
                  title: Text(
                    "Error !",
                    style: TextStyle(color: Colors.red),
                  ),
                  content: Text("Account exists already"),
                  backgroundColor: Colors.grey[300],
                  actions: [
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("ok"))
                  ],
                ),
              );
            });

      } else {

        ref.doc(emailCtr.text.toString()).set({
          'FirstName': fNameCtr.text.toString(),
          'LastName': lNameCtr.text.toString(),
          'Gender': genderSelected,
          'DOB': birthDateInString,
          'Nationality': nationalityCtr.text.toString(),
          'Phone No': mobileNoCtr.text.toString(),
          'Disability Type': disabilityType.toString(),
          'Email': emailCtr.text.toString(),
          'Password': passwordCtr.text.toString()
        }).whenComplete(() => Navigator.push(context, MaterialPageRoute(builder: (_)=> LoginScreen())));

      }
    });
  }
}
