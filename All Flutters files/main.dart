import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GRC Dashboard App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 1; // Start on Home

  // Define the main content based on the selected bottom navigation item
  final List<Widget> _widgetOptions = <Widget>[
    Center(child: Text('About GRC', style: TextStyle(fontSize: 30))),
    DashboardContent(), // This is the main screen content
    Center(child: Text('GRC Contact Information', style: TextStyle(fontSize: 30))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('GRC Main Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),

      // Bottom Navigation Bar for About, Home, Contact
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Contact',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

// --- Dashboard Content (The Main Page with GRC Logo and Links) ---

class DashboardContent extends StatelessWidget {

  // Widget for the circular GRC logo area
  Widget _buildGRCLogo() {
    return Column(
      children: [
        Container(
          width: 140, // Slightly bigger circle for main logo
          height: 140,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: Colors.blue, width: 4), // Thicker border
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: ClipOval(
            child: Image.network(
              'lib/grc_logo.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 15),
        Text(
          'Global Reciprocal Colleges',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  // Widget for the clickable academic program links
  Widget _buildProgramLink(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ActionChip(
        label: Text(
          label,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue[600],
        onPressed: () {
          // Add navigation or action logic here
          print('$label Department link clicked!');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. GRC Logo Area (First file: GRC LANG)
          _buildGRCLogo(),

          SizedBox(height: 30),

          // 2. Program Links (CCS, EDUC, COA, CBAE)
          Text(
            'College Departments / Links:',
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          SizedBox(height: 10),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8.0, // horizontal spacing
            runSpacing: 4.0, // vertical spacing
            children: [
              _buildProgramLink('CCS'), // Colleges of Computer Studies
              _buildProgramLink('EDUC'), // Colleges of Education
              _buildProgramLink('COA'), // Colleges of Accountancy
              _buildProgramLink('CBAE'), // Colleges of Business Administration and Entrepreneurship
            ],
          ),

          Divider(height: 40, thickness: 1, indent: 20, endIndent: 20),

          // 3. Main Content Block (Below the links, similar to 'EVENT' block in the sketch)
          Container(
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
                  'Announcements & Events',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.campaign, color: Colors.redAccent),
                  title: Text('Enrollment is Now Open!', style: TextStyle(fontWeight: FontWeight.w500)),
                  subtitle: Text('Last day to enroll is October 30.'),
                  contentPadding: EdgeInsets.zero,
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.event, color: Colors.teal),
                  title: Text('GRC Foundation Day Celebration'),
                  subtitle: Text('See calendar for complete list of activities.'),
                  contentPadding: EdgeInsets.zero,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}