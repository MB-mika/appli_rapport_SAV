import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:ts_sav/pages/HomePage.dart';
import 'package:ts_sav/pages/SuiviMaintenancePage.dart';
import 'package:ts_sav/pages/add_rapport_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  setCurrentIndex(int index) {
    setState
    (
      () { _currentIndex = index;}
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false, // Cette ligne permet de masquer le "debug" en haut à droite
      home: Scaffold(
        appBar: AppBar
        (
          backgroundColor: Colors.deepOrange,
          shadowColor: const Color.fromARGB(255, 43, 16, 25),
          title: const
              [
                Text("TIME-SHAKER S.A.V                       Accueil", style: TextStyle( color: Colors.white),),
                Text("Rapport des interventions",style: TextStyle( color: Colors.white),),
                Text("Formulaire création de rapport d'intervention",style: TextStyle( color: Colors.white, fontSize: 20),)

              ][_currentIndex],
              
        ),
        body: 
        [const
          HomePage(),
          const SuiviMaintenancePage(),
          const AddRapportPage()

        ][_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) => setCurrentIndex(index),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black,
            iconSize: 32,
            elevation: 20,
            backgroundColor: Colors.deepOrange,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Accueil',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: 'Effectuer',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Créer Rapport',
              ),
            ]),
      ),
    );
  }
}
