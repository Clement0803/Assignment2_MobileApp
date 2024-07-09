// cart_page.dart
import 'package:flutter/material.dart';
import 'package:assignment1_mobile_application/models/cart_model.dart';
import 'package:assignment1_mobile_application/models/booking_model.dart' as booking_model;
import 'package:assignment1_mobile_application/screens/myBooking_page.dart';

class CartPages extends StatefulWidget {
  final CartModel cartModel;

  CartPages({required this.cartModel});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPages> {
  void _removeHotel(int index) {
    setState(() {
      widget.cartModel.removeHotel(index);
    });
  }

  void _bookHotel(int index) {
    final hotel = widget.cartModel.hotels[index];
    setState(() {
      widget.cartModel.bookHotel(hotel);
      _removeHotel(index);
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyBookingPage(bookings: List<booking_model.Booking>.from(widget.cartModel.bookings)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Cart',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.cartModel.hotels.length,
        itemBuilder: (context, index) {
          final hotel = widget.cartModel.hotels[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(
                hotel.image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(hotel.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${hotel.location}'),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      Text('${hotel.rating}'),
                    ],
                  ),
                  Text('${hotel.price}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      _removeHotel(index);
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _bookHotel(index);
                    },
                    child: const Text('Book Now'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
