import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wether_api/models/models.dart';
import 'package:wether_api/provider/wether-provider.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
    final provider = context.read<HomeProvider>();
    final cityName = provider.name ?? '';
    provider.getWeatherData(cityName);
  }

  @override
  Widget build(BuildContext context) {
    final weatherData = context.watch<HomeProvider>().model;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Page"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/details');
              },
              icon: const Icon(Icons.import_contacts_rounded))
        ],
      ),
      body: weatherData == null ||
              weatherData.name == null ||
              weatherData.mainModel == null
          ? const Center(child: Text("data"))
          : SingleChildScrollView(
              child: Stack(
                children: [
                  Expanded(
                    child: Container(
                      height: 700,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF1B3358), Color(0xFF6A81BE)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      // Top Weather Info
                      Container(
                        height: 400,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 60),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              weatherData.name!,
                              style: GoogleFonts.lato(
                                fontSize: 32,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "${context.read<HomeProvider>().model?.mainModel?.temp ?? 'N/A'}",
                              style: GoogleFonts.lato(
                                fontSize: 80,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "${context.read<HomeProvider>().model?.wether?[0].main}"
                              'No conditions available',
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                color: Colors.white70,
                              ),
                            ),
                            const Spacer(),
                            const Divider(color: Colors.white24, thickness: 1),
                            Text(
                              "${context.read<HomeProvider>().model?.mainModel?.temp_min ?? 'N/A'}",
                              style: GoogleFonts.lato(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: context
                                  .read<HomeProvider>()
                                  .model
                                  ?.wether
                                  ?.length ??
                              0,
                          itemBuilder: (context, index) {
                            return Container();
                          },
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sea level : ${context.read<HomeProvider>().model?.mainModel?.sea_level}",
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white54),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Humidity : ${context.read<HomeProvider>().model?.mainModel?.humidity}",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Pressure : ${context.read<HomeProvider>().model?.mainModel?.pressure ?? 'N/A'}"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
