import 'package:bigkoapp/Google_Maps/showridertorenter.dart';
import 'package:bigkoapp/Renter/Renter-Side-Screens/RenterChatHistory.dart';
import 'package:bigkoapp/Renter/Renter-Side-Screens/RenterHistory.dart';
import 'package:bigkoapp/Renter/Renter-Side-Screens/RenterProfile.dart';
import 'package:flutter/material.dart';

class RenterSideTabView extends StatefulWidget {
  const RenterSideTabView({Key? key}) : super(key: key);

  @override
  State<RenterSideTabView> createState() => _RenterSideTabViewState();
}

class _RenterSideTabViewState extends State<RenterSideTabView>
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
    return Scaffold(
      body: TabBarView(
        children: const [
          ShowRiderTrackingToRenter(),
          RenterChatHistory(),
          RenterHistory(),
          Rentbikenow()
        ],
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
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
    );
  }
}
