import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screens/category_screen.dart';
import 'package:travel_app/screens/destination_detail.dart';
import 'package:travel_app/screens/widgets/navigation_menu.dart';
import 'package:travel_app/utils/constants/image_string.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> destinations = [
    {
      'name': 'Hồ Gươm',
      'description': 'Nơi đẹp nhất Hà Nội',
      'imageUrl': CImages.phuQuoc,
    },
    {
      'name': 'Tháp Eiffel',
      'description': 'Biểu tượng của Paris',
      'imageUrl': CImages.daLat,
    },
    {
      'name': 'Tượng Nữ thần Tự do',
      'description': 'Biểu tượng tự do của Mỹ',
      'imageUrl': CImages.vungTau,
    },
    {
      'name': 'Vịnh Hạ Long',
      'description': 'Kỳ quan thiên nhiên thế giới',
      'imageUrl': CImages.haLong,
    },
  ];

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
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.vertical,
        child: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: [
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
              height: 500,
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
          ],
        ),
      ),
    );
  }
}