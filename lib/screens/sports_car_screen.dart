import 'package:ferrari/componets/my_textfieldInner.dart';
import 'package:ferrari/screens/car_detail_screen.dart';
import 'package:ferrari/services/f1_car_service.dart';
import 'package:flutter/material.dart';

class SportsCarScreen extends StatefulWidget {
  @override
  _SportsCarScreenState createState() => _SportsCarScreenState();
}

class _SportsCarScreenState extends State<SportsCarScreen> {
  final F1CarService _f1CarService = F1CarService();
  late Future<List<Map<String, dynamic>>> _f1Cars;
  List<Map<String, dynamic>> _filteredCars = [];
  String _searchQuery = '';

  // Fetch data on screen load
  @override
  void initState() {
    super.initState();
    _f1Cars = _f1CarService.getF1Cars(); // Fetch data on screen load
  }

  // Filter cars based on search query

  void _filterCars() {
    setState(() {
      _f1Cars.then((cars) {
        _filteredCars = cars
            .where((car) =>
                car['name'].toLowerCase().contains(_searchQuery.toLowerCase()))
            .toList();
      });
    });
  }

  TextEditingController _searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _f1Cars,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No F1 cars available.'));
          } else {
            final cars =
                _filteredCars.isNotEmpty ? _filteredCars : snapshot.data!;

            // Car List
            return Column(
              children: [
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: MyTextfieldinner(
                        hintText: "Search",
                        obscureText: false,
                        controller: _searchText,
                      )),
                      SizedBox(width: 10),
                      Container(
                        height: 65,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(
                              255, 140, 6, 6), // Example decoration
                        ),
                        child: GestureDetector(
                          onTap: _filterCars,
                          child: Center(
                            child: Text(
                              'Search',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                Expanded(
                  child: ListView.builder(
                    itemCount: cars.length,
                    itemBuilder: (context, index) {
                      final car = cars[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CarDetailPage(car: car),
                            ),
                          );
                        },
                        child: Card(
                          margin: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 5,
                          color: Colors.white.withOpacity(0.9),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    "${car['year']}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          const Color.fromARGB(255, 140, 6, 6),
                                    ),
                                  ),
                                ),
                              ),
                              Image.network(
                                car['imageUrl'],
                                width: double.infinity,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          car['name'],
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Year: ${car['year']}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      car['description'],
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
