import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Request extends StatefulWidget {

   Request({Key key,this.userID}) : super(key: key);
   final String userID;

  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  int counter ;
  QuerySnapshot qsnap;
  var requestcol;
  var _usersStream;


@override
  void initState() {
    // TODO: implement initState
      requestcol=FirebaseFirestore.instance.collection('PetSitters').doc(widget.userID).collection("Request");
     _usersStream = FirebaseFirestore.instance.collection("PetSitters").doc(widget.userID).collection("Request").snapshots();


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
                var ss=snapshot.data.docs.length;

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
                                      counter=ss;
                                      counter = (counter - 1);
                                    });
                                    await FirebaseFirestore.instance.collection('PetSitters').doc(widget.userID).collection("Request").doc(document.id).delete();
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
                                      counter=ss;
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
      )

    );
  }
}
