import 'package:flutter/material.dart';
import 'package:assignment1_mobile_application/models/booking_model.dart' as booking_model;

class MyBookingPage extends StatefulWidget {
  final List<booking_model.Booking> bookings;

  MyBookingPage({required this.bookings});

  @override
  _MyBookingPageState createState() => _MyBookingPageState();
}

class _MyBookingPageState extends State<MyBookingPage> {
  String filter = 'Upcoming';

  void _cancelBooking(int index) {
    setState(() {
      widget.bookings[index] = widget.bookings[index].copyWith(status: 'Cancel');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<booking_model.Booking> filteredBookings = widget.bookings.where((booking) => booking.status == filter).toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // This removes the back arrow
        title: const Text('My Bookings'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    filter = 'Upcoming';
                  });
                },
                child: const Text('Upcoming'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    filter = 'Complete';
                  });
                },
                child: const Text('Complete'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    filter = 'Cancel';
                  });
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredBookings.length,
              itemBuilder: (context, index) {
                final booking = filteredBookings[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.asset(
                      booking.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(booking.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Location: ${booking.location}'),
                        Text('Date: ${booking.date}'),
                        Text('Guests: ${booking.guests}'),
                        Text('Booking ID: ${booking.bookingId}'),
                      ],
                    ),
                    trailing: booking.status == 'Upcoming'
                        ? ElevatedButton(
                      onPressed: () {
                        _cancelBooking(index);
                      },
                      child: const Text('Cancel'),
                    )
                        : null,
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
