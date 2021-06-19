import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PetOwnerHomePage extends StatelessWidget {
  final String ID;

  const PetOwnerHomePage({Key key, this.ID}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.orangeAccent,
      ),
      home: PetOwner(title: 'My Profile', userID: ID ),
    );
  }
}
class LookForPetSitters extends StatelessWidget {
  const LookForPetSitters({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Look For Pet Sitters')),
      body: Container(
        color: Colors.orangeAccent,
        child: new Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              Container(
                height:40,
                color: Colors.orangeAccent[100],
                child:Center(
                  child: Text('This will be filled',),
                )
              ),
              Container(
                  height:40,
                  color: Colors.orangeAccent[400],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),
              Container(
                  height:40,
                  color: Colors.orangeAccent[100],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),
              Container(
                  height:40,
                  color: Colors.orangeAccent[400],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),
              Container(
                  height:40,
                  color: Colors.orangeAccent[100],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),
              Container(
                  height:40,
                  color: Colors.orangeAccent[400],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),
              Container(
                  height:40,
                  color: Colors.orangeAccent[100],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),
              Container(
                  height:40,
                  color: Colors.orangeAccent[400],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),
              Container(
                  height:40,
                  color: Colors.orangeAccent[100],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),
              Container(
                  height:40,
                  color: Colors.orangeAccent[400],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),
              Container(
                  height:40,
                  color: Colors.orangeAccent[100],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),
              Container(
                  height:40,
                  color: Colors.orangeAccent[400],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),
              Container(
                  height:40,
                  color: Colors.orangeAccent[100],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),
              Container(
                  height:40,
                  color: Colors.orangeAccent[400],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),
              Container(
                  height:40,
                  color: Colors.orangeAccent[100],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),
              Container(
                  height:40,
                  color: Colors.orangeAccent[400],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),
              Container(
                  height:40,
                  color: Colors.orangeAccent[100],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),Container(
                  height:40,
                  color: Colors.orangeAccent[400],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),
              Container(
                  height:40,
                  color: Colors.orangeAccent[100],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),
              Container(
                  height:40,
                  color: Colors.orangeAccent[400],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),Container(
                  height:40,
                  color: Colors.orangeAccent[100],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),Container(
                  height:40,
                  color: Colors.orangeAccent[400],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),Container(
                  height:40,
                  color: Colors.orangeAccent[100],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),Container(
                  height:40,
                  color: Colors.orangeAccent[400],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),Container(
                  height:40,
                  color: Colors.orangeAccent[100],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),Container(
                  height:40,
                  color: Colors.orangeAccent[400],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),Container(
                  height:40,
                  color: Colors.orangeAccent[100],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),Container(
                  height:40,
                  color: Colors.orangeAccent[400],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),Container(
                  height:40,
                  color: Colors.orangeAccent[100],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),Container(
                  height:40,
                  color: Colors.orangeAccent[400],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),Container(
                  height:40,
                  color: Colors.orangeAccent[100],
                  child:Center(
                    child: Text('This will be filled',),
                  )
              ),
            ],
          ),
        )
      ),
    );
  }
}


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
  PetOwner({Key key, this.title, this.userID}) : super(key: key);

  final String userID;
  final String title;

  @override
  _PetOwnerState createState() => _PetOwnerState();
}

class _PetOwnerState extends State<PetOwner> {
   String petName;
   int selectedItemIndex=0;
   //Function onItemTap;

   void onItemTap(int index) {
     setState(() {
       selectedItemIndex=index;
     });
     selectedItemIndex==1 && ModalRoute.of(context).settings.name!='LookForPetSitters'?Navigator.of(context).push(MaterialPageRoute(
         builder: (context){
           return LookForPetSitters();
         }
     ))
         :
     selectedItemIndex==2&&ModalRoute.of(context).settings.name!='ChanceWheel'?Navigator.of(context).push(MaterialPageRoute(
         builder: (context){
           return ChanceWheel();
         }
     ))
         :
     print('no action available');

   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex:6,
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: FlatButton(
                  onPressed: null,
                  padding: EdgeInsets.all(0.0),
                  //child:Image.asset('')
                )
              )
            ),
            Expanded(
              child: SizedBox(
                width:300,
                height: 80,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Name: '+ FirebaseFirestore.instance.doc(widget.userID).path, style: new TextStyle(fontSize: 25, color: const Color(
                      0xFF550000), fontWeight: FontWeight.bold), ),
                ),
            ), flex: 2,),
            Expanded(
              child: SizedBox(
                  width:300,
                  height: 80,
                  child: Row(
                      children: [
                        Text('Pets: ',style: new TextStyle(fontSize: 25, color: const Color(0xFF550000),fontWeight: FontWeight.bold ),),
                        Text(this.petName!=null?this.petName:'',style: new TextStyle(fontSize: 25, color: const Color (
                            0xFF00429E),fontWeight: FontWeight.bold ),),
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
                                    return ListingPetsUI(petName: this.petName, petNameCarrier: (name){setState(() {
                                      petName=name;
                                    });} ,);
                                  }
                              )); },
                              child: Text('edit'),
                            ),
                          ),
                        ),
                        Text("")
                  ])
              ), flex: 2,
            ),
            Expanded(
              flex:2,
              child: Container(
                alignment: Alignment.center,
                child: SizedBox(
                height: 70,
                width: 380,
                child: ElevatedButton (
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFFF7252),
                    onPrimary: const Color(0xFF740000),
                    shadowColor: const Color(0xFF320000),
                  ), onPressed: () {  },
                  child: Text('Last hired pet sitters', style: new TextStyle(fontSize:30)),

                ),
            ),
              ),
            ),
             Expanded(
               flex:2,
              child:
                Container(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 70,
                    width: 380,
                    child: ElevatedButton (
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF00CE8D),
                        onPrimary: const Color(0xFF004DB4),
                      ), onPressed: () { /*Navigator.of(context).push(MaterialPageRoute(
                        builder: (context){
                          return SignUpChooser();
                        }
                    )); */},
                      child: Text('Favourite pet sitters', style: new TextStyle(fontSize:30)),

                    ),
                  ),
                ),
              ),
          ],
        ),
      ),


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
            icon: Icon(Icons.add_alert_sharp, size: 40),
            label: 'Chance Wheel',
          ),
        ],
      ),
    );
  }


}

class Pet extends StatefulWidget {
  const Pet({Key key}) : super(key: key);

  @override
  _PetState createState() => _PetState();
}

class _PetState extends State<Pet> {
  String name;
  int age;
  String species;
  String breed;
  String livingArea;
  String dailyRoutine;

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

  /*Function dailyRoutineFunction= (bool batheChecked, bool combChecked, bool feedChecked, bool takeForAWalkChecked) => {
    if (batheChecked) {
    'bathe'
  }
  else if(combChecked && batheChecked){
    'comb'
  }
  else if(combChecked && !batheChecked){
    ', comb'
  }
  else if(feedChecked && (batheChecked || combChecked)){
     'feed'
  }
  else if(feedChecked && !(batheChecked || combChecked)){
     ', feed'
  }
  else if(takeForAWalkChecked && !(takeForAWalkChecked || combChecked || feedChecked)){
    ', take for a walk'
  }
  else if(takeForAWalkChecked && (takeForAWalkChecked || combChecked || feedChecked)){
    'take for a walk'
  }
  else {
    'undef.'
  }};*/


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
                              combText = 'Comb   ';
                            }
                            else
                              combText = '';

                            dailyRoutine= batheText+combText+feedText+ walkText;
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
                              batheText = 'Bathe   ';
                            }
                            else
                              batheText = '';

                            dailyRoutine= batheText+combText+feedText+ walkText;
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

                            dailyRoutine= batheText+combText+feedText+ walkText;
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
                            walkText = 'Take for a walk   ';
                          }
                          else
                            walkText = '';

                          dailyRoutine= batheText+combText+feedText+ walkText;
                        });},
                        selected: this.isTakeForAWalkChecked,
                      ),
                    ),
                    ]
                  ),
                  Text(this.dailyRoutine==null?'undefined ': dailyRoutine, textAlign: TextAlign.center, style: TextStyle(fontSize: 20,color: const Color(
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
            showDialog(barrierDismissible: false,context: context, builder: (context){
              return AlertDialog(
                content: Text('Successfully created '+name),
                actions: [TextButton(onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context).pop<String>(name.toString());
                  Navigator.pop(context);
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
    const ListingPetsUI({Key key, this.petNameCarrier(String name), this.petName}) : super(key: key);

    final Function petNameCarrier;
  final String petName;

    @override
    Widget build(BuildContext context){
      return Scaffold(
        backgroundColor: const Color(0xFF83ECFF),
        appBar: AppBar(title: Text('Pets'), backgroundColor: Colors.blueAccent,),
        body: Container(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: ListView(
            children: [
              SizedBox(
                child: Column(
                  children: [
                  Text(this.petName==null?'Press + icon to add your pet here':this.petName.toString().toUpperCase(), style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),),
                  Text('Here will be filled with the data from database'),
                  ]
        ),
              ),
            ]
            ),
          )
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () async{
              final result = await Navigator.of(context).push(MaterialPageRoute(
                builder: (context){
                  return Pet();
                }
            ));
              petNameCarrier (result.toString());
              },
      ),
      );
    }
}

class ChanceWheel extends StatelessWidget {
  const ChanceWheel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chance Wheel'), backgroundColor: Colors.indigo,),
      backgroundColor: Colors.deepPurpleAccent,

    );
  }
}









