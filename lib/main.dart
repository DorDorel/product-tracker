import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:product_tracker/auth/auth.dart';
import 'package:product_tracker/database/database.dart';
import 'package:product_tracker/screen/home_screen.dart';
import 'package:product_tracker/screen/sign_in.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final db = DatabaseService();
    return MultiProvider(
      providers: [
        StreamProvider(
          create: (context) => db.streamTodayActivated(),
          initialData: null,
        ),
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              Provider.of<AuthenticationService>(context, listen: false)
                  .authStateChanges,
          initialData: null,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'product tracker',
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = Provider.of<User>(context);
    if (firebaseUser != null) {
      return HomePage();
    }
    return SignIn();
  }
}
