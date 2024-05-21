/* Authored by: Angelea Dela Torre
Company: Nextpire
Project: Advote
Feature: [ADV-002] Sign Up
Description: This homepage of the adVOTE serves as the primary gateway for users, offering a centralized location where they can access 
essential features and information about the platform */

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'adVOTE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Image(
                image: AssetImage(
                    'assets/advote_logo.png'), // Replace 'app_logo.png' with your app logo image asset
                width: 90.0, // Set the width of the image
                height: 90.0, // Set the height of the image
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Center(
              child: Text('Hello, Ella Mae!'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile_picture.JPG'),
              radius: 20.0,
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 8.0, vertical: 15.0), // Adjust vertical padding
            child: SizedBox(
              height: 40.0, // Set the height of the TextField
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal:
                          16.0), // Adjust horizontal padding inside the TextField
                  hintText: 'Search anything...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
          ),
          // BigSlider widget
          BigSlider(),
          // Slider of Ateneo organizations
          OrganizationsCarousel(),
          // Upcoming elections section
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('UPCOMING ELECTIONS',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                ListTile(
                  title: Text('Tactics DZAA Elections'),
                  subtitle: Text('April 24, 2024'),
                  trailing: Icon(Icons.notification_add),
                ),
                Divider(),
                ListTile(
                  title: Text('APSA Elections'),
                  subtitle: Text('April 25, 2024'),
                  trailing: Icon(Icons.notification_add),
                ),
                Divider(),
                ListTile(
                  title: Text('JPIA ELECTIONS - 2024'),
                  subtitle: Text('April 27, 2024'),
                  trailing: Icon(Icons.notification_add),
                ),
                Divider(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 80.0, // Set your desired width for the FAB
        height: 80.0, // Set your desired height for the FAB
        child: ClipOval(
          child: FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here
            },
            child: Container(
              width: 60.0, // Adjust the size of the image to fit within the FAB
              height: 60.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/logo.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            backgroundColor:
                Color.fromARGB(255, 17, 101, 174), // Your custom color
            // Remove the foregroundColor property as it's not needed for an image
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 0, 57, 107),
        shape: CircularNotchedRectangle(),
        notchMargin: -10,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home_outlined),
              onPressed: () => _onItemTapped(0),
              color: _selectedIndex == 0
                  ? Colors.white
                  : Colors.white.withOpacity(
                      0.70), // Adjust color based on selected index
            ),
            IconButton(
              icon: Icon(Icons.file_copy),
              onPressed: () => _onItemTapped(1),
              color: _selectedIndex == 1
                  ? Colors.white
                  : Colors.white.withOpacity(
                      0.70), // Adjust color based on selected index
            ),
            SizedBox(
                width: 48), // The middle space for the floating action button
            IconButton(
              icon: Icon(Icons.bar_chart),
              onPressed: () => _onItemTapped(2),
              color: _selectedIndex == 2
                  ? Colors.white
                  : Colors.white.withOpacity(
                      0.70), // Adjust color based on selected index
            ),
            IconButton(
              icon: Icon(Icons.history),
              onPressed: () => _onItemTapped(3),
              color: _selectedIndex == 3
                  ? Colors.white
                  : Colors.white.withOpacity(
                      0.70), // Adjust color based on selected index
            ),
          ],
        ),
      ),
    );
  }
}

// BigSlider widget class with internal image list

class BigSlider extends StatefulWidget {
  @override
  _BigSliderState createState() => _BigSliderState();
}

class _BigSliderState extends State<BigSlider> {
  int _current = 0;
  final List<String> imgList = [
    'assets/adnu.jpg',
    'assets/election.jpg',
    // Add more image paths here
  ];

  final List<String> headlines = [
    'SSG ELECTION CAMPAIGN ENDS',
    'SUPREME STUDENT GOVERNMENT',
    // Add more headlines here
  ];

  final List<String> captions = [
    'April 7, 2024',
    'April 7, 2024',
    // Add more captions here
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: imgList.asMap().entries.map((entry) {
            int idx = entry.key;
            String imgPath = entry.value;
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imgPath),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), // Dim the image
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 80.0,
                  left: 10.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        headlines[idx],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        captions[idx],
                        style: TextStyle(color: Colors.white, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 30.0,
                  left: 10.0,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your onPressed code here
                    },
                    child: Text('View Details'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Button color
                      foregroundColor: Colors.black, // Text color
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return Container(
              width: 10.0,
              height: 10.0,
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == entry.key
                    ? Colors.white
                    : Colors.white.withOpacity(0.5),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class OrganizationsCarousel extends StatelessWidget {
  final List<String> organizationLogos = [
    'assets/ssg.jpg',
    'assets/tactic.jpg',
    'assets/apsa.jpg',
    'assets/tada.jpg',
    'assets/filmsoc.jpg',
    'assets/rotaract.jpg',
    // Add more organization logos here
  ];

  final List<String> organizationNames = [
    'SSG',
    'TACTICS',
    'APSA',
    'TADA',
    'FilmSoc',
    'Rotaract',
    // Add more organization names here
  ];

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Color.fromARGB(
              255, 233, 241, 249), // Light blue-gray background color
        ),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ateneo Organizations',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 57, 107),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to the 'See all' page
                    },
                    child: Text('See all',
                        style:
                            TextStyle(color: Color.fromARGB(255, 0, 57, 107))),
                  ),
                ],
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                CarouselSlider.builder(
                  itemCount: (organizationLogos.length / 4).ceil(),
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    int firstLogoIndex = itemIndex * 4;
                    return GridView.builder(
                      physics:
                          NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // Number of columns
                        childAspectRatio:
                            1 / 1, // Adjust the size ratio of the logos
                      ),
                      itemCount: 4, // Number of logos per slide
                      itemBuilder: (BuildContext context, int index) {
                        int logoIndex = firstLogoIndex + index;
                        // Check if the logo index is within the range
                        if (logoIndex < organizationLogos.length) {
                          return Container(
                            margin: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(organizationLogos[logoIndex]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        } else {
                          return Container(); // Return an empty container for out of range logos
                        }
                      },
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: false,
                    viewportFraction: 1,
                    aspectRatio: 3.3,
                    onPageChanged: (index, reason) {
                      // Handle page change if needed
                    },
                  ),
                  carouselController: _controller,
                ),
                Positioned(
                  left: 0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back,
                        color: Colors.white), // Arrow color can be changed
                    onPressed: () => _controller.previousPage(),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward,
                        color: Colors.white), // Arrow color can be changed
                    onPressed: () => _controller.nextPage(),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
