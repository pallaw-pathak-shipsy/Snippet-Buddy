import 'package:blog_minimal/modules/auth/screen/login.dart';
import 'package:blog_minimal/modules/home/controller/home_controller.dart';
import 'package:blog_minimal/modules/home/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppWdget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppProvider>(
          create: (_) => AppProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          fontFamily: GoogleFonts.notoSerif().fontFamily,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
