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
    time: 'Arrival TO Fiji',
    description: 'Arrive at Nadi International Airport',
  ),
  ItineraryItem(
    time: 'Hotel arrival',
    description: 'Transfer to your hotel or resort',
  ),
  ItineraryItem(
    time: 'Relaxation',
    description: 'Relax and unwind at the beach',
  ),
  ItineraryItem(
    time: 'Explore',
    description: 'Explore the local markets and shops in Nadi town',
  ),
  ItineraryItem(
    time: 'Dinner',
    description: 'Enjoy a traditional Fijian dinner at a local restaurant.',
  ),
  // Add more itinerary items for other days...
  ItineraryItem(
    time: 'Morning',
    description: 'Start your day with a hearty breakfast at your resort or a local café. Enjoy some fresh tropical fruits, pastries, and perhaps some Fijian specialties like Kokoda (a Fijian ceviche).',
  ),
  ItineraryItem(
    time: 'Afternoon',
    description: 'Spend your afternoon exploring the local culture and heritage. Visit a nearby village to learn about Fijian customs, traditions, and perhaps even participate in a kava ceremony, a traditional Fijian welcome ritual.',
  ),
  ItineraryItem(
    time: 'Relaxation',
    description: 'After a busy day of activities, take some time to relax and unwind. Lounge by the pool or on the beach with a good book, sip on a refreshing cocktail, or simply enjoy the breathtaking sunset over the Pacific Ocean.',
  ),
  ItineraryItem(
    time: 'Explore',
    description: 'As the evening approaches, embark on a short exploration adventure. Take a sunset cruise to witness the stunning colors of the Fijian sunset reflecting off the water, or go for a guided nature walk to discover the island for its flora and fauna.',
  ),
  ItineraryItem(
    time: 'Dinner',
    description: 'Conclude your day with a sumptuous dinner at a fine dining restaurant or a traditional Fijian feast under the stars. Indulge in fresh seafood, grilled meats, and delectable desserts while enjoying live music and entertainment.',
  ),
];

class ItineraryScreen extends StatefulWidget {
  const ItineraryScreen({Key? key}) : super(key: key);

  @override
  _ItineraryScreenState createState() => _ItineraryScreenState();
}

class _ItineraryScreenState extends State<ItineraryScreen> {
  int _selectedDay = 0; // Default to show Day 1

  List<List<ItineraryItem>> get groupedItineraryItems {
    List<List<ItineraryItem>> groupedItems = [];
    for (int i = 0; i < itineraryItems.length; i += 5) {
      groupedItems.add(itineraryItems.sublist(i, i + 5));
    }
    return groupedItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Itinerary'),
      ),
      body: Column(
        children: [
          const Text(
            'Fiji',
            style: TextStyle(
              fontSize: 24,
              color: Color(0xFF8599CB),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < groupedItineraryItems.length; i++)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedDay = i;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedDay == i ? Colors.blue : null,
                  ),
                  child: Text('Day ${i + 1}'),
                ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: groupedItineraryItems[_selectedDay].length,
              itemBuilder: (context, index) {
                final item = groupedItineraryItems[_selectedDay][index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.time,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.description,
                        style: const TextStyle(fontSize: 16),
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