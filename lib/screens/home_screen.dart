import 'package:ferrari/componets/my_tile.dart';
import 'package:ferrari/screens/f1_beginner_screen.dart'; 
import 'package:flutter/material.dart';
import 'package:transition/transition.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Image(
              image: AssetImage('assets/images/car_collection/home_car.png'),
              fit: BoxFit.fill,
              height: 300,
            )),
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
            
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Explore Ferrari F1 Cars",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 140, 6, 6),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Discover everything about Ferrari's F1 cars and races. "
                    "Learn about cars, track stats, and watch live races as a beginner F1 enthusiast!",
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 200,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 140, 6, 6),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                           Navigator.push(
                        
                        context,
                        Transition(child: F1BeginnerScreen(), transitionEffect: TransitionEffect.FADE)
                      );
                        },
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 400, // Provide a fixed height for the GridView
                child: GridView(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  children: [
                    _buildFeatureTile(
                      icon: Icons.directions_car,
                      title: "Ferrari Cars",
                      onTap: () {
                        Navigator.pushNamed(context, '/carDetails');
                      },
                    ),
                    _buildFeatureTile(
                      icon: Icons.event,
                      title: "Race Schedule",
                      onTap: () {
                        Navigator.pushNamed(context, '/raceSchedule');
                      },
                    ),
                    _buildFeatureTile(
                      icon: Icons.live_tv,
                      title: "Live Stream",
                      onTap: () {
                        Navigator.pushNamed(context, '/liveStream');
                      },
                    ),
                    _buildFeatureTile(
                      icon: Icons.history,
                      title: "Ferrari History",
                      onTap: () {
                        Navigator.pushNamed(context, '/history');
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  FeatureTile(
                    icon: Icons.directions_car,
                    title: "Explore Ferrari Cars",
                    description:
                        "Learn about Ferrari's iconic F1 cars, from engine specs to design details.",
                  ),
                  SizedBox(height: 10),
                  FeatureTile(
                    icon: Icons.insights,
                    title: "Track Performance",
                    description:
                        "Get insights on Ferrari's performance on the track, including stats and highlights.",
                  ),
                  SizedBox(height: 10),
                  FeatureTile(
                    icon: Icons.live_tv,
                    title: "Watch Live Races",
                    description:
                        "Stream Ferrari's F1 races live and stay updated with the latest news.",
                  ),
                ],
              ),
            ),

           
          ],
        ),
      ),
    );
  }

  // Feature Tile Builder (_buildFeatureTile)
  Widget _buildFeatureTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: const Color.fromARGB(255, 140, 6, 6)),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
