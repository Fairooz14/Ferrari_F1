import 'package:flutter/material.dart';
import 'package:ferrari/services/f1_car_details_service.dart';

class CarDetailPage extends StatefulWidget {
  final Map<String, dynamic> car; // Car info from F1CarService

  CarDetailPage({required this.car});

  @override
  _CarDetailPageState createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage> {
  final F1CarDetailsService _f1CarDetailsService = F1CarDetailsService();
  late Future<List<Map<String, dynamic>>>
      _carDetails; // Details from F1CarDetailsService

  @override
  void initState() {
    super.initState();
    // Fetch detailed car information
    _carDetails = _f1CarDetailsService.getF1Cars();
  }

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
                color: Color.fromARGB(255, 255, 255, 255),
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 120),
              child: Expanded(
                
                child: Center(
                  child: Text(widget.car['name'],
                      style: TextStyle(fontSize: 20, color: Colors.white), textAlign: TextAlign.center),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 140, 6, 6),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Car Image
            Image.network(
              widget.car['imageUrl'],
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Car Name
                  Text(
                    widget.car['name'],
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Car Year
                  Text(
                    'Year: ${widget.car['year']}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Fetch and display car details
                  FutureBuilder<List<Map<String, dynamic>>>(
                    future: _carDetails,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(child: Text('No details available.'));
                      } else {
                        final details = snapshot.data!.first;
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: GridView(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // Two columns
                                  crossAxisSpacing: 10, // Space between columns
                                  mainAxisSpacing: 10, // Space between rows
                                  childAspectRatio:
                                      2.0, // Adjusted aspect ratio for better layout
                                ),
                                children: [
                                  _buildGridTile(
                                      "Engine", details['engine'] ?? 'N/A'),
                                  _buildGridTile("Total Displacement",
                                      details['totalDisplacement'] ?? 'N/A'),
                                  _buildGridTile("Battery Energy",
                                      details['batteryEnergy'] ?? 'N/A'),
                                  _buildGridTile("MGU-K Power",
                                      details['mguKPower'] ?? 'N/A'),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                details['description'] ??
                                    'No description available.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[800],
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            )
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create a grid tile
  Widget _buildGridTile(String title, String value) {
    return Container(
      height: 500,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 140, 6, 6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 186, 185, 185),
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis, // Prevents overflow
            ),
          ),
          SizedBox(height: 2),
          Flexible(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 25,
                color: const Color.fromARGB(255, 243, 243, 243),
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis, // Prevents overflow
            ),
          ),
        ],
      ),
    );
  }
}
