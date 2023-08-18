import 'package:flutter/material.dart';
import 'package:uoni_test/services/api_services.dart';

/// A StatefulWidget representing the landing page to display dashboard data.
class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Landing Page')),
      body: FutureBuilder(
        // Initiates the retrieval of dashboard data from the API.
        future: ApiServices.pullDashboardData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Displays a loading indicator while waiting for data.
            return const Center(child: CircularProgressIndicator());
          } else {
            // Retrieves the dashboard data and displays it in the center of the page.
            final dashboardData = snapshot.data;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text('$dashboardData'),
              ),
            );
          }
        },
      ),
    );
  }
}
