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
    time: 'Morning',
    description: 'Arrive in Siem Reap, the gateway to the Angkor region.',
  ),
  ItineraryItem(
    time: 'Afternoon',
    description: 'Visit the Angkor National Museum to get an overview of the Angkor archaeological sites.',
  ),
  ItineraryItem(
    time: 'Relaxation',
    description: 'Enjoy a leisurely swim or spa treatment at your hotel.',
  ),
  ItineraryItem(
    time: 'Explore',
    description: 'Stroll around the Old Market area and browse local handicrafts and souvenirs.',
  ),
  ItineraryItem(
    time: 'Dinner',
    description: 'Experience Khmer cuisine at a traditional Cambodian restaurant.',
  ),
  // Add more itinerary items for other days...
  ItineraryItem(
    time: 'Morning',
    description: 'Explore the iconic Angkor Wat temple complex and watch the sunrise over the majestic ruins.',
  ),
  ItineraryItem(
    time: 'Afternoon',
    description: ': Visit Bayon Temple and Ta Prohm, famous for its intertwined tree root',
  ),
  ItineraryItem(
    time: 'Relaxation',
    description: ' Return to your hotel for a refreshing dip in the pool or a relaxing massage.',
  ),
  ItineraryItem(
    time: 'Explore',
    description: ' Wander through Siem Reap Artisans Angkor workshops to see local artisans at work.',
  ),
  ItineraryItem(
    time: 'Dinner',
    description: 'Enjoy a fine dining experience at a restaurant overlooking the Siem Reap River.',
  ),
];

class CambodiaScreen extends StatefulWidget {
  const CambodiaScreen({Key? key}) : super(key: key);

  @override
  _CambodiaScreenState createState() => _CambodiaScreenState();
}

class _CambodiaScreenState extends State<CambodiaScreen> {
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
            'Cambodia',
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