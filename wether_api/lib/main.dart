import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wether_api/helper/helper.dart';
import 'package:wether_api/provider/wether-provider.dart';
import 'package:wether_api/screens/detail_page/details.dart';
import 'package:wether_api/screens/home-page/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      routes: {
        '/': (context) => const DetailsPage(),
        '/details': (context) => const HomePage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
    );
  }
}
