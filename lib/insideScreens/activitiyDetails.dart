import 'package:flutter/material.dart';
import 'package:assignment1_mobile_application/insideScreens/bookingActivities.dart';
import 'package:assignment1_mobile_application/db_service.dart';

class ActivityDetailsPage extends StatefulWidget {
  final Map<String, dynamic> activity;

  ActivityDetailsPage({required this.activity});

  @override
  _ActivityDetailsPageState createState() => _ActivityDetailsPageState();
}

class _ActivityDetailsPageState extends State<ActivityDetailsPage> {
  int numberOfBookings = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.activity['name'] ?? 'Activity Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                widget.activity['image'] ?? 'assets/images/placeholder.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              widget.activity['name'] ?? 'Unknown Activity',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              widget.activity['location'] ?? 'Unknown Location',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              widget.activity['description'] ?? 'No description available.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (numberOfBookings > 0) {
                      setState(() {
                        numberOfBookings--;
                      });
                    }
                  },
                ),
                Text(
                  '$numberOfBookings',
                  style: TextStyle(fontSize: 20),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      numberOfBookings++;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement booking functionality using numberOfBookings
                    // Example: Navigator.push(...);
                  },
                  child: Text('Book Now'),
                ),
                SizedBox(width: 18),
                ElevatedButton(
                  onPressed: () {
                    // Implement booking functionality using numberOfBookings
                    // Example: Navigator.push(...);
                  },
                  child: Text('Add to Cart'),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
