import 'dart:math';

import 'package:camera_platform_interface/src/types/camera_description.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'sign.dart';

import 'camera.dart';

class PetOwnerHomePage extends StatelessWidget {
  final String ID;
  final CameraDescription camera;

  const PetOwnerHomePage({Key key, this.ID,this.camera}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.orangeAccent,
      ),
      home: PetOwner(userID: ID,camera:camera ),
    );
  }
}


final fiveStars = Container(
    child: Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.red,
          size: 20,
        ),
        Icon(
          Icons.star,
          color: Colors.red,
          size: 15,
        ),
        Icon(
          Icons.star,
          color: Colors.red,
          size: 15,
        ),
        Icon(
          Icons.star,
          color: Colors.red,
          size: 15,
        ),
        Icon(
          Icons.star,
          color: Colors.red,
          size: 15,
        ),
      ],
    ));
final fourStars = Container(
    child: Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.red,
          size: 15,
        ),
        Icon(
          Icons.star,
          color: Colors.red,
          size: 15,
        ),
        Icon(
          Icons.star,
          color: Colors.red,
          size: 15,
        ),
        Icon(
          Icons.star,
          color: Colors.red,
          size: 15,
        ),
        Icon(
          Icons.star_outline,
          color: Colors.red,
          size: 15,
        ),
      ],
    ));
final threeStars = Container(
    child: Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.red,
          size: 15,
        ),
        Icon(
          Icons.star,
          color: Colors.red,
          size: 15,
        ),
        Icon(
          Icons.star,
          color: Colors.red,
          size: 15,
        ),
        Icon(
          Icons.star_outline,
          color: Colors.red,
          size: 15,
        ),
        Icon(
          Icons.star_outline,
          color: Colors.red,
          size: 15,
        ),
      ],
    ));
final twoStars = Container(
    child: Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.red,
          size: 15,
        ),
        Icon(
          Icons.star,
          color: Colors.red,
          size: 15,
        ),
        Icon(
          Icons.star_outline,
          color: Colors.red,
          size: 15,
        ),
        Icon(
          Icons.star_outline,
          color: Colors.red,
          size: 15,
        ),
        Icon(
          Icons.star_outline,
          color: Colors.red,
          size: 15,
        ),
      ],
    ));

final oneStar = Container(
    child: Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.red,
          size: 15,
        ),
        Icon(
          Icons.star_outline,
          color: Colors.red,
          size: 15,
        ),
        Icon(
          Icons.star_outline,
          color: Colors.red,
          size: 15,
        ),
        Icon(
          Icons.star_outline,
          color: Colors.red,
          size: 15,
        ),
        Icon(
          Icons.star_outline,
          color: Colors.red,
          size: 15,
        ),
      ],
    ));

final zeroStar = Container(
    child: Row(
      children: [
        Icon(
          Icons.star_outline,
          color: Colors.red,
          size: 15,
        ),
        Icon(
          Icons.star_outline,
          color: Colors.red,
          size: 15,
        ),
        Icon(
          Icons.star_outline,
          color: Colors.red,
          size: 15,
        ),
        Icon(
          Icons.star_outline,
          color: Colors.red,
          size: 15,
        ),
        Icon(
          Icons.star_outline,
          color: Colors.red,
          size: 15,
        ),
      ],
    ));








class UserProfile extends StatefulWidget {
  const UserProfile({Key key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class PetOwner extends StatefulWidget {
  PetOwner({Key key, this.userID,this.camera}) : super(key: key);

  final String userID;
  final CameraDescription camera;


  @override
  _PetOwnerState createState() => _PetOwnerState();
}

class _PetOwnerState extends State<PetOwner> {
  final commentController= TextEditingController();
   String petName;
   int selectedItemIndex=0;

   String title='My Profile';
   Color mainPageAppBar=Color(0xFF761D12);
  Color mainPageBackground=Color(0xFFFFCD74);

  bool isOne=false;
  bool isTwo=false;
  bool isThree=false;
  bool isFour=false;
  bool isFive=false;

   String petOwnerName;
   String petOwnerSurname;
   List <String> breeds;

  var fromCam;
  var imagePath;
  String photoPathFirebase;
  DocumentReference doc;


  void getInfoFromFirebase() async{

    DocumentSnapshot docOwners = await doc.get();
    Map<String, dynamic> dataOwners=docOwners.data();

    setState(() {
      photoPathFirebase=dataOwners["photoPath"];

    });

  }

   void onItemTap(int index) {
     setState(() {
       selectedItemIndex=index;
       if(index==0){
         title='My Profile';
         mainPageBackground=Color(0xFFFFCD74);
         mainPageAppBar= Color(0xFF761D12);
       }
       else if(index==1){
         title='Pet Sitters';
         mainPageBackground=Color(0xFF4CD1E8);
         mainPageAppBar= Color(0xFF135078);
       }
       else {
         title = 'Phone Numbers';
         mainPageBackground=Color(0xFFC197EC);
         mainPageAppBar= Color(0xFF764897);
       }
     });

   }

   int starCount=0;

   @override
  void initState() {
     super.initState();
    setState(() {
      isOne=false;
      isTwo=false;
      isThree=false;
      isFour=false;
      isFive=false;
    });

     doc= FirebaseFirestore.instance.collection("PetOwners").doc(widget.userID);
  }

  @override
  Widget build(BuildContext context) {
    getInfoFromFirebase();
    return Scaffold(
      backgroundColor: this.mainPageBackground,
      appBar: AppBar(
        backgroundColor: this.mainPageAppBar,
        title: Text(this.title),
      ),
      body: selectedItemIndex==0?Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex:4,
              child:Container(
                child: Stack(
                  children: [
                    Container(
                        width: 175,
                        height: 175,
                        color: Colors.cyan[200],
                        margin: EdgeInsets.all(5),
                        child:photoPathFirebase==null?Text("You don't have any image"):Container(
                            height: 160,
                            width: 160,
                            child: Image.file(File(photoPathFirebase)))
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
                          onPressed: () async {
                            fromCam= await Navigator.of(context)
                                .push(MaterialPageRoute(
                                builder: (context) {
                                  return TakePictureScreen(camera: widget.camera);
                                }));
                            setState(() {
                              imagePath=fromCam;
                            });
                            if(imagePath.toString()!=''){
                              doc.update({
                                "photoPath": imagePath
                              });
                            }
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width:300,
                height: 80,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Name: ', style: new TextStyle(fontSize: 25, color: const Color(
                        0xFF550000), fontWeight: FontWeight.bold), ),

                      StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance.collection('PetOwners').doc(widget.userID).snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

                        if (!snapshot.hasData) {
                          return  Text('Loading...' , style: new TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold));
                        }
                        else {
                          return
                            Flexible(
                              child: Text( snapshot.data['name'].toString()+' '+snapshot.data['surname'].toString(), style: new TextStyle(fontSize: 25, color: const Color(
                              0xFF86351C), fontWeight: FontWeight.bold)),
                            );
                        }
                      }
                      )

                      ]
                  ),
                ),
            ), flex: 2,),

            Expanded(
              flex: 2,
              child: SizedBox(
                width:300,
                height: 80,
                child: Row(
                  children: [
                    Text('Address: ', style: new TextStyle(fontSize: 25, color: const Color(
                        0xFF550000), fontWeight: FontWeight.bold), ),

                    StreamBuilder<DocumentSnapshot>(
                        stream: FirebaseFirestore.instance.collection('PetOwners').doc(widget.userID).snapshots(),
                        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

                          if (!snapshot.hasData) {
                            return  Text('Loading...' , style: new TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold));
                          }
                          else {
                            return
                              Flexible(
                                child: Text( snapshot.data['address'].toString(), style: new TextStyle(fontSize: 25, color: const Color(
                                    0xFF86351C), fontWeight: FontWeight.bold)),
                              );
                          }
                        }
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                  width:300,
                  height: 80,
                  child: Row(
                      children: [
                        Text('Pets: ',style: new TextStyle(fontSize: 25, color: const Color(0xFF550000),fontWeight: FontWeight.bold ),),
                        Flexible(
                          child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance.collection('PetOwners').doc(widget.userID).collection('Pets').snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (!snapshot.hasData) {
                                return  Text('Loading...' , textAlign:TextAlign.start,style: new TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold));
                              }
                              else {
                                return  Text(snapshot.data.docs.map((doc) =>doc['Name']).toList().join(", ").toString(), style: new TextStyle(fontSize: 25, color: const Color(
                                    0xFF86351C), fontWeight: FontWeight.bold));
                              }
                            }
                          ),
                        ),
                        SizedBox(
                          width:80,
                          height: 15,
                          child: Container(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xFF8A81FF),
                                onPrimary: const Color(0xFF4933A0),
                              ),
                              onPressed: () { Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context){
                                    return ListingPetsUI(ID: widget.userID,petName: this.petName, petNameCarrier: (name){setState(() {
                                      petName=name;
                                    });} ,);
                                  }
                              )); },
                              child: Text('edit'),
                            ),
                          ),
                        ),
                  ])
              ), flex: 2,
            ),
          ],
        ),
      )
          : selectedItemIndex==1?
      Container(
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('PetSitters').snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> petSitterSnapshot){
                if(!petSitterSnapshot.hasData){
                  return Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator()
                  );
                }
                return Directionality(
                  textDirection: TextDirection.ltr,
                  child: ListView(
                      padding: const EdgeInsets.all(8),
                      children: petSitterSnapshot.data.docs.map((petSitterDoc) => TextButton(
                          onPressed: (){print('hello');},
                          child: Container(
                            color: Colors.blueAccent,
                            child: Row(
                                children: [
                                  SizedBox(
                                    width: 240,
                                    child: petSitterDoc.exists? ListTile(
                                        title: Text(petSitterDoc['name']+' '+petSitterDoc['surname'], style: TextStyle(color: Colors.white)),
                                        subtitle: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            if(petSitterDoc['bio'] != null)Text( 'Bio: ' + petSitterDoc['bio'], style: TextStyle(color: Colors.white70) ),

                                            if(petSitterDoc['address'] != null)Text('Address: '+petSitterDoc['address'], style: TextStyle(color: Colors.white70)),

                                            if(petSitterSnapshot.data.docs.contains('shifts'))if(petSitterDoc['shifts'] != null)Text( 'Shifts: ' + petSitterDoc['shifts'].toString(), style: TextStyle(color: Colors.white70)),

                                            if(petSitterDoc['days'] != null)Text( 'Available Days: ' + petSitterDoc['days'].join(", ").toString(), style: TextStyle(color: Colors.white70)),

                                            if(petSitterDoc['price'] != null)Text( 'Price: ' + petSitterDoc['price'].toString(), style: TextStyle(color: Colors.white70)),
                                          ],
                                        )
                                    ): Container(),
                                  ),
                                  SizedBox(
                                    width: 80,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.indigo
                                      ),
                                      child:Text('Details'),
                                      onPressed: (){
                                        showDialog(barrierDismissible: true,context: context, builder: (context){
                                        return StatefulBuilder(
                                          builder: (context, setState) {
                                            return AlertDialog(
                                              backgroundColor: Colors.amber[200],
                                              content: SingleChildScrollView(
                                                child: Container(
                                                  height: 450,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [Text(petSitterDoc['name']+' '+petSitterDoc['surname'], style : TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                                      Text('Living Area: '+petSitterDoc['address'],   ),

                                                      StreamBuilder<QuerySnapshot>(
                                                          stream: FirebaseFirestore.instance.collection('PetSitters').doc(petSitterDoc.id).collection('Comments').snapshots(),
                                                          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> commentsSnapshot){

                                                            if(!commentsSnapshot.hasData){
                                                              return Container(
                                                                  alignment: Alignment.center,
                                                                  child: CircularProgressIndicator()
                                                              );
                                                            }
                                                            if(commentsSnapshot.data.docs.length>0){
                                                                return Directionality(
                                                                  textDirection: TextDirection.ltr,
                                                                  child: Container(
                                                                    height: 300,
                                                                    width: 200,
                                                                      child: ListView(children: commentsSnapshot.data.docs.map((doc) =>
                                                                          Card(
                                                                            color: Colors.yellow[100],
                                                                            child: ListTile(
                                                                              title: Text(doc['comment maker\'s name']),
                                                                              subtitle: Column(
                                                                                  children: [
                                                                                    doc['star']==1?oneStar
                                                                                        :
                                                                                    doc['star']==2?twoStars
                                                                                        :
                                                                                    doc['star']==3?threeStars
                                                                                        :
                                                                                    doc['star']==4?fourStars
                                                                                        :
                                                                                    doc['star']==5?fiveStars
                                                                                        :
                                                                                    zeroStar,
                                                                                    Text(doc['comment'])
                                                                                  ]),
                                                                            ),

                                                                          )
                                                                      ).toList()
                                                                  ),
                                                                ));
                                                            }
                                                            return Text('There is no comment for that pet sitter. Be the first one to comment.');
                                                            }),
                                                      Container(
                                                        alignment: Alignment.center,
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                width: 25,
                                                                child: IconButton(
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      starCount=1;
                                                                      isOne=true;
                                                                      isTwo=false;
                                                                      isThree=false;
                                                                      isFour=false;
                                                                      isFive=false;
                                                                    });
                                                                  },
                                                                  icon: Icon(
                                                                    isOne?Icons.star:Icons.star_outline,
                                                                    color: Colors.red,
                                                                    size: 20,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 25,
                                                                child: IconButton(
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      starCount=2;
                                                                      isOne=true;
                                                                      isTwo=true;
                                                                      isThree=false;
                                                                      isFour=false;
                                                                      isFive=false;
                                                                    });
                                                                  },
                                                                  icon:  Icon(
                                                                    isOne&&isTwo?Icons.star: Icons.star_outline,
                                                                    color: Colors.red,
                                                                    size: 20,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 25,
                                                                child: IconButton(
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      starCount=3;
                                                                      isOne=true;
                                                                      isTwo=true;
                                                                      isThree=true;
                                                                      isFour=false;
                                                                      isFive=false;
                                                                    });
                                                                  },
                                                                  icon:  Icon(
                                                                    isOne&&isTwo&&isThree?Icons.star:Icons.star_outline,
                                                                    color: Colors.red,
                                                                    size: 20,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 25,
                                                                child: IconButton(
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      starCount=4;
                                                                      isOne=true;
                                                                      isTwo=true;
                                                                      isThree=true;
                                                                      isFour=true;
                                                                      isFive=false;
                                                                    });
                                                                  },
                                                                  icon:   Icon(
                                                                    isOne&&isTwo&&isThree&&isFour?Icons.star:Icons.star_outline,
                                                                    color: Colors.red,
                                                                    size: 20,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 25,
                                                                child: IconButton(
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      starCount=5;
                                                                      isOne=true;
                                                                      isTwo=true;
                                                                      isThree=true;
                                                                      isFour=true;
                                                                      isFive=true;
                                                                    });
                                                                  },
                                                                  icon:  Icon(
                                                                    isOne&&isTwo&&isThree&&isFour&&isFive?Icons.star:Icons.star_outline,
                                                                    color: Colors.red,
                                                                    size: 20,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          )),


                                                            Row(
                                                              children: [Container(
                                                                height: 50,
                                                                width: 150,
                                                                child: Form(
                                                                  child: TextField(
                                                                    maxLines: null,
                                                                      controller: commentController,
                                                                      style: TextStyle(fontSize: 14),
                                                                      decoration: InputDecoration(
                                                                          hintText: 'Enter your comment here'
                                                                      )
                                                                  )
                                                                ),
                                                              ),
                                                                Container(
                                                                  alignment: Alignment.centerLeft,
                                                                    height: 35,
                                                                    width: 60,
                                                                    child: ElevatedButton(onPressed: () async{
                                                                      var petOwnerDoc= FirebaseFirestore.instance.collection('PetOwners').doc(widget.userID);
                                                                      DocumentSnapshot snap = await petOwnerDoc.get();
                                                                      Map<String, dynamic> petOwnerData = snap.data();
                                                                      print('elevated button pressed');
                                                                      FirebaseFirestore.instance.collection('PetSitters').doc(petSitterDoc.id).collection('Comments').add({
                                                                        'comment' : commentController.text.toString(),
                                                                        'comment maker\'s name' : petOwnerData['name']+' '+ petOwnerData['surname'],
                                                                        'star': this.starCount,
                                                                      }
                                                                      );
                                                                    }, child: Icon(Icons.check, ))
                                                                ),
                                                              ]
                                                            ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              actions: [TextButton(onPressed: () async{
                                              var petOwnerDoc= FirebaseFirestore.instance.collection('PetOwners').doc(widget.userID);
                                              DocumentSnapshot snap = await petOwnerDoc.get();


                                              showDialog(barrierDismissible: true,context: context, builder: (context){
                                                return AlertDialog(
                                                  content: Text('For which pet would you like to hire?'),
                                                  actions: [StreamBuilder<QuerySnapshot>(
                                                      stream: FirebaseFirestore.instance.collection('PetOwners').doc(widget.userID).collection('Pets').snapshots(),
                                                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> petSnap) {
                                                        if (!petSnap.hasData) {
                                                          return  Text('Loading...' , style: new TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold));
                                                        }
                                                        else {
                                                          return  Directionality(
                                                              textDirection: TextDirection.ltr,
                                                              child: Container(
                                                                alignment: Alignment.center,
                                                                height: 40,
                                                                width: 300,
                                                                child: ListView(

                                                                    scrollDirection:Axis.horizontal,
                                                                    shrinkWrap: true,
                                                                    children: petSnap.data.docs.map((petDoc) =>
                                                                        TextButton(onPressed: () { Map<String, dynamic> petOwnerData = snap.data();
                                                                        var col = FirebaseFirestore.instance.collection('PetSitters').doc(petSitterDoc.id).collection('Request');
                                                                        print(petSitterDoc.id);
                                                                        col.add(
                                                                            {'Request maker\'s name': petOwnerData['name'].toString()+' '+petOwnerData['surname'].toString(),
                                                                              'Request maker\'s ID': widget.userID,
                                                                              'Request Letter':petOwnerData['name'].toString()+ ' ' + petOwnerData['surname'].toString()+' would like to hire you for '+ petDoc['Name'].toString()+ '.\n'
                                                                                'It is a '+petDoc['Breed'].toString()+' and lives in '+petDoc['Living Area'].toString()+ '. Do you accept?'});
                                                                        Navigator.pop(context);
                                                                        },
                                                                          child: Text(petDoc['Name']),)).toList()
                                                                ),
                                                              )
                                                          );

                                                        }})],
                                                );
                                              }
                                              );


                                            }, child: Text('Hire'))],
                                            );
                                          }
                                        );
                                      }
                                      );
                                      }
                                    ),
                                  )
                                ]
                            ),
                          )
                      )).toList()
                  ),
                );
              }
          )
      ),
      ):


      Directionality(
        textDirection: TextDirection.ltr,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('PetOwners').doc(widget.userID).collection('pet sitter phone').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> phoneSnap) {
            return!phoneSnap.hasData?
               Container(child: CircularProgressIndicator(), alignment: Alignment.topCenter)
                :
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: ListView(
                    children: phoneSnap.data.docs.map((doc) =>  Card(
                      color:Color(0xFFFFC26A),
                      child: ListTile(
                        title: Text(doc['pet sitter full name']),
                        subtitle: Text('phone: '+doc['pet sitter phone'].toString()),
                      )
                  )).toList())
                );
          },
        )
      )
      ,




      bottomNavigationBar: BottomNavigationBar(
        onTap: onItemTap,
        currentIndex: selectedItemIndex,
        selectedItemColor: selectedItemIndex==0?Color(0xFFF37FA0):selectedItemIndex==1?Colors.blue:selectedItemIndex==2?Color(0xFFB096FF):Colors.white,
        selectedIconTheme: selectedItemIndex==0?IconThemeData(color: Color(0xFFF37FA0)):selectedItemIndex==1?IconThemeData(color: Colors.blue):selectedItemIndex==2?IconThemeData(color: Color(0xFFB096FF)):IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFFABFFEC),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded, size:40),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.youtube_searched_for_sharp, size:40),
            label: 'Look For Pet Sitters',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books, size: 40),
            label: 'Phone Book',
          ),
        ],
      ),
      drawer: Drawer(
        child: Scaffold(
          backgroundColor: Color(0xFFFFC869),
            body: ListView(
              children: [
                Container(
                  height: 70,
                  child: DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                      ),
                    child: Text('MENU', textAlign: TextAlign.center, style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Color(
                        0xFF571B00)),),
                  ),
                ),

                Card(
                  color: Color(0xFFFFEBBA),
                  child: ListTile(
                    title: Text('Edit Profile', style: TextStyle(fontSize: 20, color: Color(
                        0xFF4E2811))),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context)
                          {
                            return EditProfile(petOwnerID: widget.userID);
                          }
                      ));
                    },
                  ),
                ),

                Card(
                  color: Color(0xFFFFEBBA),
                  child: ListTile(
                    title: Text('Sign out', style: TextStyle(fontSize: 20, color: Color(
                        0xFF4E2811))),
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context)
                          {
                            return SignUpChooser();
                          }
                      ));
                    },
                  ),
                )
              ],
            )
        ),
      ),
    );
  }


}

class Pet extends StatefulWidget {
  const Pet({Key key, this.ID}) : super(key: key);
   final String ID;
  @override
  _PetState createState() => _PetState();
}

class _PetState extends State<Pet> {
  String name;
  int age;
  String species;
  String breed;
  String livingArea;
  String careRoutine;

  String batheText ='';
  String combText= '';
  String feedText= '';
  String walkText = '';

  bool isBatheChecked=false;
  bool isCombChecked=false;
  bool isFeedChecked=false;
  bool isTakeForAWalkChecked=false;

  final nameController=TextEditingController();
  final ageController=TextEditingController();
  final speciesController= TextEditingController();
  final breedController=TextEditingController();
  final livingAreaController=TextEditingController();


  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFF30C0FF),
      appBar: AppBar(title: Text('Add new pet'), backgroundColor: Colors.indigo,),
      body:Directionality(
              textDirection: TextDirection.ltr,
              child: ListView(
                children: [
                  Container(
                    alignment:Alignment.topLeft,
                    child: Text('Name: ', style: TextStyle(fontSize: 30, color: const Color(
                        0xFF002865), fontWeight: FontWeight.bold,),),
                  ),
                  Form(

                      child: TextField(
                        controller: nameController,
                        style: TextStyle(fontSize: 25),
                        decoration: InputDecoration(
                          hintText: 'Please enter the name of your pet'
                        )
                      )
                  ),

                  Container(
                    alignment:Alignment.topLeft,
                    child: Text('Age: ', style: TextStyle(fontSize: 30, color: const Color(
                        0xFF002865), fontWeight: FontWeight.bold,),),
                  ),
                  Form(

                      child: TextField(
                        keyboardType: TextInputType.number,
                          controller: ageController,
                          style: TextStyle(fontSize: 25),
                          decoration: InputDecoration(
                              hintText: 'Please enter the age of your pet'
                          )
                      )
                  ),

                  Container(
                    alignment:Alignment.topLeft,
                    child: Text('Species: ', style: TextStyle(fontSize: 30, color: const Color(
                        0xFF002865), fontWeight: FontWeight.bold,),),
                  ),
                  Form(

                      child: TextField(
                          controller: speciesController,
                          style: TextStyle(fontSize: 25),
                          decoration: InputDecoration(
                              hintText: 'e. g. cat, dog'
                          )
                      )
                  ),

                  Container(
                    alignment:Alignment.topLeft,
                    child: Text('Breed: ', style: TextStyle(fontSize: 30, color: const Color(
                        0xFF002865), fontWeight: FontWeight.bold,),),
                  ),
                  Form(

                      child: TextField(
                          controller: breedController,
                          style: TextStyle(fontSize: 25),
                          decoration: InputDecoration(
                              hintText: 'i. e. bulldog, cooker'
                          )
                      )
                  ),

                  Container(
                    alignment:Alignment.topLeft,
                    child: Text('Living Area: ', style: TextStyle(fontSize: 30, color: const Color(
                        0xFF002865), fontWeight: FontWeight.bold,),),
                  ),
                  Form(

                      child: TextField(
                          keyboardType: TextInputType.streetAddress,
                          controller: livingAreaController,
                          style: TextStyle(fontSize: 25),
                          decoration: InputDecoration(
                              hintText: 'e. g. Stratford, London, England'
                          )
                      )
                  ),

                  Container(
                    alignment:Alignment.topLeft,
                    child: Text('Care Routine: ', style: TextStyle(fontSize: 30, color: const Color(
                        0xFF002865), fontWeight: FontWeight.bold,),),
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: CheckboxListTile(
                          activeColor:const Color(0xFF38329C),
                          checkColor: const Color(0xFFBAB7E5),
                          title: Text('Comb', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: this.isCombChecked?const Color(0xFF38329C):const Color(
                              0xFF465480)),),
                          value: this.isCombChecked,
                          onChanged: (bool value) { setState(() {
                            isCombChecked = value;

                            if (this.isCombChecked) {
                              combText = 'Comb  ';
                            }
                            else
                              combText = '';

                            careRoutine= batheText+combText+feedText+ walkText;
                          });},
                          selected: this.isCombChecked,
                        ),
                      ),

                      Expanded(
                        child: CheckboxListTile(
                          activeColor:const Color(0xFF38329C),
                          checkColor: const Color(0xFFBAB7E5),
                          title: Text('Bathe', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: this.isBatheChecked?const Color(0xFF38329C):const Color(
                              0xFF465480)),),
                          value: this.isBatheChecked,
                          onChanged: (bool value) { setState(() {
                            isBatheChecked = value;

                            if (this.isBatheChecked) {
                              batheText = 'Bathe  ';
                            }
                            else
                              batheText = '';

                            careRoutine= batheText+combText+feedText+ walkText;
                          });},
                          selected: this.isBatheChecked,
                        ),
                      ),


                    ]
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: CheckboxListTile(
                          activeColor:const Color(0xFF38329C),
                          checkColor: const Color(0xFFBAB7E5),
                          title: Text('Feed', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: this.isFeedChecked?const Color(0xFF38329C):const Color(
                              0xFF465480)),),
                          value: this.isFeedChecked,
                          onChanged: (bool value) { setState(() {
                            isFeedChecked = value;

                            if (this.isFeedChecked) {
                              feedText = 'Feed  ';
                            }

                            else
                              feedText = '';

                            careRoutine= batheText+combText+feedText+ walkText;
                          });},
                          selected: this.isFeedChecked,
                        ),
                      ),
                      Expanded(
                      child: CheckboxListTile(
                        activeColor:const Color(0xFF38329C),
                        checkColor: const Color(0xFFBAB7E5),
                        title: Text('Take for a walk', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: this.isTakeForAWalkChecked?const Color(0xFF38329C):const Color(
                            0xFF465480)),),
                        value: this.isTakeForAWalkChecked,
                        onChanged: (bool value) { setState(() {
                          isTakeForAWalkChecked = value;

                          if (this.isTakeForAWalkChecked) {
                            walkText = 'Take for a walk  ';
                          }
                          else
                            walkText = '';

                          careRoutine= batheText+combText+feedText+ walkText;
                        });},
                        selected: this.isTakeForAWalkChecked,
                      ),
                    ),
                    ]
                  ),
                  Text(this.careRoutine==null?'undefined ': careRoutine, textAlign: TextAlign.center, style: TextStyle(fontSize: 20,color: const Color(
                      0xFF002865), fontWeight: FontWeight.bold), ),
                ],
              ),
            ),


      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        child: Icon(Icons.check),
        onPressed: (){
          setState(() {
            name=nameController.text;
            age=int.tryParse(ageController.text);
            species=speciesController.text;
            breed=breedController.text;
            livingArea=livingAreaController.text;
          });

          var pets = FirebaseFirestore.instance.collection('PetOwners').doc(widget.ID).collection('Pets');
          pets.add({
            'Name': this.name,
            'Age': this.age,
            'Species': this.species,
            'Breed': this.breed,
            'Living Area':this.livingArea,
            'Care Routine': this.careRoutine.toString()
          });

            showDialog(barrierDismissible: false,context: context, builder: (context){
              return AlertDialog(
                content: Text('Successfully created '+name),
                actions: [TextButton(onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context)
                  {
                    return PetOwnerHomePage(ID: widget.ID);
                  }
                  ));
                  //Navigator.of(context).pop<String>(name.toString());

                  } , child: Text('Okay'))],
              );
            }
            );
            }
            )
    );
    }

  }

  class ListingPetsUI extends StatelessWidget {
    const ListingPetsUI({Key key, this.petNameCarrier(String name), this.petName, this.ID}) : super(key: key);

    final Function petNameCarrier;
  final String petName;
  final String ID;

    @override
    Widget build(BuildContext context){
      return Scaffold(
        backgroundColor: const Color(0xFF00DEFF),
        appBar: AppBar(title: Text('Pets'), backgroundColor: Colors.blueAccent,),
        body: Container(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('PetOwners').doc(
              ID).collection('Pets').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(!snapshot.hasData){
                return Container(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),), alignment: Alignment.topCenter,);
              }
              else {
                return ListView(
                    padding: const EdgeInsets.all(10),
                    children: snapshot.data.docs.map((doc) =>
                        !snapshot.hasError?
                    Card(
                      color: Color(0xFFC8F7FF),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 250,
                            child: ListTile(
                              title: Text(doc['Name']),
                              subtitle: Text(
                                  'Age: ' + doc['Age'].toString()
                                      + '\n' +
                                      'Species: ' + doc['Species']
                                      + '\n' +
                                      'Breed: ' + doc['Breed']
                                      + '\n' +
                                      'Living Area: ' + doc['Living Area']
                                      + '\n' +
                                      'Care Routine: ' + doc['Care Routine'])
                        ),
                          ),
                          Container(
                            alignment: Alignment.center,
                              child:
                              Column(
                                children:[
                                  ElevatedButton(
                                  style: ElevatedButton.styleFrom(primary: Color(
                                      0xFFFFFFFF)),
                                  onPressed: () {  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context){
                                    return EditPet(petOwnerID: ID, petID: doc.id);}
                                  ));},
                                  child: Text('Edit', style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold,fontSize: 17), ),
                                ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.red),
                                    onPressed: () {
                                      var document = FirebaseFirestore.instance.collection('PetOwners').doc(
                                        ID).collection('Pets').doc(doc.id);
                                    showDialog(barrierDismissible: true,context: context, builder: (context){
                                      return AlertDialog(
                                        content: Text('Are you sure you want to delete '+doc['Name'] + '?'),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                document.delete();
                                                Navigator.pop(context);
                                                } ,
                                              child: Text('Yes'),
                                          ),

                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            } ,
                                            child: Text('No'),
                                          ),
                                        ],
                                      );
                                    }
                                    );
                                    },
                                    child: Icon(Icons.delete_rounded)//, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 17), ),
                                  ),
                                ]
                              ),
                            ),
                        ]
                      ),
                    ):
                    Text('Press + to add a pet')).toList()
                );
              }
            }
        )
          )
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigo,
            child: Icon(Icons.add,),
            onPressed: () async{
              final result = await Navigator.of(context).push(MaterialPageRoute(
                builder: (context){
                  return Pet(ID: ID);
                }
            ));
              petNameCarrier (result.toString());
              },
      ),
      );
    }
}

class EditPet extends StatefulWidget {
  EditPet({Key key, this.petOwnerID, this.petID}) : super(key: key);

  final String petOwnerID;
  final String petID;

  @override
  _EditPetState createState() => _EditPetState();
}

class _EditPetState extends State<EditPet> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final speciesController = TextEditingController();
  final breedController = TextEditingController();
  final livingAreaController = TextEditingController();

  String name;
  int age=0;
  String species;
  String breed;
  String livingArea;

  String careRoutine='';

  bool isFeedChecked = false;
  bool isCombChecked = false;
  bool isBatheChecked = false;
  bool isTakeForAWalkChecked = false;

  String feedText = '';
  String combText = '';
  String batheText = '';
  String walkText = '';



  AsyncSnapshot<DocumentSnapshot> snapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Pet'), backgroundColor: Colors.deepPurple[300],),
      backgroundColor: Color(0xFFCFC4FF),
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance.collection('PetOwners').doc(widget.petOwnerID).collection('Pets').doc(widget.petID).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
          return  Text('Loading...' , style: new TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold));
          }
          else {
          return  Directionality(
            textDirection: TextDirection.ltr,
            child: ListView(
                children: [
                  Container(
                    alignment:Alignment.topLeft,
                    child: Text('Name: ', style: TextStyle(fontSize: 30, color: Colors.deepPurple, fontWeight: FontWeight.bold,),),
                  ),
                  Form(

                      child: TextField(
                          controller: nameController,
                          style: TextStyle(fontSize: 25),
                          decoration: InputDecoration(
                              hintText: snapshot.data['Name']
                          )
                      )
                  ),

                  Container(
                    alignment:Alignment.topLeft,
                    child: Text('Age ', style: TextStyle(fontSize: 30, color: Colors.deepPurple, fontWeight: FontWeight.bold,),),
                  ),
                  Form(

                      child: TextField(
                          controller: ageController,
                          style: TextStyle(fontSize: 25),
                          decoration: InputDecoration(
                            //helperText: 'Helper',
                            // labelText: 'Label',
                              hintText: snapshot.data['Age'].toString()
                          )
                      )
                  ),

                  Container(
                    alignment:Alignment.topLeft,
                    child: Text('Species: ', style: TextStyle(fontSize: 30, color: Colors.deepPurple, fontWeight: FontWeight.bold,),),
                  ),
                  Form(

                      child: TextField(
                          controller: speciesController,
                          style: TextStyle(fontSize: 25),
                          decoration: InputDecoration(
                            //helperText: 'Helper',
                            // labelText: 'Label',
                              hintText: snapshot.data['Species']
                          )
                      )
                  ),

                  Container(
                    alignment:Alignment.topLeft,
                    child: Text('Breed: ', style: TextStyle(fontSize: 30, color: Colors.deepPurple, fontWeight: FontWeight.bold,),),
                  ),
                  Form(

                      child: TextField(
                          controller: breedController,
                          style: TextStyle(fontSize: 25),
                          decoration: InputDecoration(
                            //helperText: 'Helper',
                            // labelText: 'Label',
                              hintText: snapshot.data['Breed']
                          )
                      )
                  ),

                  Container(
                    alignment:Alignment.topLeft,
                    child: Text('Living Area: ', style: TextStyle(fontSize: 30, color: Colors.deepPurple, fontWeight: FontWeight.bold,),),
                  ),
                  Form(

                      child: TextField(
                          controller: livingAreaController,
                          style: TextStyle(fontSize: 25),
                          decoration: InputDecoration(
                            //helperText: 'Helper',
                            // labelText: 'Label',
                              hintText: snapshot.data['Living Area']
                          )
                      )
                  ),

                  Container(
                    alignment:Alignment.topLeft,
                    child: Text('Care Routine: ', style: TextStyle(fontSize: 30, color: Colors.deepPurple, fontWeight: FontWeight.bold,),),
                  ),

                  Row(
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            activeColor:const Color(0xFF38329C),
                            checkColor: const Color(0xFFBAB7E5),
                            title: Text('Comb', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: this.isCombChecked?const Color(0xFF38329C):const Color(
                                0xFF465480)),),
                            value: this.isCombChecked,
                            onChanged: (bool value) { setState(() {
                              isCombChecked = value;

                              if (this.isCombChecked) {
                                combText = 'Comb ';
                              }
                              else
                                combText = '';

                              careRoutine= batheText+combText+feedText+ walkText;
                            });},
                            selected: this.isCombChecked,
                          ),
                        ),

                        Expanded(
                          child: CheckboxListTile(
                            activeColor:const Color(0xFF38329C),
                            checkColor: const Color(0xFFBAB7E5),
                            title: Text('Bathe', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: this.isBatheChecked?const Color(0xFF38329C):const Color(
                                0xFF465480)),),
                            value: this.isBatheChecked,
                            onChanged: (bool value) { setState(() {
                              isBatheChecked = value;

                              if (this.isBatheChecked) {
                                batheText = 'Bathe ';
                              }
                              else
                                batheText = '';

                              careRoutine= batheText+combText+feedText+ walkText;
                            });},
                            selected: this.isBatheChecked,
                          ),
                        ),


                      ]
                  ),

                  Row(
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            activeColor:const Color(0xFF38329C),
                            checkColor: const Color(0xFFBAB7E5),
                            title: Text('Feed', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: this.isFeedChecked?const Color(0xFF38329C):const Color(
                                0xFF465480)),),
                            value: this.isFeedChecked,
                            onChanged: (bool value) { setState(() {
                              isFeedChecked = value;

                              if (this.isFeedChecked) {
                                feedText = 'Feed ';
                              }

                              else
                                feedText = '';

                              careRoutine= batheText+combText+feedText+ walkText;
                            });},
                            selected: this.isFeedChecked,
                          ),
                        ),
                        Expanded(
                          child: CheckboxListTile(
                            activeColor:const Color(0xFF38329C),
                            checkColor: const Color(0xFFBAB7E5),
                            title: Text('Take for a walk', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: this.isTakeForAWalkChecked?const Color(0xFF38329C):const Color(
                                0xFF465480)),),
                            value: this.isTakeForAWalkChecked,
                            onChanged: (bool value) { setState(() {
                              isTakeForAWalkChecked = value;

                              if (this.isTakeForAWalkChecked) {
                                walkText = 'Take for a walk ';
                              }
                              else
                                walkText = '';

                              careRoutine= batheText+combText+feedText+ walkText;
                            });},
                            selected: this.isTakeForAWalkChecked,
                          ),
                        ),
                      ]
                  ),
                  Text(this.careRoutine==null?'undefined ': careRoutine, textAlign: TextAlign.center, style: TextStyle(fontSize: 20,color: const Color(
                      0xFF002865), fontWeight: FontWeight.bold), ),

                ]
            ),
          );

          }
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
          onPressed: () {
        setState(() {
          name=nameController.text;
          age=int.tryParse(ageController.text);
          species=speciesController.text;
          breed=breedController.text;
          livingArea=livingAreaController.text;
        });
        var pet = FirebaseFirestore.instance.collection('PetOwners').doc(widget.petOwnerID).collection('Pets').doc(widget.petID);
        if(name!=''){
          pet.update(
              {'Name':nameController.text});
        }
        if(age!=null){
          pet.update({'Age':int.tryParse(ageController.text)});
        }
        if(species!=''){
          pet.update({'Species':speciesController.text});
        }
        if(breed!=''){
          pet.update({'Breed':breedController.text});
        }
        if(livingArea!=''){
          pet.update({'Living Area':livingAreaController.text});
        }
        if(careRoutine!=''){
          pet.update({'Care Routine':careRoutine.toString()});
        }
        Navigator.pop(context);
      },child: Icon(Icons.check)),
    );
  }
}


class EditProfile extends StatefulWidget {
  EditProfile({Key key, this.petOwnerID}) : super(key: key);

  final String petOwnerID;

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final addressController = TextEditingController();

  String name;
  String surname;
  String address;

  String careRoutine='';

  AsyncSnapshot<DocumentSnapshot> snapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile'), backgroundColor: Color(
          0xFFBD8E2F),),
      backgroundColor: Color(0xFFFFE174),
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance.collection('PetOwners').doc(widget.petOwnerID).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (!snapshot.hasData) {
              return  Text('Loading...' , style: new TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold));
            }
            else {
              return  Directionality(
                textDirection: TextDirection.ltr,
                child: ListView(
                    children: [
                      Container(
                        alignment:Alignment.topLeft,
                        child: Text('Name: ', style: TextStyle(fontSize: 30, color: Color(
                            0xFF4E2811), fontWeight: FontWeight.bold,),),
                      ),
                      Form(

                          child: TextField(
                              controller: nameController,
                              style: TextStyle(fontSize: 25),
                              decoration: InputDecoration(
                                  hintText: snapshot.data['name']
                              )
                          )
                      ),

                      Container(
                        alignment:Alignment.topLeft,
                        child: Text('Surname: ', style: TextStyle(fontSize: 30, color: Color(
                            0xFF4E2811), fontWeight: FontWeight.bold,),),
                      ),
                      Form(

                          child: TextField(
                              controller: surnameController,
                              style: TextStyle(fontSize: 25),
                              decoration: InputDecoration(
                                  hintText: snapshot.data['surname'].toString()
                              )
                          )
                      ),

                      Container(
                        alignment:Alignment.topLeft,
                        child: Text('Address: ', style: TextStyle(fontSize: 30, color: Color(
                            0xFF4E2811), fontWeight: FontWeight.bold,),),
                      ),
                      Form(

                          child: TextField(
                              controller: addressController,
                              style: TextStyle(fontSize: 25),
                              decoration: InputDecoration(
                                  hintText: snapshot.data['address']
                              )
                          )
                      ),

                    ]
                ),
              );

            }
          }
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(
              0xFF845E09),
          onPressed: () {
            setState(() {
              name=nameController.text;
              surname=surnameController.text;
              address=addressController.text;
            });
            var petOwner = FirebaseFirestore.instance.collection('PetOwners').doc(widget.petOwnerID);
            if(name!=''){
              petOwner.update(
                  {'name':nameController.text});
            }
            if(surname!=''){
              petOwner.update({'surname':surnameController.text});
            }
            if(address!=''){
              petOwner.update({'address':addressController.text});
            }
            Navigator.pop(context);
          },child: Icon(Icons.check,)),
    );
  }
}










