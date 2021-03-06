import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:se380_unique/sign.dart';
import 'Edit_Profile.dart';
import 'Notifications.dart';
import 'RequestPage.dart';
import 'comment_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

//MyApp seems normal to me
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String userID;
  final CameraDescription camera;

  MyApp({Key key, this.userID, this.camera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(userID);
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home:
          MyHomePage(title: 'Pet Sitter Home Page', ID: userID, camera: camera),
    );
    /*return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Pet Sitter Home Page'),
    );*/
  }
}

class MyHomePage extends StatefulWidget {
  final String ID;
  final CameraDescription camera;

  MyHomePage({Key key, this.title, this.ID, this.camera}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String address;
  String days;
  String shifts;
  int requestCounter;
  String name;
  String surname;
  String email;
  int phone;
  var price;
  String bio;
  String imagepath;
  String photoPathFirebase;
  var fromCam;

  //Image imageFile;

  void getInfoFromFirebase() async {
    DocumentReference doc =
        FirebaseFirestore.instance.collection("PetSitters").doc(widget.ID);

    DocumentSnapshot docSitters = await doc.get();
    Map<String, dynamic> dataSitters = docSitters.data();

    setState(() {
      name = dataSitters["name"];
      surname = dataSitters["surname"];
      email = dataSitters["email"];
      phone = dataSitters["phone"];
      address = dataSitters["address"];
      price = dataSitters["price"];
      bio = dataSitters["bio"];
      photoPathFirebase = dataSitters["photoPath"];
    });
  }

  @override
  Widget build(BuildContext context) {
    getInfoFromFirebase();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.orange[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                      width: 175,
                      height: 175,
                      color: Colors.blue[200],
                      margin: EdgeInsets.all(5),
                      child: photoPathFirebase == null
                          ? Text("You don't have any image")
                          : Container(
                              height: 160,
                              width: 160,
                              child: Image.file(File(photoPathFirebase)))),
                  Positioned(
                    right: 3,
                    bottom: 30,
                    child: SizedBox(
                      height: 15,
                      width: 75,
                      child: IconButton(
                        icon: const Icon(Icons.add_a_photo_outlined),
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.of(context).pop<String>(days.toString());
                          setState(() {});
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 450,
                  height: 300,
                  margin: EdgeInsets.all(5),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Name : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              name == null ? "Not entered" : name,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 17),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Surname :",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              surname == null ? "Not entered" : surname,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 17),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "My Biography :",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Expanded(
                              child: Text(
                                bio == null ? "Not entered" : bio,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 17,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Phone Number :",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              phone == 0 ? "Not entered" : phone.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 17),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "E-mail :",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              email == null ? "Not entered" : email,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 17),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Preffered Shifts : ",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              " ${shifts == null ? "Please add your shifts!" : shifts}",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 17),
                            )
                            /*SizedBox(
                              height: 15,
                              width: 75,
                              child: MaterialButton(
                                onPressed: () {
                                },
                                child: Text('EDIT'),
                                color: Color(0xFF8A81FF),
                                shape: StadiumBorder(),
                              ),
                            ),*/
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Days available : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                            Expanded(
                              child: Text(
                                "${days == null ? "Please add your available fromEditable!" : days.substring(1, days.length - 1)}",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 17),
                              ),
                            )
                            /* SizedBox(
                              height: 15,
                              width: 75,
                              child: MaterialButton(
                                onPressed: () {

                                },
                                child: Text('EDIT'),
                                color: Color(0xFF8A81FF),
                                shape: StadiumBorder(),
                              ),
                            )*/
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Price : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              price == null ? "Not entered" : price,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 17),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Waiting Request: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                            Text(
                              "${requestCounter == null ? "No notifications yet." : requestCounter}",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 17),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 150,
                              height: 30,
                              child: FloatingActionButton.extended(
                                heroTag: "btn1",
                                onPressed: () async {
                                  var counter = await Navigator.of(context)
                                      .push(
                                          MaterialPageRoute(builder: (context) {
                                    return Request(
                                        userID: widget.ID,
                                        camera: widget.camera);
                                  }));
                                  setState(() {
                                    this.requestCounter = counter;
                                  });
                                },
                                icon: Icon(Icons.access_alarm_sharp),
                                label: Text("Show Requests"),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: FloatingActionButton.extended(
                      heroTag: "btn2",
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Ratings(ID: widget.ID);
                        }));
                      },
                      backgroundColor: Colors.blue[200],
                      label: const Text("Comments And Ratings"),
                      icon: const Icon(Icons.stacked_line_chart_outlined),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: FloatingActionButton.extended(
                          onPressed: () async {
                            var fromEditable = await Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Editable(
                                  docID: widget.ID, camera: widget.camera);
                            }));
                            setState(() {
                              this.days = fromEditable[0];
                              shifts = fromEditable[1];
                              imagepath = fromEditable[2];
                              //imageFile = Image.file(new File(imagepath));
                            });
                          },
                          backgroundColor: Colors.blue[200],
                          label: const Text("My Profile"),
                          icon: const Icon(Icons.person),
                          heroTag: "btn3",
                        )),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: FloatingActionButton.extended(
                          onPressed: () async {
                            await Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return NotificationLister(camera: widget.camera);
                            }));
                          },
                          backgroundColor: Colors.blue[200],
                          label: const Text("Notifications"),
                          icon: const Icon(Icons.comment),
                          heroTag: "btn4",
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
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
              child: Text('Home Page'),
            ),
            ListTile(
              leading: Icon(Icons.app_settings_alt_sharp),
              title: Text('Requests'),
              onTap: () async {
                await await Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Request(userID: widget.ID, camera: widget.camera);
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.stacked_line_chart_outlined),
              title: Text('Ratings'),
              onTap: () async {
                await Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Ratings(ID: widget.ID, camera: widget.camera);
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Editable'),
              onTap: () async {
                await Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Editable(docID: widget.ID, camera: widget.camera);
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.comment),
              title: Text('Nofitications'),
              onTap: () async {
                await Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return NotificationLister(camera: widget.camera);
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Exit'),
              onTap: () async {
                await Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SignUpChooser(camera: widget.camera);
                }));
              },
            ),
          ],
        ),
      )
// Populate the Drawer in the next step.
          ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection("PetSitters")
      .doc("NLZrkcuuqHgW4HhoRBQ8DEFF9Xc2")
      .collection("comments")
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("My Comments And Ratings"),
      ),
      body: Container(
        color: Colors.white,
        child: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return new ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data();
                return new ListTile(
                  title: new Text(data['comment']),
                  subtitle: new Text(data['star'].toString()),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
