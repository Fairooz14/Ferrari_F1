// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// class F1BeginnerScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Row(
//           children: [
//             IconButton(
//               icon: Icon(
//                 Icons.arrow_back_ios_new_rounded,
//                 color: Color.fromARGB(255, 255, 255, 255),
//                 size: 30,
//               ),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//             Text('Learn about Formula 1',
//                 style: TextStyle(fontSize: 20, color: Colors.white), textAlign: TextAlign.center),
//           ],
//         ),
//         backgroundColor: const Color.fromARGB(255, 140, 6, 6),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Hero Section
//             Stack(
//               children: [
//                 Image.asset(
//                   'assets/images/car_collection/home_car.png', // Replace with actual intro image
//                   fit: BoxFit.cover,
//                   height: 200,
//                   width: double.infinity,
//                 ),
//                 Positioned(
//                   bottom: 20,
//                   left: 20,
//                   child: Text(
//                     'Explore Formula 1',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       shadows: [
//                         Shadow(
//                           blurRadius: 10.0,
//                           color: Colors.black,
//                           offset: Offset(2.0, 2.0),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             SizedBox(height: 20),

//             // Section: Learn the Basics
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Learn the Basics',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.red[900],
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Get to know the basics of Formula 1, including the cars, rules, and tracks.',
//                     style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 10),
//             CarouselSlider(
//               options: CarouselOptions(
//                 height: 200,
//                 autoPlay: true,
//                 enlargeCenterPage: true,
//               ),
//               items: [
//                 'assets/images/car_collection/home_car.png', // Replace with actual images
//                 'assets/images/car_collection/home_car.png',
//                 'assets/images/car_collection/home_car.png',
//               ].map((imagePath) {
//                 return Builder(
//                   builder: (BuildContext context) {
//                     return Container(
//                       margin: EdgeInsets.symmetric(horizontal: 5.0),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         image: DecorationImage(
//                           image: AssetImage(imagePath),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               }).toList(),
//             ),

//             SizedBox(height: 20),

//             // Section: The Excitement of Races
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'The Excitement of F1 Races',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.red[900],
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Feel the thrill of F1 races with high-speed action, iconic tracks, and incredible moments.',
//                     style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//                   ),
//                   SizedBox(height: 10),
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.asset(
//                       'assets/images/car_collection/home_car.png', // Replace with race image
//                       fit: BoxFit.cover,
//                       height: 200,
//                       width: double.infinity,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             SizedBox(height: 20),

//             // Section: Ferrari’s Legacy
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Ferrari’s Legacy',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.red[900],
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Dive into Ferrari’s incredible history in Formula 1, from legendary victories to iconic cars.',
//                     style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//                   ),
//                   SizedBox(height: 10),
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.asset(
//                       'assets/images/car_collection/home_car.png', // Replace with legacy image
//                       fit: BoxFit.cover,
//                       height: 200,
//                       width: double.infinity,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             SizedBox(height: 20),

//             // Section: Track Stats
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Track Stats',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.red[900],
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Explore the most iconic tracks in Formula 1 and their unique challenges.',
//                     style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//                   ),
//                   SizedBox(height: 10),
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.asset(
//                       'assets/images/car_collection/home_car.png', // Replace with track image
//                       fit: BoxFit.cover,
//                       height: 200,
//                       width: double.infinity,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             SizedBox(height: 20),

//             // Section: Iconic Drivers
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Iconic Drivers',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.red[900],
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Meet the legendary drivers who shaped the history of Formula 1.',
//                     style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//                   ),
//                   SizedBox(height: 10),
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.asset(
//                       'assets/images/car_collection/home_car.png', // Replace with drivers image
//                       fit: BoxFit.cover,
//                       height: 200,
//                       width: double.infinity,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class F1BeginnerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Learn about Formula 1',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 140, 6, 6),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Section
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/car_collection/header.png',
                      fit: BoxFit.cover,
                      height: 200,
                      width: 500,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text(
                      'Explore Formula 1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Introduction Section
              _buildSectionTitle('What is Formula 1?'),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Formula 1 is the pinnacle of motorsport, featuring high-speed cars, skilled drivers, and thrilling races on iconic tracks worldwide.',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Learn the Basics Carousel
              _buildSectionTitle('Learn the Basics'),
              CarouselSlider(
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: [
                  {
                    "title": "What is Formula 1?",
                    "description": "An introduction to the world's most prestigious motorsport.",
                    "image": 'assets/images/car_collection/carousal_1.png',
                  },
                  {
                    "title": "The Cars",
                    "description": "Learn about the high-speed, aerodynamic machines of Formula 1.",
                    "image": 'assets/images/car_collection/carousal_2.png',
                  },
                  {
                    "title": "The Tracks",
                    "description": "Discover the iconic circuits where F1 races take place.",
                    "image": 'assets/images/car_collection/sparks.png',
                  },
                ].map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                child: Image.asset(
                                  item['image']!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['title']!,
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    item['description']!,
                                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 20),

              // Informative Sections
              _buildSectionTitle('Iconic F1 Cars'),
              _buildInfoCard(
                'F1 cars are engineered for speed and precision, featuring cutting-edge technology.',
                'assets/images/car_collection/iconic_cars.png',
              ),

              SizedBox(height: 20),

              _buildSectionTitle('Legendary Tracks'),
              _buildInfoCard(
                'From Monaco to Silverstone, F1 tracks challenge drivers with unique layouts.',
                'assets/images/car_collection/tracks.png',
              ),

              SizedBox(height: 20),

              _buildSectionTitle('Famous Drivers'),
              _buildInfoCard(
                'Meet legends like Ayrton Senna, Michael Schumacher, and Lewis Hamilton.',
                'assets/images/car_collection/team.png',
              ),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.red[900],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String description, String imagePath) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 250,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }
}
