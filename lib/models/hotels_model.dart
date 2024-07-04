class Hotel {
  final String name;
  final String location;
  final double rating;
  final String image;
  final String price;

  Hotel({
    required this.name,
    required this.location,
    required this.rating,
    required this.image,
    required this.price,
  });
}

class Booking {
  final String name;
  final String location;
  final DateTime date;
  final int guests;
  final String bookingId;
  final String image;
  String status;

  Booking({
    required this.name,
    required this.location,
    required this.date,
    required this.guests,
    required this.bookingId,
    required this.image,
    this.status = 'Upcoming',
  });

  Booking copyWith({String? status}) {
    return Booking(
      name: this.name,
      location: this.location,
      date: this.date,
      guests: this.guests,
      bookingId: this.bookingId,
      image: this.image,
      status: status ?? this.status,
    );
  }
}
