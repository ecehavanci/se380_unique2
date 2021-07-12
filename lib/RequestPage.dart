import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:se380_unique/sign.dart';

import 'Edit_Profile.dart';
import 'Notifications.dart';
import 'PetSitterHome.dart';
import 'comment_page.dart';

class Request extends StatefulWidget {

   Request({Key key,this.userID, this.camera}) : super(key: key);
   final String userID;
   final CameraDescription camera;

  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  var phone;
  int counter ;
  QuerySnapshot qsnap;
  var requestcol;
  var _usersStream;
  String reqmakerName;
  String reqmakerID;
  var phoneCol;
  var nameSurname;


@override
  Future<void> initState()  {
    // TODO: implement initState
      requestcol=FirebaseFirestore.instance.collection('PetSitters').doc(widget.userID).collection("Request");
      _usersStream = FirebaseFirestore.instance.collection("PetSitters").doc(widget.userID).collection("Request").snapshots();


  //change id

}


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("My Requests"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop<int>(counter);

            setState(() {});
          },
        ),
      ),
      body: Container(
        color: Colors.yellow.shade100,
        padding:EdgeInsets.only(bottom: 5),

        child: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                var ssLength=snapshot.data.docs.length;
                RequestMakergetData(document);

                return new ListTile(
                  title: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.blue[100],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${data['Request Letter']}',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.8)),
                                  textScaleFactor: 1,
                                ),
                              ),
                              SizedBox(
                                width: 90,
                                height: 30,
                                child: FloatingActionButton.extended(
                                  onPressed: () async {
                                    setState(() {
                                      counter=ssLength;
                                      counter = (counter - 1);
                                    });
                                    getData();
                                    await FirebaseFirestore.instance.collection('PetSitters').doc(widget.userID).collection("Request").doc(document.id).delete();
                                    FirebaseFirestore.instance.collection('PetOwners').doc(reqmakerID).collection("pet sitter phone").add(
                                        {"pet sitter phone":phone,"pet sitter full name":nameSurname});
                                    RequestMakergetData(document);

                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) => AlertDialog(
                                        title: const Text('Accept Information'),
                                        content:  Text('Your phone number has been sent to '+reqmakerName),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () => Navigator.pop(context, 'Cancel'),
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () => Navigator.pop(context, 'OK'),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  heroTag: "btnnn",
                                  backgroundColor: Colors.blue[200],
                                  label: const Text("Accept"),
                                  icon: const Icon(Icons.add_box_outlined),
                                ),
                              ),
                              SizedBox(
                                width: 90,
                                height: 30,
                                child: FloatingActionButton.extended(
                                  onPressed: () async {
                                    setState(() {
                                      counter=ssLength;
                                      counter = (counter - 1);
                                    });
                                    await FirebaseFirestore.instance.collection('PetSitters').doc(widget.userID).collection("Request").doc(document.id).delete();
                                  },
                                  heroTag: "btnnn2",
                                  backgroundColor: Colors.red[200],
                                  label: const Text("Decline"),
                                  icon: const Icon(Icons.delete_forever),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
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
          child: Text('Requests'),
        ),
        ListTile(
          leading: Icon(Icons.home_filled),
          title: Text('Home'),
          onTap: () async {
            await Navigator.of(context)
                .push(MaterialPageRoute(
                builder: (context) {
                  return MyHomePage(title: "Pet Sitter Home Page",ID:widget.userID,camera:widget.camera);
                }));
          },
        ),
        ListTile(
          leading: Icon(Icons.stacked_line_chart_outlined),
          title: Text('Ratings'),
          onTap: () async {
            await Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              return Ratings(ID:widget.userID,camera:widget.camera);
            }));
          },
        ),
        ListTile(
          leading: Icon(Icons.edit),
          title: Text('Editable'),
          onTap: () async {
            await Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              return Editable(docID:widget.userID,camera: widget.camera);
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
    )
    )
    );
  }

  Future<void> RequestMakergetData(DocumentSnapshot document) async {
    DocumentReference doc=FirebaseFirestore.instance.collection('PetSitters').doc(widget.userID).collection("Request").doc(document.id);
    DocumentSnapshot docrequest = await doc.get();
    Map<String, dynamic> datarequest=docrequest.data();
    setState(() {

      reqmakerName=datarequest["Request maker's name"];
      reqmakerID=datarequest["Request maker's ID"];

    });
  }
  Future<void> getData() async {
    DocumentReference doc = FirebaseFirestore.instance.collection("PetSitters").doc(widget.userID);
    DocumentSnapshot docSitters = await doc.get();
    Map<String, dynamic> dataSitters = docSitters.data();
    setState(() {
      phone = dataSitters["phone"];
      nameSurname=dataSitters["name"] +" "+ dataSitters["surname"];
      print(nameSurname);
    });
  }



}

