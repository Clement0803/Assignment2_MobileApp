import 'package:flutter/material.dart';
import 'package:assignment1_mobile_application/db_service.dart';
import 'package:assignment1_mobile_application/screens/ActCart_page.dart';
import 'package:assignment1_mobile_application/navigator_home.dart';

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
            const SizedBox(height: 16.0),
            Text(
              widget.activity['name'] ?? 'Unknown Activity',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.activity['location'] ?? 'Unknown Location',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              widget.activity['description'] ?? 'No description available.',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Guests:',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.remove),
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
                  style: const TextStyle(fontSize: 20),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      numberOfBookings++;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await DatabaseHelper.instance.addToCart(widget.activity, numberOfBookings);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                        settings: RouteSettings(
                          arguments:2,
                        ),
                      ),
                    );
                  },
                  child: const Text('Add to Cart'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
