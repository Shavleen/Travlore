import 'package:flutter/material.dart';
import 'LandingPage.dart';

class ItineraryItem {
  final String time;
  final String description;

  ItineraryItem({
    required this.time,
    required this.description,
  });
}

List<ItineraryItem> itineraryItems = [
  ItineraryItem(
    time: '8:00 am',
    description: 'Lorem ipsum dolor sit amet',
  ),
  ItineraryItem(
    time: '12:00 pm',
    description: 'Lorem ipsum dolor sit amet',
  ),
  ItineraryItem(
    time: '2:00 pm',
    description: 'Lorem ipsum dolor sit amet',
  ),
  ItineraryItem(
    time: '3:00 pm',
    description: 'Lorem ipsum dolor sit amet',
  ),
  ItineraryItem(
    time: '5:00 pm',
    description: 'Lorem ipsum dolor sit amet',
  ),
];

class ItineraryScreen extends StatelessWidget {
  const ItineraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Itinerary'),
      ),
      body: Column(
        children: [
          const Text(
              'Location',
              style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF8599CB)
              ),

          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  backgroundColor: const Color(0xFF42744E),
                  foregroundColor: Colors.white,
                  splashFactory: NoSplash.splashFactory,
                ),
                onPressed: () {
                  // Add button press logic here
                },
                child: const Text('Day 1'),
              ),
              const SizedBox(width: 0), // Add spacing between the buttons
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  backgroundColor: const Color(0xFF588B65),
                  foregroundColor: Colors.white,
                  splashFactory: NoSplash.splashFactory,

                ),
                onPressed: () {
                  // Your onPressed code here
                },
                child: const Text('Day 2'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: itineraryItems.length,
              itemBuilder: (context, index) {
                final item = itineraryItems[index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.time,
                              style: const TextStyle(fontSize: 16),
                            ),

                          ],
                        ),
                      ),
                      Expanded(
                        child: Text(
                          item.description,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
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

