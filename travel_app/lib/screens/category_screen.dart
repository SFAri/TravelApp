import 'package:flutter/material.dart';
import 'package:travel_app/screens/widgets/destination_list.dart' show DestinationListWidget;
import 'package:travel_app/utils/destination_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> with SingleTickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.categoryAppbar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Tabbar:
            TabBar(
              padding: EdgeInsets.zero,
              isScrollable:  true,
              indicatorColor: Colors.blue,
              tabAlignment: TabAlignment.center,
              unselectedLabelColor: Colors.grey.shade600,
              labelColor: Colors.blue,
              controller: tabController,
              tabs: [
                Tab(child: Text(AppLocalizations.of(context)!.natureCategory)),
                Tab(child: Text(AppLocalizations.of(context)!.historicalCategory)),
                Tab(child: Text(AppLocalizations.of(context)!.culturalCategory)),
                Tab(child: Text(AppLocalizations.of(context)!.entertainmentCategory)),
              ]
            ),
            SizedBox(
              height: 550,
              child: TabBarView(
                controller: tabController,
                children: [
                  DestinationListWidget(
                    destinations: destinations.where((d) => d['category'] == 'Nature').toList(),
                  ),
                  DestinationListWidget(
                    destinations: destinations.where((d) => d['category'] == 'Historical').toList(),
                  ),
                  DestinationListWidget(
                    destinations: destinations.where((d) => d['category'] == 'Cultural').toList(),
                  ),
                  DestinationListWidget(
                    destinations: destinations.where((d) => d['category'] == 'Entertainment').toList(),
                  ),
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}