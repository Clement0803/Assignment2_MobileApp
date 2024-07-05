import 'package:assignment1_mobile_application/models/booking_model.dart' as booking_model;
import 'package:assignment1_mobile_application/models/hotels_model.dart';

class CartModel {
  List<Hotel> hotels = [

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
      bookingId: 'BK${DateTime.now()}',
      status: 'Upcoming',
      image: hotel.image,
    );
    bookings.add(booking);
  }
}
