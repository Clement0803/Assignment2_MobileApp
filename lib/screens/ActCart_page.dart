import 'package:flutter/material.dart';
import 'package:assignment1_mobile_application/db_service.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Future<List<Map<String, dynamic>>> _cartItemsFuture;

  @override
  void initState() {
    super.initState();
    _loadCartItems();
  }

  void _loadCartItems() {
    _cartItemsFuture = DatabaseHelper.instance.getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // This removes the back arrow
        title: const Text('Cart'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _cartItemsFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.data!.isEmpty) {
            return const Center(child: Text('No items in the cart'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final cartItem = snapshot.data![index];
              int numberOfBookings = cartItem['numberOfBookings'];

              return ListTile(
                leading: Image.asset(cartItem['image']),
                title: Text(cartItem['name']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cartItem['location']),
                    Text('Guests: $numberOfBookings'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () async {
                        final updatedBookings = await showDialog<int>(
                          context: context,
                          builder: (context) {
                            int tempNumberOfBookings = numberOfBookings;
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return AlertDialog(
                                  title: const Text('Update Number of Guests'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Current bookings: $numberOfBookings'),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.remove),
                                            onPressed: () {
                                              setState(() {
                                                if (tempNumberOfBookings > 1) {
                                                  tempNumberOfBookings--;
                                                }
                                              });
                                            },
                                          ),
                                          Text('$tempNumberOfBookings'),
                                          IconButton(
                                            icon: const Icon(Icons.add),
                                            onPressed: () {
                                              setState(() {
                                                tempNumberOfBookings++;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(tempNumberOfBookings);
                                      },
                                      child: const Text('Update'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );

                        if (updatedBookings != null && updatedBookings != numberOfBookings) {
                          await DatabaseHelper.instance.updateCartItem(
                            cartItem['cartId'],
                            updatedBookings,
                          );
                          setState(() {
                            _loadCartItems();
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Update successful'),
                            ),
                          );
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        await DatabaseHelper.instance.deleteCartItem(cartItem['cartId']);
                        setState(() {
                          _loadCartItems();
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Item deleted successfully'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
