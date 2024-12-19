import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/wether-provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: 'Enter City Name',
            suffixIcon: IconButton(
              onPressed: () {
                String text = controller.text;
                context.read<HomeProvider>().getWeatherData(text);
              },
              icon: const Icon(Icons.import_contacts_rounded),
            ),
          ),
        ),
      ),
    );
  }
}
