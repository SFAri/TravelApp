import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/providers/settings_provider.dart';
import 'package:travel_app/screens/destination_detail.dart';
import 'package:travel_app/screens/search_screen.dart';
import 'package:travel_app/screens/settings_screen.dart';
import 'package:travel_app/utils/constants/image_string.dart';
import 'package:travel_app/utils/destination_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late CarouselSliderController controller;
  late int selected;
  final TextEditingController _searchController = TextEditingController();
  String? _selectedLanguage;

  @override
  void initState() {
    selected = 0;
    controller = CarouselSliderController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Locale currentLocale = Localizations.localeOf(context);
    if (currentLocale.languageCode == 'en') {
      _selectedLanguage = AppLocalizations.of(context)!.englishLanguage;
    } else if (currentLocale.languageCode == 'vi') {
      _selectedLanguage = AppLocalizations.of(context)!.vietnameseLanguage;
    } else if (currentLocale.languageCode == 'ja') {
      _selectedLanguage = AppLocalizations.of(context)!.japaneseLanguage;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  void _showLanguageSelectionDialog(SettingsProvider settingsProvider) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) {

        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              ListTile(
                title: Text(AppLocalizations.of(context)!.englishLanguage),
                trailing: _selectedLanguage == AppLocalizations.of(context)!.englishLanguage
                  ? const Icon(Icons.check, color: Colors.blue)
                  : null,
                onTap: () {
                  settingsProvider.changeLocale(const Locale('en')); // Change locale to English
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(AppLocalizations.of(context)!.vietnameseLanguage),
                trailing: _selectedLanguage == AppLocalizations.of(context)!.vietnameseLanguage
                  ? const Icon(Icons.check, color: Colors.blue)
                  : null,
                onTap: () {
                  settingsProvider.changeLocale(const Locale('vi')); // Change locale to Vietnamese
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(AppLocalizations.of(context)!.japaneseLanguage),
                trailing: _selectedLanguage == AppLocalizations.of(context)!.japaneseLanguage
                  ? const Icon(Icons.check, color: Colors.blue)
                  : null,
                onTap: () {
                  settingsProvider.changeLocale(const Locale('ja')); // Change locale to Japanese
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Travel Guide'),
        title: Text(AppLocalizations.of(context)!.homeAppbar),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              _showLanguageSelectionDialog(context.read<SettingsProvider>());
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SettingsScreen(),
                ),
              );
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
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.hintSearchbar,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                  ),
                ),
                IconButton(
                  onPressed: (){
                    String searchValue = _searchController.text;
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => SearchScreen(query: searchValue)),
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
                    child: Image(image: AssetImage(CImages.waterPuppetShow))
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
                    child: Image(image: AssetImage(CImages.baNa))
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
                Text(AppLocalizations.of(context)!.popularPlaces, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Divider(thickness: 2, height: 2, color: Colors.grey,)
              ],
            ),

            Container(
              height: 350,
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: SizedBox(
                        width: 80,
                        child: Image.asset(destinations[index]['imageUrl']!)
                      ),
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
                child: Text(AppLocalizations.of(context)!.viewButton, style: TextStyle(color: Colors.blue),),
              ),
            )
          ],
        ),
      ),
    );
  }
}