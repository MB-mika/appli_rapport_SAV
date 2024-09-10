import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:ts_sav/models/invoice.dart';
import 'package:ts_sav/pages/detailMaintenancePage.dart';

// La classe SuiviMaintenancePage représente la page qui affiche la liste des rapports de maintenance
class SuiviMaintenancePage extends StatefulWidget {
  const SuiviMaintenancePage({super.key});

  @override
  State<SuiviMaintenancePage> createState() => _SuiviMaintenancePageState();
}

// L'état de la page SuiviMaintenancePage
class _SuiviMaintenancePageState extends State<SuiviMaintenancePage> {
  // La liste des rapports de maintenance, représentés par des objets Invoice
  final rapports = <Invoice>[
    Invoice(
      numeroRapport: " TSI-0002548",
      date: "05/06/2024 11:24:00",
      client: "Mr Dupuis Alain",
      numeroMachine: "ts-1234567",
      image: "mixoBois",
      email: "dupuis@gmail.com",
      connexionType: "Par câble",
      savType: "Sur place",
      versionMaj: "2.145",
      dateHeureDepart: "05/06/2024 14:47:00",
      etatMachineType: "Bon état",
      respectNetoyageType: "OUI",
    ),
    Invoice(
      numeroRapport: " TSI-0003324",
      date: "07/06/2024 10:12:00",
      client: "Camping Paradis",
      numeroMachine: "TS-0014789",
      image: "mixoBrique",
      email: "campingparadis@gmail.com",
      connexionType: "Par câble",
      savType: "Sur place",
      versionMaj: "2.145",
      dateHeureDepart: "07/06/2024 16:47:00",
      etatMachineType: "Bon état",
      respectNetoyageType: "NON",
    ),
    Invoice(
      numeroRapport: " TSI-00083254",
      date: "07/06/2024 15:08:00",
      client: "Le Concordia",
      numeroMachine: "Ts-00002587961",
      image: "mixoMetal",
      email: "concordia@gmail.com",
      connexionType: "Par câble",
      savType: "A distance",
      versionMaj: "2.145",
      dateHeureDepart: "07/06/2024 15:47:00",
      etatMachineType: "Très bon état",
      respectNetoyageType: "OUI",
    ),
  ];

 bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    // Affiche la liste des rapports de maintenance dans un ListView
    return Center(
      child: ListView.builder(
        itemCount: rapports.length, // Nombre de rapports à afficher
        itemBuilder: (context, index) {
          // Récupère les informations du rapport courant
          final rapport = rapports[index];
          final image = rapport.image;
          final numeroRapport = rapport.numeroRapport;
          final client = rapport.client;
          final date = rapport.date;

          // Crée un widget Card contenant les informations du rapport
        return Card(
  margin: const EdgeInsets.only(left: 36, top: 20, right: 36, bottom: 16),
  child: MouseRegion(
    onEnter: (_) {
      setState(() {
        _isHovered = true;
      });
    },
    onExit: (_) {
      setState(() {
        _isHovered = false;
      });
    },
    child: ListTile(
      hoverColor: Colors.deepOrangeAccent[100],
      leading: Image.asset("assets/images/$image.jpg"),
      title: Text(
        '$numeroRapport ($date)',
        style: TextStyle(
          color: _isHovered
              ? Colors.white // Couleur blanche au survol
              : Colors.deepOrange, // Couleur orange par défaut
        ),
      ),
      subtitle: Text(client),
      trailing: Icon(
        Icons.info,
        color: _isHovered
            ? Colors.white // Couleur blanche de l'icône au survol
            : Colors.deepOrange, // Couleur orange de l'icône par défaut
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (builder) => DetailMaintenancePage(invoice: rapport),
          ),
        );
      },
    ),
  ),
);

  
        },
      ),
    );
  }
}

