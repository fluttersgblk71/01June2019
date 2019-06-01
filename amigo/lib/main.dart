import 'package:amigo/helpers/constants.dart';
import 'package:amigo/helpers/routes.dart';
import 'package:amigo/helpers/utilities.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

void main() async {
  await firestoreInstance.settings(
    timestampsInSnapshotsEnabled: true,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Begin...

    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'monsterrat',
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      routes: amigoRouter(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //Begin...
    final _width = width(context);
    final _height = height(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Amigo'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Image.asset(
                  'assets/amigoLogo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: _height * 0.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(welcomeText),
                  Text(welcomeUser),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: _width * 0.5,
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        labelText: userNameHint,
                      ),
                    ),
                    SizedBox(height: _height * 0.02),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        border: OutlineInputBorder(),
                        labelText: passwordHint,
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: _height * 0.03),
                    RaisedButton(
                      child: Text(loginText),
                      color: Colors.red,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _handleSignIn() async {
  try {
    var details = await _googleSignIn.signIn();
    print(details);
  } catch (error) {
    print(error);
  }
}
