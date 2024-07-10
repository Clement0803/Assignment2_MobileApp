import 'package:flutter/material.dart';
import 'package:assignment1_mobile_application/db_service.dart';
import 'package:assignment1_mobile_application/insideScreens/activitiyDetails.dart';

class BookingActivities extends StatefulWidget {
  @override
  _BookingActivitiesState createState() => _BookingActivitiesState();
}

class _BookingActivitiesState extends State<BookingActivities> {
  List<Map<String, dynamic>> activities = [];

  @override
  void initState() {
    super.initState();
    fetchActivities();
  }

  Future<void> fetchActivities() async {
    final data = await DatabaseHelper.instance.getActivities();
    setState(() {
      activities = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Activities'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ActivityDetailsPage(activity: activity),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            activity['image'] ?? 'assets/images/placeholder.jpg',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 200,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                activity['name'] ?? 'Unknown Activity',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                activity['location'] ?? 'Unknown Location',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
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
      ),
    );
  }
}