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
    time: 'Arrival in Panama City',
    description: 'Arrive at Tocumen International Airport',
  ),
  ItineraryItem(
    time: 'Hotel Check-in',
    description: 'Transfer to your hotel in Panama City',
  ),
  ItineraryItem(
    time: 'Relaxation',
    description: 'Relax and unwind at the hotel or explore the local neighborhood',
  ),
  ItineraryItem(
    time: 'Explore Casco Viejo',
    description: 'Explore the historic Casco Viejo district with its colonial architecture and charming cobblestone streets',
  ),
  ItineraryItem(
    time: 'Dinner',
    description: 'Enjoy a traditional Panamanian dinner at a local restaurant.',
  ),
  ItineraryItem(
    time: 'Visit Biomuseo',
    description: 'Explore the Biomuseo, a museum dedicated to Panama\'s biodiversity, designed by renowned architect Frank Gehry.',
  ),
  ItineraryItem(
    time: 'Cinta Costera Walk',
    description: 'Take a leisurely stroll along the Cinta Costera waterfront promenade, offering panoramic views of Panama City\'s skyline and the Pacific Ocean.',
  ),
  ItineraryItem(
    time: 'Shopping at Multicentro',
    description: 'Indulge in some retail therapy at Multicentro, one of Panama City\'s largest shopping malls, featuring a variety of local and international brands.',
  ),
  ItineraryItem(
    time: 'Visit Panama Canal Museum',
    description: 'Learn more about the history and significance of the Panama Canal at the Panama Canal Museum, located in the Casco Viejo district.',
  ),
  ItineraryItem(
    time: 'Sunset at Amador Causeway',
    description: 'Head to the Amador Causeway in the evening to enjoy a breathtaking sunset over the Pacific Ocean, with views of the Bridge of the Americas and Panama City skyline.',
  ),
];

class PanamaScreen extends StatefulWidget {
  const PanamaScreen({Key? key}) : super(key: key);

  @override
  _PanamaScreenState createState() => _PanamaScreenState();
}

class _PanamaScreenState extends State<PanamaScreen> {
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
            'Panama',
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