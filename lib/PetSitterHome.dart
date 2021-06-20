import 'package:flutter/material.dart';
import 'Edit_Profile.dart';
import 'RequestPage.dart';
import 'comment_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//MyApp seems normal to me
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String userID;
  // This widget is the root of your application.ü
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  MyApp({Key key, this.userID}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Pet Sitter Home Page', ID: userID),
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
  MyHomePage({Key key, this.title, this.ID}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  String days;
  String shifts;
  int requestCounter;
  String name;
  String surname;
  String email;
  String phone;



  void getInfoFromFirebase() async{
    DocumentReference doc= FirebaseFirestore.instance.collection("PetSitters").doc("Sitters");
    DocumentSnapshot docSitters = await doc.get();
    Map<String, dynamic> dataSitters=docSitters.data();

    setState(() {
      name=dataSitters["name"].toString();
      surname=dataSitters["Surname"].toString();
      email=dataSitters["e-mail"].toString();
      phone=dataSitters["phone"].toString();

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
      body:
      Container(
        color: Colors.orange[200],
        child: Container(
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
                    ),
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
                              ),Text(name==null?"Not entered":name,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 17),
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
                              ),Text(surname==null?"Not entered":surname,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 17),
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
                              ),Text(phone==null?"Not entered":phone,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 17),
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
                              ),Text(email==null?"Not entered":email,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 17),
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
                                    fontWeight: FontWeight.normal,
                                    fontSize: 17),
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
                                  "${days == null ? "Please add your available days!" : days.substring(1, days.length - 1)}",
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
                                "Waiting Request: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 20),
                              ),
                              Text(
                                "${requestCounter == null ? "No notifications yet." : requestCounter}",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 17),
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
                                  onPressed: () async {
                                    var counter = await Navigator.of(context)
                                        .push(MaterialPageRoute(
                                        builder: (context) {
                                          return Request();
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
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return Ratings();
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
                              var days = await Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return Editable();
                              }));
                              setState(() {
                                this.days = days[0];
                                shifts = days[1];
                              });
                            },
                            backgroundColor: Colors.blue[200],
                            label: const Text("My Profile"),
                            icon: const Icon(Icons.person),
                          )),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child: FloatingActionButton.extended(
                            onPressed: () {},
                            backgroundColor: Colors.blue[200],
                            label: const Text("Chance Wheel"),
                            icon: const Icon(Icons.celebration),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
