import 'package:assignment1_mobile_application/insideScreens/bookingFlight.dart';
import 'package:assignment1_mobile_application/insideScreens/bookingHotels.dart';
import 'package:flutter/material.dart';
import 'package:assignment1_mobile_application/models/placeDetailsPage.dart';
import 'package:assignment1_mobile_application/insideScreens/bookingActivities.dart';
import 'package:video_player/video_player.dart';

class TripsHome extends StatefulWidget {
  @override
  _TripsHomeState createState() => _TripsHomeState();
}

class _TripsHomeState extends State<TripsHome> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/videos/video.mp4')
      ..initialize().then((_) {
        setState(() {});
        _videoController.play();
      });
    _videoController.setLooping(true);
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  List recommendedPlaces = [
    {
      'name': 'Petronas Towers',
      'location': 'Kuala Lumpur',
      'rating': '4.8',
      'image': 'assets/images/petronas.jpg',
      'description': 'The Petronas Towers are an iconic landmark in Kuala Lumpur, Malaysia. They were the tallest buildings in the world from 1998 to 2004 and remain the tallest twin towers in the world.',
    },
    {
      'name': 'Mount Kinabalu',
      'location': 'Sabah',
      'rating': '4.9',
      'image': 'assets/images/kinabalu.jpg',
      'description': 'Mount Kinabalu is the highest peak in Borneo\'s Crocker Range and the highest mountain in the Malay Archipelago. It is known for its rich biodiversity and stunning views.',
    },
    {
      'name': 'Penang ',
      'location': 'Penang',
      'rating': '4.7',
      'image': 'assets/images/penang.jpg',
      'description': 'Penang is a Malaysian state located on the northwest coast of Peninsular Malaysia. It is known for its historic George Town, beautiful beaches, and vibrant street food culture.',
    },
    {
      'name': 'Gunung Mulu',
      'location': 'Sarawak',
      'rating': '4.6',
      'image': 'assets/images/mulu.jpg',
      'description': 'Gunung Mulu National Park is a UNESCO World Heritage Site famous for its limestone karst formations, caves, and diverse ecosystems. It is located in the Malaysian state of Sarawak on the island of Borneo.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hello There,',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Hotels Container
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingHotels(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.hotel_outlined,
                            color: Colors.deepPurpleAccent,
                            size: 25,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'Hotels',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Book Your Amazing Hotels',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),

                // Activities Container
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingActivities(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.local_activity_outlined,
                            color: Colors.deepPurpleAccent,
                            size: 25,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'Activities',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Find Your Next Adventure',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),

                // Booking Container
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingFlight(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.flight_outlined,
                            color: Colors.deepPurpleAccent,
                            size: 25,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'Flight',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Book Your Wonderful Journey',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),

          // Video Player Section
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Malaysian Hospitality ',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: _videoController.value.isInitialized
                ? AspectRatio(
              aspectRatio: _videoController.value.aspectRatio,
              child: VideoPlayer(_videoController),
            )
                : const Center(child: CircularProgressIndicator()),
          ),
          const SizedBox(height: 16),

          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "Recommended",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: recommendedPlaces.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final place = recommendedPlaces[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlaceDetailsPage(place: place),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          place['image'],
                          width: 150,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        place['name'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.pin_drop_outlined,
                            color: Colors.grey,
                          ),
                          Text(
                            place['location'],
                            style: const TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text(
                            place['rating'],
                            style: const TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
