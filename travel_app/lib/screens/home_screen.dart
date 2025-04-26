import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screens/destination_detail.dart';
import 'package:travel_app/screens/search_screen.dart';
import 'package:travel_app/utils/constants/image_string.dart';
import 'package:travel_app/utils/destination_data.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late CarouselSliderController controller;
  late int selected;

  @override
  void initState() {
    selected = 0;
    controller = CarouselSliderController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Guide'),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        // physics: AlwaysScrollableScrollPhysics(),       
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.vertical,
        child: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              spacing: 5,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),
                ),
                IconButton(
                  onPressed: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const SearchScreen()),
                    );
                  }, 
                  icon: Icon(Icons.search)
                )
              ],
            ),

            CarouselSlider(
              carouselController: controller,
              options: CarouselOptions(
                viewportFraction: 1,
                enlargeCenterPage: true,
                autoPlay: true,
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    selected = index;
                  });
                },
              ),
              items: [
                GestureDetector(
                  onTap: (){},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(image: AssetImage(CImages.daLat))
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(image: AssetImage(CImages.haLong))
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(image: AssetImage(CImages.hue))
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(image: AssetImage(CImages.phuQuoc))
                  ),
                ),
              ]
            ),

            // Indicators:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                3, 
                (index) {
                  bool isCurrent = selected == index;
                  return GestureDetector(
                    onTap: () {
                      controller.animateToPage(index);
                    },
                    child: AnimatedContainer(
                      width: isCurrent ? 55 : 17,
                      height: 10,
                      margin: EdgeInsets.symmetric(horizontal: isCurrent ? 6 : 3),
                      duration: Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: isCurrent ? Colors.blue.shade200 : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12)
                      ),
                    ),
                  );
                }  
              ),
            ),

            Row(
              spacing: 10,
              children: [
                Text('Popular places', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Divider(thickness: 2, height: 2, color: Colors.grey,)
              ],
            ),

            Container(
              height: 350,
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: destinations.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Image.asset(destinations[index]['imageUrl']!),
                      title: Text(destinations[index]['name']!),
                      subtitle: Text(destinations[index]['description']!),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DestinationDetailScreen(
                              destination: destinations[index],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: (){},
                child: Text('view more >>>', style: TextStyle(color: Colors.blue),),
              ),
            )
          ],
        ),
      ),
    );
  }
}