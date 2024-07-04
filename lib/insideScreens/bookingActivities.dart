import 'package:flutter/material.dart';

class BookingActivities extends StatelessWidget {
  final List activities = [
    {
      'name': 'Batu Caves Tour',
      'location': 'Selangor',
      'image': 'assets/images/batu_caves.jpg',
    },
    {
      'name': 'Scuba Diving',
      'location': 'Sipadan Island',
      'image': 'assets/images/diving.jpg',
    },
    {
      'name': 'Jungle Trekking',
      'location': 'Taman Negara',
      'image': 'assets/images/trekking.jpg',
    },
    {
      'name': 'City Tour',
      'location': 'Kuala Lumpur',
      'image': 'assets/images/city_tour.jpg',
    },
    {
      'name': 'Island Hopping',
      'location': 'Langkawi',
      'image': 'assets/images/island_hopping.jpg',
    },
    {
      'name': 'River Cruise',
      'location': 'Melaka',
      'image': 'assets/images/river_cruise.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Booking Activities'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search Activities',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {

              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            activity['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              activity['name'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              activity['location'],
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}