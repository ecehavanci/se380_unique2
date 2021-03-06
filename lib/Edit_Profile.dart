import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:se380_unique/camera.dart';
import 'package:se380_unique/sign.dart';
import 'Notifications.dart';
import 'PetSitterHome.dart';
import 'comment_page.dart';
import 'dart:async';
import 'dart:io';

class Editable extends StatefulWidget {
  var docID;
  final CameraDescription camera;
  final String imagePath;

  Editable({this.docID,Key key,this.camera,this.imagePath}) : super(key: key);

  @override
  _EditableState createState() => _EditableState();
}

class _EditableState extends State<Editable> {
  List<String> myDays = List<String>();
  String myShiftvalue;
  bool pressed = false;
  var choosed;
  String imagePath;
  var fromCam;


  Function mydaysIterate() {
    days_available.forEach((key, value) {
      if (value == true) {
        if (!myDays.contains(key)) {
          myDays.add(key);
        }
        print(myDays.toString());
      } else if (value == false) {
        if (myDays.contains(key)) {
          myDays.remove(key);
        } else
          return;
      }
    });
  }

  final Map<String, bool> days_available = {
    "Monday": false,
    "Tuesday": false,
    "Wednesday": false,
    "Thursday": false,
    "Friday": false,
    "Saturday": false,
    "Sunday": false,
  };

  TextEditingController nameController = new TextEditingController();
  TextEditingController mailController = new TextEditingController();
  TextEditingController surnameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  TextEditingController bioController = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    DocumentReference doc= FirebaseFirestore.instance.collection("PetSitters").doc(widget.docID);


    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Text("Edit Page"),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.blue.shade100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 175,
                      height: 175,
                      color: Colors.amber,
                      margin: EdgeInsets.all(5),
                      child: imagePath==null?Text("You don't have any updated image!"):Container(
                          height: 160,
                          width: 160,
                          child: Image.file(new File(imagePath)))),
                    Positioned(
                      right: 5,
                      bottom: 5,
                      child: Container(
                          height: 45,
                          width: 60,
                          child: IconButton(
                            icon: const Icon(Icons.camera_alt_outlined),
                            color: Colors.blue[100],
                            onPressed: () async {
                              fromCam= await Navigator.of(context)
                                  .push(MaterialPageRoute(
                                  builder: (context) {
                                    return TakePictureScreen(camera: widget.camera);
                                  }));
                             print(fromCam);
                             setState(() {
                               imagePath=fromCam;
                             });
                            },
                          )),
                    )
                  ],
                ),
                Column(
                  children: [
                    buildTextField("Enter Name", "Name", 1, false,nameController),
                    buildTextField("Enter Surname", "Surname", 1, false,surnameController),
                    Container(height: 80,
                        child: buildTextField("Enter Your Biography", "Biography", 1, false,bioController)),
                    buildTextField("Enter e-mail", "Email", 2, false,mailController),
                    buildTextField("Enter new password", "New Password", 0, true,passwordController),
                    buildTextField("Enter new phone", "Phone Number", 3, false,phoneController),
                    buildTextField("Enter new address", "Address", 4, false,addressController),
                    buildTextField("Price Per Hour", "Price Per Hour", 5, false,priceController),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Shifts: "),
                    DropdownButton(
                      value: myShiftvalue,
                      items: [
                        DropdownMenuItem(
                          value: "9.00-12.00",
                          child: Text(
                            "9.00-12.00",
                          ),
                        ),
                        DropdownMenuItem(
                          value: "12.00-15.00",
                          child: Text(
                            "12.00-15.00",
                          ),
                        ),
                        DropdownMenuItem(
                          value: "15.00-18.00",
                          child: Text(
                            "15.00-18.00",
                          ),
                        ),
                        DropdownMenuItem(
                          value: "Anytime",
                          child: Text(
                            "Anytime",
                          ),
                        ),
                      ],
                      onChanged: (newvalue) {
                        setState(() {
                          myShiftvalue = newvalue;
                        });
                      },
                    ),
                    Text("Days Available: "),
                    Column(
                      children: [
                        buildTextButton("Monday"),
                        buildTextButton("Tuesday"),
                        buildTextButton("Wednesday"),
                        buildTextButton("Thursday"),
                        buildTextButton("Friday"),
                        buildTextButton("Saturday"),
                        buildTextButton("Sunday"),
                      ],
                    )
                  ],
                ),
                FloatingActionButton.extended(
                  onPressed: () {


                    Navigator.of(context)
                        .pop<List<String>>([myDays.toString(), myShiftvalue,imagePath]);
                    //inst.add({'shifts':myShiftvalue,'days':myDays});
                    if(nameController.text!=''){
                      doc.update({
                        "name":  nameController.text
                      });
                    }
                    if(surnameController.text!=''){
                    doc.update({
                    "surname":  surnameController.text
                    });
                    }
                    if(mailController.text!=''){
                    doc.update({
                    "email":  mailController.text
                    });
                    }
                    if(passwordController.text!=''){
                    doc.update({
                    "password":  passwordController.text
                    });
                    }
                    if(myShiftvalue!=''){
                    doc.update({
                    "shifts": myShiftvalue
                    });
                    }
                    if(int.tryParse(phoneController.text)==0){
                    doc.update({
                    "phone":  int.tryParse(phoneController.text)
                    });
                    }
                    if(priceController.text!=''){
                    doc.update({
                    "price":  priceController.text
                    });
                    }
                    if(bioController.text!=''){
                    doc.update({
                    "bio":  bioController.text
                    });
                    }
                    if(myDays.toString()!=''){
                    doc.update({
                    "days": myDays
                    });
                    }
                    if(myDays.toString()!=''){
                      doc.update({
                        "photoPath": imagePath
                      });
                    }




                      /*"surname":!(surnameController.text==null)?surnameController.text:{},
                      "email":!(mailController.text==null)?mailController.text:{},
                      "password":!(passwordController.text==null)?passwordController.text:{},
                      'shifts':!(myShiftvalue==null)?myShiftvalue:{},
                      'days':!(myDays==null)?myDays:{},
                      "phone":!(phoneController.text==null)?int.tryParse(phoneController.text):{},
                      "price":!(priceController.text==null)?priceController.text:{},
                      "bio":!(bioController.text==null)?bioController.text:{}});*/

                  },
                  label: const Text('Submit'),
                  icon: const Icon(Icons.thumb_up),
                  backgroundColor: Colors.orange,
                ),
              ],
            ),
          ),
        ),endDrawer: Drawer(
    child: Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue[200],
          ),
          child: Text('Editable'),
        ),
        ListTile(
          leading: Icon(Icons.home_filled),
          title: Text('Home'),
          onTap: () async {
            await Navigator.of(context)
                .push(MaterialPageRoute(
                builder: (context) {
                  return MyHomePage(title: "Pet Sitter Home Page",ID:widget.docID,camera:widget.camera);
                }));
          },
        ),
        ListTile(
          leading: Icon(Icons.stacked_line_chart_outlined),
          title: Text('Ratings'),
          onTap: () async {
            await Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              return Ratings(ID:widget.docID,camera:widget.camera);
            }));
          },
        ),
        ListTile(
          leading: Icon(Icons.edit),
          title: Text('Requests'),
          onTap: () async {
            await Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              return Editable(docID:widget.docID,camera: widget.camera);
            }));
          },
        ),
        ListTile(
          leading: Icon(Icons.comment),
          title: Text('Nofitications'),
          onTap: () async {
            await Navigator.of(context)
                .push(MaterialPageRoute(
                builder: (context) {
                  return NotificationLister(camera:widget.camera);
                }));
          },
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('Exit'),
          onTap: () async {
            await Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              return SignUpChooser(camera:widget.camera);
            }));
          },
        ),

      ],
    ),
    )));

  }
  TextButton buildTextButton(String day) {
    return TextButton(
        onPressed: () {
          setState(() {
            days_available.update(day, (value) => !value);
          });
          mydaysIterate();
        },
        child: Text("$day",
            style: TextStyle(
                color: days_available[day]
                    ? Colors.red
                    : Theme.of(context).accentColor)));
  }

  TextField buildTextField(
      String hint, String label, int iconNo, bool showText,TextEditingController Controller ) {
    List<IconData> _icons = [Icons.vpn_key, Icons.accessibility, Icons.mail,Icons.phone_android,Icons.add_location_sharp,
    Icons.monetization_on_outlined];

    return TextField(
      controller: Controller,
      obscureText: showText,
      decoration: InputDecoration(
          icon: Icon(_icons[iconNo]),
          hintText: hint,
          hintStyle:
          TextStyle(fontWeight: FontWeight.w300, color: Colors.orange),
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always),
    );
  }
}
