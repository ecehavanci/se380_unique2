import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:io';

class Ratings extends StatefulWidget {
  var ID;

   Ratings({this.ID,Key key}) : super(key: key);

  @override
  _RatingsState createState() => _RatingsState();
}


class _RatingsState extends State<Ratings> {

  double avg_star = 4;
  String bio = "First edit your bio please!";
  String photoPathFirebase;

  void getInfoFromFirebasee() async{
    DocumentReference doc= FirebaseFirestore.instance.collection("PetSitters").doc(widget.ID);

    DocumentSnapshot docSitters = await doc.get();
    Map<String, dynamic> dataSitters=docSitters.data();

    setState(() {
      bio=dataSitters["bio"];
      photoPathFirebase=dataSitters["photoPath"];
    });

  }
  Widget build(BuildContext context) {
    getInfoFromFirebasee();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("My Comments And Ratings"),
      ),
      body: Container(
        color: Colors.orange[100],
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 175,
                  height: 175,
                  color: Colors.amber,
                  margin: EdgeInsets.all(15),
                    child:photoPathFirebase==null?Text("You don't have any image"):Container(
                        height: 160,
                        width: 160,
                        child: Image.file(File(photoPathFirebase)))
                ),
                StarDisplay(avg_star, 35)
              ],
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Container(
                child: Column(
                  children: [
                    Text(bio,
                        style: TextStyle(
                            fontFamily: "Monospace", color: Colors.pink)),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: UserInformation(ID:widget.ID)//CommentsList(names: names, stars: stars, comments: comments)
            ),
            Column(),
            Row(),
          ],
        ),
      ),
    );
  }
}

class CommentsList extends StatelessWidget {
  const CommentsList({
    Key key,
    @required this.names,
    @required this.stars,
    @required this.comments,
  }) : super(key: key);

  final List<String> names;
  final List<int> stars;
  final List<String> comments;

  @override
  Widget build(BuildContext context) {
      return Container(
        color: Colors.yellow.shade100,
        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (BuildContext context, _) =>
          const Divider(
            color: Colors.pink,
            thickness: 3,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        ' ${names[index]}',
                        style: TextStyle(
                            color: Colors.black.withOpacity(1.0)),
                        textScaleFactor: 1.2,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      StarDisplay(stars[index].toDouble(), 5),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                            '${comments[index]}',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8)),
                            textScaleFactor: 1,
                          )),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      );
  }
}

class UserInformation extends StatefulWidget {
  var ID;

  UserInformation({this.ID});

  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  Stream<QuerySnapshot> _usersStream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _usersStream = FirebaseFirestore.instance.collection("PetSitters").doc(widget.ID).collection("Comments").snapshots();
  }

  @override
  Widget build(BuildContext context) {
      return Container(
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
                  return new ListTile(

                    title: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.blue[100],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /*Row(
                              children: [
                                Text(
                                  ' ${names[index]}',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(1.0)),
                                  textScaleFactor: 1.2,
                                ),
                              ],
                            ),*/
                            Row(
                              children: [
                                StarDisplay(data['star'].toDouble(), 5),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Text(
                                      '${data['comment']}',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.8)),
                                      textScaleFactor: 1,
                                    )),
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
      );
  }
}
/*
class UserInformation2222 extends StatefulWidget {
  @override
  _UserInformation2222State createState() => _UserInformation2222State();
}

class _UserInformation2222State extends State<UserInformation2222> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection("PetSitters").doc("NLZrkcuuqHgW4HhoRBQ8DEFF9Xc2").collection("comments").snapshots();
  var data;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  Container(
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

                    return ListView.separated(
                    separatorBuilder: (context, index) => Divider(color: Colors.pink),
                    itemCount: snapshot.data.size,
                    itemBuilder: (BuildContext ctx, int index) {
                       var list = snapshot.data.docs.elementAt(index).get("comment");
                       print(list.toString());

                      /*list=snapshot.data.docs.map((index)=>).toList();"

                      snapshot.data.docs.map((DocumentSnapshot document) {
                         data = document.data();};*/

                        return new ListTile(
                                        title: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                //StarDisplay(list["star"], 5),
                                              ],
                                            ),
                                            Row( //${data['comment']
                                              children: [
                                                Expanded(
                                                    child: Text(
                                                      '${data['comment']}'
                                                      ,
                                                      style: TextStyle(
                                                          color: Colors.black.withOpacity(0.8)),
                                                      textScaleFactor: 1,
                                                    )
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                        );


                    }
                    );

                    }
  )
  );
  }
}
*/
class StarDisplay extends StatelessWidget {
  StarDisplay(this.avg, this.size, {Key key}) : super(key: key);
  final double avg;
//size is always 35!
  final double size;

  final fiveStars = Container(
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.red,
            size: 35,
          ),
          Icon(
            Icons.star,
            color: Colors.red,
            size: 35,
          ),
          Icon(
            Icons.star,
            color: Colors.red,
            size: 35,
          ),
          Icon(
            Icons.star,
            color: Colors.red,
            size: 35,
          ),
          Icon(
            Icons.star,
            color: Colors.red,
            size: 35,
          ),
        ],
      ));
  final fourStars = Container(
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.red,
            size: 35,
          ),
          Icon(
            Icons.star,
            color: Colors.red,
            size: 35,
          ),
          Icon(
            Icons.star,
            color: Colors.red,
            size: 35,
          ),
          Icon(
            Icons.star,
            color: Colors.red,
            size: 35,
          ),
          Icon(
            Icons.star_outline,
            color: Colors.red,
            size: 35,
          ),
        ],
      ));
  final threeStars = Container(
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.red,
            size: 35,
          ),
          Icon(
            Icons.star,
            color: Colors.red,
            size: 35,
          ),
          Icon(
            Icons.star,
            color: Colors.red,
            size: 35,
          ),
          Icon(
            Icons.star_outline,
            color: Colors.red,
            size: 35,
          ),
          Icon(
            Icons.star_outline,
            color: Colors.red,
            size: 35,
          ),
        ],
      ));
  final twoStars = Container(
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.red,
            size: 35,
          ),
          Icon(
            Icons.star,
            color: Colors.red,
            size: 35,
          ),
          Icon(
            Icons.star,
            color: Colors.red,
            size: 35,
          ),
          Icon(
            Icons.star,
            color: Colors.red,
            size: 35,
          ),
          Icon(
            Icons.star_outline,
            color: Colors.red,
            size: 35,
          ),
        ],
      ));

  final oneStar = Container(
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.red,
            size: 35,
          ),
          Icon(
            Icons.star_outline,
            color: Colors.red,
            size: 35,
          ),
          Icon(
            Icons.star_outline,
            color: Colors.red,
            size: 35,
          ),
          Icon(
            Icons.star_outline,
            color: Colors.red,
            size: 35,
          ),
          Icon(
            Icons.star_outline,
            color: Colors.red,
            size: 35,
          ),
        ],
      ));

  final zeroStar = Container(
      child: Row(
        children: [
          Icon(
            Icons.star_outline,
            color: Colors.red,
            size: 35,
          ),
          Icon(
            Icons.star_outline,
            color: Colors.red,
            size: 35,
          ),
          Icon(
            Icons.star_outline,
            color: Colors.red,
            size: 35,
          ),
          Icon(
            Icons.star_outline,
            color: Colors.red,
            size: 35,
          ),
          Icon(
            Icons.star_outline,
            color: Colors.red,
            size: 35,
          ),
        ],
      ));

  displayStars() {
    if (avg < 1)
      return zeroStar;
    else if (avg == 1)
      return oneStar;
    else if (avg > 1 && avg <= 2)
      return twoStars;
    else if (avg > 2 && avg <= 3)
      return threeStars;
    else if (avg > 3 && avg <= 4)
      return fourStars;
    else if (avg > 4 && avg <= 5) return fiveStars;
  }

  @override
  Widget build(BuildContext context) {
    return displayStars();
  }
}
