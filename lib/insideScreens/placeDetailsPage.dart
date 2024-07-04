import 'package:flutter/material.dart';

class PlaceDetailsPage extends StatelessWidget {
  final Map place;

  const PlaceDetailsPage({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                place['image'],
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              place['name'],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.add_location_alt_outlined,
                  color: Colors.green,
                ),
                Text(
                  place['location'],
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.star_rounded,
                  color: Colors.yellow,
                ),
                Text(
                  place['rating'],
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              place['description'],
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
