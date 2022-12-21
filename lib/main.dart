import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taste_application/SecondaryScreens/splash_screen.dart';
import 'package:taste_application/provider_files/taste_provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TasteProvider>(
      create: (_) => TasteProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              textTheme: TextTheme(
                bodyLarge: GoogleFonts.roboto(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
                titleMedium: GoogleFonts.roboto(
                  color: const Color.fromARGB(255, 248, 95, 106),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                titleLarge: GoogleFonts.tangerine(
                  color: const Color.fromARGB(255, 248, 95, 106),
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
                labelMedium: GoogleFonts.roboto(
                  color: const Color.fromARGB(255, 248, 95, 106),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                displaySmall: GoogleFonts.roboto(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                titleSmall: GoogleFonts.roboto(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              colorScheme: ColorScheme.fromSwatch().copyWith(
                  secondary: const Color.fromARGB(255, 251, 209, 212),
                  primary: const Color.fromARGB(255, 248, 95, 106))),
          home: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var trueProvider = context.watch<TasteProvider>();
    var falseProvider = context.read<TasteProvider>();
    return const Material(child: TasteSplashScreen());
  }
}
