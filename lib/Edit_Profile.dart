import 'package:flutter/material.dart';
import 'comment_page.dart';
//import 'package:image_picker/image_picker.dart';
//Sıla was here
class Editable extends StatefulWidget {
  Editable({Key key}) : super(key: key);

  @override
  _EditableState createState() => _EditableState();
}

class _EditableState extends State<Editable> {
  List<String> myDays = List<String>();
  String myShiftvalue;
  bool pressed = false;

  var choosed;

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

  @override
  Widget build(BuildContext context) {
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
                    ),
                    Positioned(
                      right: 5,
                      bottom: 5,
                      child: SizedBox(
                          height: 45,
                          width: 60,
                          child: IconButton(
                            icon: const Icon(Icons.camera_alt_outlined),
                            onPressed: () async {
                              setState(() {});
                            },
                          )),
                    )
                  ],
                ),
                Column(
                  children: [
                    buildTextField("Enter Name", "Name", 1, false),
                    buildTextField("Enter Surname", "Surname", 1, false),
                    buildTextField("Enter e-mail", "Email", 2, false),
                    buildTextField(
                        "Enter new password", "New Password", 0, true),
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
                        .pop<List<String>>([myDays.toString(), myShiftvalue]);

                    setState(() {});
                  },
                  label: const Text('Submit'),
                  icon: const Icon(Icons.thumb_up),
                  backgroundColor: Colors.orange,
                ),
              ],
            ),
          ),
        ));
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
      String hint, String label, int iconNo, bool showText) {
    List<IconData> _icons = [Icons.vpn_key, Icons.accessibility, Icons.mail];
    return TextField(
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
