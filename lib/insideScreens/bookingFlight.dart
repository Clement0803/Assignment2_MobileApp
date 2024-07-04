import 'package:flutter/material.dart';

class BookingFlight extends StatefulWidget {
  @override
  _BookingFlightState createState() => _BookingFlightState();
}

class _BookingFlightState extends State<BookingFlight> {
  DateTime? _checkInDate;
  DateTime? _checkOutDate;
  int _numAdults = 1;
  int _numChildren = 0;

  Future<void> _selectDate(BuildContext context, bool isCheckIn) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: (isCheckIn ? _checkInDate : _checkOutDate) ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isCheckIn) {
          _checkInDate = picked;
          if (_checkOutDate != null && _checkOutDate!.isBefore(picked)) {
            _checkOutDate = picked.add(const Duration(days: 1));
          }
        } else {
          _checkOutDate = picked;
        }
      });
    }
  }

  void _selectGuests(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Select Guests",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Adults", style: TextStyle(fontSize: 16)),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              if (_numAdults > 1) {
                                setModalState(() {
                                  _numAdults--;
                                });
                                setState(() {});
                              }
                            },
                          ),
                          Text('$_numAdults', style: const TextStyle(fontSize: 16)),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              setModalState(() {
                                _numAdults++;
                              });
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Children", style: TextStyle(fontSize: 16)),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              if (_numChildren > 0) {
                                setModalState(() {
                                  _numChildren--;
                                });
                                setState(() {});
                              }
                            },
                          ),
                          Text('$_numChildren', style: const TextStyle(fontSize: 16)),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              setModalState(() {
                                _numChildren++;
                              });
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Done"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 70, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.black,
                ),
                const Text(
                  "Book a Flight",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _searchFlyingfrom(),
                      const SizedBox(height: 10),
                      _searchFlyingto(),
                      const SizedBox(height: 10),
                      _dateRow(),
                      const SizedBox(height: 10),
                      _guestField(context),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: (){},
                          child: const Text('Search'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _searchFlyingfrom() {
    return Container(
      margin: const EdgeInsets.only(left: 0, right: 0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.10),
            blurRadius: 30,
            spreadRadius: 8,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(15),
          hintText: 'Flying from',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Padding(
              padding:  EdgeInsets.all(12.0),
              child: Icon(
                Icons.flight_takeoff_outlined,
                color: Colors.black54,
              )
          ),
        ),
      ),
    );
  }

  Container _searchFlyingto() {
    return Container(
      margin: const EdgeInsets.only(left: 0, right: 0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.10),
            blurRadius: 30,
            spreadRadius: 8,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(15),
          hintText: 'Flying to',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Padding(
              padding:  EdgeInsets.all(12.0),
              child: Icon(
                Icons.flight_land_outlined,
                color: Colors.black54,
              )
          ),
        ),
      ),
    );
  }

  Widget _dateRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Row(
        children: [
          Expanded(child: _dateField(context, 'Depart', _checkInDate, true)),
          const SizedBox(width: 10),
          Expanded(child: _dateField(context, 'Return', _checkOutDate, false)),
        ],
      ),
    );
  }

  Container _dateField(BuildContext context, String label, DateTime? date, bool isCheckIn) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.10),
            blurRadius: 30,
            spreadRadius: 8,
          ),
        ],
      ),
      child: TextField(
        readOnly: true,
        onTap: () => _selectDate(context, isCheckIn),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(15),
          hintText: date == null ? label : '${date.toLocal()}'.split(' ')[0],
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          suffixIcon: const Icon(
            Icons.calendar_today,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _guestField(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectGuests(context),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.10),
              blurRadius: 30,
              spreadRadius: 8,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Guests',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            Text(
              '$_numAdults Adults, $_numChildren Children',
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
            const Icon(
              Icons.person,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

