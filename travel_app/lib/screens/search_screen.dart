import 'package:flutter/material.dart';
import 'package:travel_app/screens/destination_detail.dart';
import 'package:travel_app/utils/destination_data.dart';

class SearchScreen extends StatefulWidget {

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Map<String, dynamic>> filteredDestinations = [];
  String query = '';

  @override
  void initState() {
    super.initState();
    filteredDestinations = destinations;
  }

  void _filterDestinations(String query) {
    final filtered = destinations.where((destination) {
      return destination['name'].toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      this.query = query;
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
            Row(
              spacing: 5,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    onChanged: _filterDestinations,
                  ),
                ),
                IconButton(
                  onPressed: (){}, 
                  icon: Icon(Icons.search)
                )
              ],
            ),

            Row(
              spacing: 10,
              children: [
                Text('Result', style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),),
                Expanded(child: Divider()),
              ],
            ),

            Container(
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
                            leading: Image.asset(destination['imageUrl']),
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