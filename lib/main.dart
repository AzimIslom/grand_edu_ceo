import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grand_edu_ceo/pages/home/imports.dart';
import 'package:grand_edu_ceo/pages/login/Screens/Login/login_screen.dart';
import 'pages/login/constants.dart';
import 'services/auth_service.dart';
import 'package:faker/faker.dart';

final faker = Faker();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GE Ceo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: kPrimaryColor,
            shape: const StadiumBorder(),
            maximumSize: const Size(double.infinity, 56),
            minimumSize: const Size(double.infinity, 56),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: kPrimaryLightColor,
          iconColor: kPrimaryColor,
          prefixIconColor: kPrimaryColor,
          contentPadding: EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: StreamBuilder<User?>(
        stream: auth.stream(),
        builder: (context, snapshot) {
          print(snapshot.data?.email);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: kPrimaryLightColor,
              alignment: Alignment.center,
              child: const SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          } else if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
