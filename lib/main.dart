import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_dashboard/core/constants/color_costants.dart';
import 'package:responsive_dashboard/view/dashboard/dashboard_view.dart';
import 'package:responsive_dashboard/viewmodel/menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: ColorCostants.instance.backgroundColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: ColorCostants.instance.secondColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<MenuController>(
            create: (context) => MenuController(),
          ),
        ],
        child: DashboardView(),
      ),
    );
  }
}
