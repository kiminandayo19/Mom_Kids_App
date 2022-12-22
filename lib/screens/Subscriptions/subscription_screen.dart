import 'package:flutter/material.dart';
import 'package:mom_and_kids_app/Widgets/AppBars/navAppBar.dart';
import '../../Widgets/circle_indicator.dart';
import '../../components/Subscription/subscript_components.dart';

class Subscription extends StatefulWidget {
  static String routesName = "/subscript";
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavAppBar(
        useLeading: true,
        useActions: false,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 20,
        ),
        child: const Subscript(),
      ),
    );
  }
}

class Subscript extends StatefulWidget {
  const Subscript({super.key});

  @override
  State<Subscript> createState() => _SubscriptState();
}

class _SubscriptState extends State<Subscript> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Subscription",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: "Avenir-Black",
            fontWeight: FontWeight.bold,
          ),
        ),
        TabBar(
          controller: _tabController,
          labelPadding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          labelColor: Colors.black,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            fontFamily: "Avenir-Roman",
          ),
          unselectedLabelColor: Colors.black,
          unselectedLabelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            fontFamily: "Avenir-Roman",
          ),
          indicator: const CircleIndicator(
            color: Colors.black,
            radius: 4,
          ),
          tabs: const [
            Text("Starter"),
            Text("Classic"),
            Text("Premium"),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              Script(
                index: 2,
              ),
              Script(
                index: 3,
              ),
              Script(
                index: 4,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
