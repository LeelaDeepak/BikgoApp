import 'package:bigkoapp/Google_Maps/showavailablerentstoriderinmap.dart';
import 'package:bigkoapp/Rider-Side-Screens/RiderChatHistory.dart';
import 'package:bigkoapp/Rider-Side-Screens/RiderHistory.dart';
import 'package:bigkoapp/Rider-Side-Screens/RiderProfile.dart';
import 'package:flutter/material.dart';

class RiderSideTabView extends StatefulWidget {
  const RiderSideTabView({Key? key}) : super(key: key);

  @override
  State<RiderSideTabView> createState() => _RiderSideTabViewState();
}

class _RiderSideTabViewState extends State<RiderSideTabView>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedindex = 0;

  onItemClicked(int index) {
    setState(() {
      selectedindex = index;
      tabController!.index = selectedindex;
    });
    print("tabController=${tabController!.index}");
  }

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: TabBarView(
          children: const [
            ShowMapsOfBikestoRider(),
            RiderChatTab(),
            RiderHistoryTab(),
            RiderProfileTab()
          ],
          controller: tabController,
          physics: const NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: "History"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account")
          ],
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.yellow,
          backgroundColor: Colors.blue.shade900,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontSize: 14),
          showUnselectedLabels: true,
          currentIndex: selectedindex,
          onTap: onItemClicked,
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}
