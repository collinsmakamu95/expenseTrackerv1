import 'package:flutter/material.dart';
import 'mainInterfaces/homeInterface.dart';
import 'mainInterfaces/accountInterface.dart';
import 'mainInterfaces/upcomingTransactionsInterface.dart';
import 'mainInterfaces/transactionsInterface.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home:  HomeNavigationInterface(0),
    );
  }
}

class HomeNavigationInterface extends StatefulWidget {
  HomeNavigationInterface(this.currentIndex, {super.key});
  int currentIndex;

  @override
  State<HomeNavigationInterface> createState() => _HomeNavigationInterfaceState();
}

class _HomeNavigationInterfaceState extends State<HomeNavigationInterface> {
  final screens=[
    const HomeInterface(),
    const TransactionInterface(),
    const PastTransactionsInterface(),
    const AccountInterface(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: widget.currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.greenAccent,
          currentIndex: widget.currentIndex,
          onTap: (index) => setState(() {
            widget.currentIndex = index;
          }),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.money), label: "Upcoming"),
            BottomNavigationBarItem(
                icon: Icon(Icons.credit_card), label: "Past"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
          ],
        ));
  }
}
