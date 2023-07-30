import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({super.key, this.locationUpdate});
  final Function(String)? locationUpdate;

  @override
  Widget build(BuildContext context) {
    String location = '20041075 | TAP-NS TAP-North Strathfield';
    if (locationUpdate != null) {
      locationUpdate!(location);
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      color: Colors.white,
      child: Row(
        children: [
          const Icon(Icons.location_on, color: Colors.black54, size: 30),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(location),
          )
        ],
      ),
    );
  }
}
