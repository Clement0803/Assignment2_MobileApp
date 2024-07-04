import 'package:assignment1_mobile_application/models/booking_model.dart' as booking_model;
import 'package:assignment1_mobile_application/models/hotels_model.dart';

class CartModel {
  List<Hotel> hotels = [
    Hotel(
      name: 'Villa Hotel',
      location: 'Kuala-Lumpur',
      rating: 4.5,
      image: 'assets/images/hotel1.jpg',
      price: 'RM 278',
    ),
    Hotel(
      name: 'Sri Hotel',
      location: 'Kuching',
      rating: 4.7,
      image: 'assets/images/hotel2.jpg',
      price: 'RM 98',
    ),
  ];

  List<booking_model.Booking> bookings = [];

  void removeHotel(int index) {
    hotels.removeAt(index);
  }

  void bookHotel(Hotel hotel) {
    final booking = booking_model.Booking(
      name: hotel.name,
      location: hotel.location,
      date: DateTime.now(), // Placeholder date
      guests: 2, // Placeholder number of guests
      bookingId: 'BK${DateTime.now().millisecondsSinceEpoch}',
      status: 'Upcoming',
      image: hotel.image,
    );
    bookings.add(booking);
  }
}
