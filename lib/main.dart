import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travlore_app/LandingPage.dart';
import 'package:travlore_app/SplashScreen.dart';
import 'nextPage.dart';
import 'Join.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travlore',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: const MyHomePage(title: 'Travlore'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A2D3B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200, // Adjust the width as needed
              height: 200, // Adjust the height as needed
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/travloreLogo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    TextField(
                      controller: usernameController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 20,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        labelText: 'User Name',
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 20,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        labelText: 'Password',
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LandingPage(title: 'landingPage', landingPage: '',)),
                        );
                      },
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          color: Color(0xFF2A2D3B),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigate to the desired page when the text is tapped
                      },
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigate to the desired page when the text is tapped
                      },
                      child: const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {

                        Future<UserCredential>ucFuture = FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: usernameController.text, password: passwordController.text);

                        ucFuture.then((value){
                          print("sucessfully sign up the user");
                        });

                        // ucFuture.catchError(){
                        //   print("Failed to sign up the user");
                        //   print.error.toString());
                        // });

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Join(title: 'joinPage')),
                        );
                      },
                      child: const Text(
                        'Join',
                        style: TextStyle(
                          color: Color(0xFF2A2D3B),
                        ),
                      ),
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