import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GRC CCS App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  // Define a reusable widget for the navigation/icon links
  Widget _buildLinkIcon(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.blue.withOpacity(0.1),
          child: Icon(icon, size: 30, color: Colors.blue),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.blue[900]),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('CCS Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Add action for settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section with Profile Picture and Name
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Center(
                child: Column(
                  children: [
                    // Profile Picture/Logo (CRC/CCS Circle from the sketch)
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue,
                          width: 4,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        // Using a different placeholder for a 'logo' look
                        child: Icon(Icons.computer, size: 80, color: Colors.blue),
                      ),
                    ),

                    // Name/Title
                    SizedBox(height: 20),
                    Text(
                      'Colleges of Computer Studies', // 'CCS' from the sketch
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),

                    // Subtitle (GRC)
                    SizedBox(height: 4),
                    Text(
                      'Global Reciprocal Colleges (GRC)', // 'GRC' from the sketch
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ---

            // Icon/Links Row (Translating the bottom icon row from the sketch)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildLinkIcon(Icons.dashboard, 'Dashboard'), // Icon R
                  _buildLinkIcon(Icons.assignment, 'Courses'),   // Icon A
                  _buildLinkIcon(Icons.calendar_today, 'Events'), // Icon J (Calendar/Event from sketch)
                  _buildLinkIcon(Icons.people, 'Faculty'),     // Icon C
                ],
              ),
            ),

            // ---

            // About Me/Program Description Section
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Program Overview',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Divider(color: Colors.grey[300], height: 20, thickness: 1),
                  Text(
                    'The Colleges of Computer Studies offer programs focused on the utilization of both hardware and software technologies. This includes BS Information Technology (BSIT) and BS Computer Science (BSCS), preparing students for dynamic careers in software development, network administration, data science, and more.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),

            SizedBox(height: 40), // Spacing at the bottom
          ],
        ),
      ),
    );
  }
}