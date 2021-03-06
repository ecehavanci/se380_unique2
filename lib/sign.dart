import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'PetOwner.dart';
import 'PetSitterHome.dart';
//https://firebase.flutter.dev/docs/auth/usage/
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(SignUpChooser(camera:firstCamera));
}
class SignInAsPetSitter extends StatefulWidget {
  final CameraDescription camera;
  const SignInAsPetSitter({Key key, this.onButtonPressed, this.id, this.camera}) : super(key: key);

  final String id;
  final onButtonPressed;
  @override
  _SignInAsPetSitterState createState() => _SignInAsPetSitterState(onButtonPressed, id);
}

class _SignInAsPetSitterState extends State<SignInAsPetSitter> {
  String email;
  String password;

  String emailNotFound = '';
  String wrongPassword = '';

  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final Function onButtonPressed;
  final String id;

  _SignInAsPetSitterState(this.onButtonPressed, this.id);

  get firstCamera => widget.camera;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color(0xFFFFEBA2),
          appBar: AppBar(title: Text('Sign in'), backgroundColor: const Color(
              0xFFE27320),),
          body:Builder(
            builder: (context) => Container(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 900,
                width: 350,
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: ListView(
                    children: [
                      Form(

                          child: TextField(
                              textInputAction: TextInputAction.next,
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(fontSize: 25),
                              decoration: InputDecoration(
                                  hintText: 'Email'
                              )
                          )
                      ),

                      Form(

                          child: TextField(
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                              controller: passwordController,
                              style: TextStyle(fontSize: 25),
                              decoration: InputDecoration(
                                  hintText: 'Password'
                              )
                          )
                      ),


                      SizedBox(
                          height: 300,
                          child: Row(
                              children: [
                                Text('Don\'t you have an account? ', style: TextStyle( fontSize: 20)),
                                TextButton(onPressed: () {Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context){
                                      return SignUpChooser();
                                    }));}, child: Text('Sign up', style: TextStyle(color: Colors.blue, fontSize: 20),))
                              ]
                          )
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),


          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.deepOrangeAccent,
              child: Icon(Icons.check),
              onPressed: () async {
                setState(() {
                  email=emailController.text;
                  password=passwordController.text;
                });

                try{
                  UserCredential uc = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email, password: password
                  );
                  print('ID: '+uc.user.uid);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return MyApp(userID : uc.user.uid,camera: firstCamera);
                      })
                  );

                }on FirebaseAuthException catch (exception){
                  if (exception.code=='user-not-found'){
                    print("wrong email");
                  }
                  if(exception.code=='wrong-password'){
                    print('wrong password');
                  }
                }
              }
          )
      ),
    );
  }
}

class SignInAsPetOwner extends StatefulWidget {
  const SignInAsPetOwner({Key key, this.id,this.camera}) : super(key: key);

  final String id;
  final CameraDescription camera;


  @override
  _SignInAsPetOwnerState createState() => _SignInAsPetOwnerState(id);
}

class _SignInAsPetOwnerState extends State<SignInAsPetOwner> {
  String email;
  String password;

  String emailNotFound = '';
  String wrongPassword = '';

  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final String id;

  _SignInAsPetOwnerState(this.id);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color(0xFFFFEBA2),
          appBar: AppBar(title: Text('Sign in'), backgroundColor: const Color(
              0xFFE27320),),
          body:Builder(
            builder: (context) => Container(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 900,
                width: 350,
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: ListView(
                    children: [
                      Form(

                          child: TextField(
                              textInputAction: TextInputAction.next,
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(fontSize: 25),
                              decoration: InputDecoration(
                                  hintText: 'Email'
                              )
                          )
                      ),

                      Form(

                          child: TextField(
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                              controller: passwordController,
                              style: TextStyle(fontSize: 25),
                              decoration: InputDecoration(
                                  hintText: 'Password'
                              )
                          )
                      ),


                      SizedBox(
                          height: 300,
                          child: Row(
                              children: [
                                Text('Don\'t you have an account? ', style: TextStyle( fontSize: 20)),
                                TextButton(onPressed: () {Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context){
                                      return SignUpChooser();
                                    }));}, child: Text('Sign up', style: TextStyle(color: Colors.blue, fontSize: 20),))
                              ]
                          )
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),


          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.deepOrangeAccent,
              child: Icon(Icons.check),
              onPressed: () async {
                setState(() {
                  email=emailController.text;
                  password=passwordController.text;
                });

                try{
                  UserCredential uc = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email, password: password
                  );

                  print('ID: '+uc.user.uid);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return PetOwnerHomePage(ID : uc.user.uid,camera:widget.camera);
                      })
                  );

                }on FirebaseAuthException catch (exception){
                  if (exception.code=='user-not-found'){
                    print("wrong email");
                  }
                  if(exception.code=='wrong-password'){
                    print('wrong password');
                  }
                }
              }
          )
      ),
    );
  }
}

class SignUpAsPetSitter extends StatefulWidget {
  const SignUpAsPetSitter({Key key}) : super(key: key);

  @override
  _SignUpAsPetSitterState createState() => _SignUpAsPetSitterState();
}

class _SignUpAsPetSitterState extends State<SignUpAsPetSitter> {
  String name;
  String surname;
  String email;
  String password;
  int phone;
  String address;

  String weakPassword;
  String emailInUse;



  final nameController=TextEditingController();
  final surnameController=TextEditingController();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final addressController=TextEditingController();
  final phoneController=TextEditingController();

  _SignUpAsPetSitterState();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color(0xFFFFEBA2),
          appBar: AppBar(title: Text('Sign up'), backgroundColor: const Color(
              0xFFFFBD2B),),
          body:Builder(
            builder: (context) =>Container(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 900,
                width: 350,
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: ListView(
                    children: [
                      Form(
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            controller: nameController,
                            style: TextStyle(fontSize: 25),
                            decoration: InputDecoration(
                                hintText: 'Name'
                            ),
                          )
                      ),

                      Form(

                          child: TextField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              controller: surnameController,
                              style: TextStyle(fontSize: 25),
                              decoration: InputDecoration(
                                  hintText: 'Surname'
                              )
                          )
                      ),

                      Form(

                          child: TextField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.streetAddress,
                              controller: addressController,
                              style: TextStyle(fontSize: 25),
                              decoration: InputDecoration(
                                  hintText: 'Address'
                              )
                          )
                      ),

                      Form(

                          child: TextField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.phone,
                              controller: phoneController,
                              style: TextStyle(fontSize: 25),
                              decoration: InputDecoration(
                                  hintText: 'Phone number'
                              )
                          )
                      ),

                      Form(

                          child: TextField(
                              textInputAction: TextInputAction.next,
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(fontSize: 25),
                              decoration: InputDecoration(
                                  hintText: 'Email'
                              )
                          )
                      ),

                      Form(
                          child: TextField(
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                              controller: passwordController,
                              style: TextStyle(fontSize: 25),
                              decoration: InputDecoration(
                                  hintText: 'Password'
                              )
                          )
                      ),

                      SizedBox(
                          height: 300,
                          child: Row(
                              children: [
                                Text('Have an account? ', style: TextStyle( fontSize: 20)),
                                TextButton(onPressed: () {Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context){
                                      return SignInChooser();
                                    }));}, child: Text('Sign in', style: TextStyle(color: Colors.blue, fontSize: 20),))
                              ]
                          )
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),


          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.deepOrange,
              child: Icon(Icons.check),
              onPressed: () async {
                setState(() {
                  name = nameController.text;
                  surname = surnameController.text;
                  address = addressController.text;
                  email = emailController.text;
                  password = passwordController.text;
                  phone = int.tryParse(phoneController.text);
                });




                try{
                UserCredential uc = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: email, password: password
                );
                var inst = FirebaseFirestore.instance.collection('PetSitters').doc(uc.user.uid);
                inst.set({
                  'name': name,
                  'surname': surname,
                  'address': address,
                  'email': email,
                  'password':password,
                  'phone': phone,
                  'bio':null,
                  'shifts':null,
                  'days':null,
                  'price':null,
                });


                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context){
                      return SignInAsPetSitter(id: uc.user.uid);
                    })
                );

                }on FirebaseAuthException catch (exception) {
                  if (exception.code == 'e-mail-already-in-use') {
                    print('exists');
                  }
                  else if (exception.code == 'weak-password') {
                    print('weak');
                  }
                } catch (exception){
                  print(exception);
                }

              }
          )
      ),
    );
  }
}


class SignUpAsPetOwner extends StatefulWidget {
  const SignUpAsPetOwner({Key key, this.ID}) : super(key: key);

  final String ID;
  @override
  _SignUpAsPetOwnerState createState() => _SignUpAsPetOwnerState();
}

class _SignUpAsPetOwnerState extends State<SignUpAsPetOwner> {
  String name;
  String surname;
  String email;
  String password;
  String address;

  String weakPassword;
  String emailInUse;

  final nameController=TextEditingController();
  final surnameController=TextEditingController();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final addressController=TextEditingController();

  _SignUpAsPetOwnerState();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color(0xFFFFEBA2),
          appBar: AppBar(title: Text('Sign up'), backgroundColor: const Color(
              0xFFFFBD2B),),
          body:Builder(
            builder: (context) =>Container(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 900,
                width: 350,
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: ListView(
                    children: [
                      Form(
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            controller: nameController,
                            style: TextStyle(fontSize: 25),
                            decoration: InputDecoration(
                                hintText: 'Name'
                            ),
                          )
                      ),

                      Form(

                          child: TextField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              controller: surnameController,
                              style: TextStyle(fontSize: 25),
                              decoration: InputDecoration(
                                  hintText: 'Surname'
                              )
                          )
                      ),

                      Form(

                          child: TextField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.streetAddress,
                              controller: addressController,
                              style: TextStyle(fontSize: 25),
                              decoration: InputDecoration(
                                  hintText: 'Address'
                              )
                          )
                      ),


                      Form(

                          child: TextField(
                              textInputAction: TextInputAction.next,
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(fontSize: 25),
                              decoration: InputDecoration(
                                  hintText: 'Email'
                              )
                          )
                      ),

                      Form(
                          child: TextField(
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.visiblePassword,
                              controller: passwordController,
                              style: TextStyle(fontSize: 25),
                              decoration: InputDecoration(
                                  hintText: 'Password'
                              )
                          )
                      ),

                      SizedBox(
                          height: 300,
                          child: Row(
                              children: [
                                Text('Have an account? ', style: TextStyle( fontSize: 20)),
                                TextButton(onPressed: () {Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context){
                                      return SignInChooser();
                                    }));}, child: Text('Sign in', style: TextStyle(color: Colors.blue, fontSize: 20),))
                              ]
                          )
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),


          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.deepOrange,
              child: Icon(Icons.check),
              onPressed: () async {
                setState(() {
                  name = nameController.text;
                  surname = surnameController.text;
                  address = addressController.text;
                  email = emailController.text;
                  password = passwordController.text;
                });

                try{
                  UserCredential uc = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email, password: password
                  );


                  var inst = FirebaseFirestore.instance.collection('PetOwners').doc(uc.user.uid);
                  inst.set({
                    'name': name,
                    'surname': surname,
                    'address': address,
                    'email': email,
                    'password':password,
                  });

                  var userID = uc.user.uid;

                  print('pet owner id: ' +userID);

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context){
                        return SignInAsPetOwner(id: userID,);
                      })
                  );

                }on FirebaseAuthException catch (exception) {
                  if (exception.code == 'e-mail-already-in-use') {
                    print('exists');
                  }
                  else if (exception.code == 'weak-password') {
                    print('weak');
                  }
                } catch (exception){
                  print(exception);
                }

              }
          )
      ),
    );
  }
}



class SignUpChooser extends StatelessWidget {
  final CameraDescription camera;
  const SignUpChooser({Key key, this.camera}) : super(key: key);

  get firstCamera => camera;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFFFD074),
        appBar: AppBar(title: Text('Sign up'), backgroundColor: const Color(
            0xFFFF9E00),),
        body:Builder(
          builder: (context) => Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 9,
                    child: Container(alignment: Alignment.center,child: Text("Welcome To \nUNIQUE", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 50, fontWeight: FontWeight.bold, color: Colors.brown), textAlign: TextAlign.center,))
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: SizedBox(
                      height: 50,
                      width: 220,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF71A7FF),
                            onPrimary: const Color(0xFF235ABA),
                          ),
                          onPressed: () { Navigator.of(context).push(MaterialPageRoute(
                              builder: (context){
                                return SignUpAsPetOwner();
                              })); },
                          child: Text('Sign up as pet owner', style: TextStyle(fontSize: 19),),
                        ),
                    ),
                  ),
                ),
                Expanded(child: Text(''), flex:1,),

                Expanded(
                  flex: 2,
                  child: Container(
                    child: SizedBox(
                    height: 50,
                    width: 220,
                      child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF71A7FF),
                      onPrimary: const Color(0xFF235ABA),
                      ),
                      onPressed: () { Navigator.of(context).push(MaterialPageRoute(
                          builder: (context){
                        return SignUpAsPetSitter();
                      }));},
                        child: Text('Sign up as pet sitter', style: TextStyle(fontSize: 19),),
                        ),
                    ),
                  ),
                ),


                Expanded(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Do you have an account? ',style: TextStyle(fontSize: 20, color: Color(
                          0xFF784110)),),
                      TextButton(onPressed: () { Navigator.of(context).push(MaterialPageRoute(
                          builder: (context){
                            return SignInChooser(camera: firstCamera);
                          }));},
                      child: Text('Sign in ',style: TextStyle(fontSize: 20, color: Colors.blue),)),
                ]), flex:4,)

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignInChooser extends StatelessWidget {
  final CameraDescription camera;
  const SignInChooser({Key key,this.camera}) : super(key: key);

  get firstCamera => camera;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFFFD074),
        appBar: AppBar(title: Text('Sign up'), backgroundColor: const Color(
            0xFFFF9E00),),
        body:Builder(
          builder: (context) => Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 9,
                    child: Container(alignment: Alignment.center,child: Text("Welcome Again To \nUNIQUE", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 50, fontWeight: FontWeight.bold, color: Colors.brown), textAlign: TextAlign.center,))
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: SizedBox(
                      height: 50,
                      width: 220,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF71A7FF),
                          onPrimary: const Color(0xFF235ABA),
                        ),
                        onPressed: () { Navigator.of(context).push(MaterialPageRoute(
                            builder: (context){
                              return SignInAsPetOwner(camera: firstCamera);
                            })); },
                        child: Text('Sign in as pet owner', style: TextStyle(fontSize: 19),),
                      ),
                    ),
                  ),
                ),
                Expanded(child: Text(''), flex:1,),

                Expanded(
                  flex: 2,
                  child: Container(
                    child: SizedBox(
                      height: 50,
                      width: 220,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xFF71A7FF),
                          onPrimary: const Color(0xFF235ABA),
                        ),
                        onPressed: () { Navigator.of(context).push(MaterialPageRoute(
                            builder: (context){
                              return SignInAsPetSitter(camera: firstCamera);
                              //Just add camera: firstCamera as parameter in here
                            }));},
                        child: Text('Sign in as pet sitter', style: TextStyle(fontSize: 19),),
                      ),
                    ),
                  ),
                ),


                Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Do you have an account? ',style: TextStyle(fontSize: 20, color: Color(
                          0xFF784110)),),
                      TextButton(onPressed: () { Navigator.of(context).push(MaterialPageRoute(
                          builder: (context){
                            return SignUpChooser();
                          }));},
                          child: Text('Sign up ',style: TextStyle(fontSize: 20, color: Colors.blue),)),
                    ]), flex:4,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

