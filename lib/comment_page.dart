import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Ratings extends StatefulWidget {
  const Ratings({Key key}) : super(key: key);

  @override
  _RatingsState createState() => _RatingsState();
}
// ses geliyo mu

class _RatingsState extends State<Ratings> {
  @override
  Widget build(BuildContext context) {
    int price;
    double avg_star = 4;
    var names = [
      "Ayşegül",
      "fatma",
      "ali",
      "veli",
      "Lilly",
      "Bella",
      "Milo",
      "Heidi",
      "Fiona",
      "Layla"
    ];
    var states = [
      "İzmir",
      "Ankara",
      "İstanbul",
      "Manisa",
      "Bursa",
      "Kars",
      "Yalova"
    ];
    var wishes = ["Grooming", "Bathe", "Feeding"];
    String bio =
        "A biography is simply an account of someone’s life written by another person."
        " A biography can be short in the case of few sentences biography, and it can also be"
        " long enough to fill an entire book. ";
    var comments = [
      "Çok güzel  dfsfkdsfkfdgkdfgkdfsdfsdfdsfdsmfnmsdnmmnsdfsdnmfsdnfsdfmsdmnfsdjdfgkdfjgjdfgjkfdkgjd",
      "kesinlikle bir efsane",
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null
    ];
    var stars = [1, 4, 5, 2, 4, 5, 1, 2, 4, 4];

    String SittersComment;
    DocumentReference doc= FirebaseFirestore.instance.collection("PetSitters").doc("Sitters").collection("Comments").doc("Comments");

    void getCommentInfoFromFirebase() async{
      DocumentReference doc= FirebaseFirestore.instance.collection("PetSitters").doc("Sitters").collection("Comments").doc("Comments");
      DocumentSnapshot docSitters = await doc.get();
      Map<String, dynamic> dataSitters=docSitters.data();
      dataSitters["The Comment"];
      dataSitters["comment_star"];



      setState(() {


      });

    }

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
                ),
                StarDisplay(avg_star, 35)
              ],
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Expanded(
                flex: 1,
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
            ),
            Expanded(
                flex: 3,
                child: CommentsList(names: names, stars: stars, comments: comments)),
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

class StarDisplay extends StatelessWidget {
  StarDisplay(this.avg, this.size, {Key key}) : super(key: key);
  final double avg;

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
