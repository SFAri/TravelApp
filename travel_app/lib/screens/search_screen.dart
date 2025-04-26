import 'package:flutter/material.dart';
import 'package:travel_app/screens/destination_detail.dart';
import 'package:travel_app/utils/destination_data.dart';

class SearchScreen extends StatefulWidget {
  final String query;
  const SearchScreen({super.key, required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Map<String, dynamic>> filteredDestinations = [];

  @override
  void initState() {
    super.initState();
    // Gọi hàm filter để lọc danh sách ngay khi khởi tạo
    _filterDestinations(widget.query);
  }

  void _filterDestinations(String query) {
    final filtered = destinations.where((destination) {
      return destination['name'].toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredDestinations = filtered;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search destination'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  label: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                onChanged: _filterDestinations,
                initialValue: widget.query,
              ),
            ),

            Row(
              spacing: 10,
              children: [
                Text('Result', style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),),
                Expanded(child: Divider()),
              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: filteredDestinations.isEmpty
                  ? Center(
                      child: Text(
                        'No matching destinations found.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredDestinations.length,
                      itemBuilder: (context, index) {
                        final destination = filteredDestinations[index];
                        return Card(
                          child: ListTile(
                            leading: SizedBox(width: 80, child: Image.asset(destination['imageUrl'])),
                            title: Text(destination['name']),
                            subtitle: Text(destination['description']),
                            trailing: Text('\$${destination['price']}'),
                            onTap: () {
                              // Navigate to detail screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DestinationDetailScreen(
                                    destination: destination,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}