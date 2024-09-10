
import 'package:flutter/material.dart';
import 'package:ts_sav/models/invoice.dart';
import 'package:ts_sav/pages/pdfViewExport/pdfpreview.dart';

class DetailMaintenancePage extends StatelessWidget {
  final Invoice invoice;

  const DetailMaintenancePage({
    super.key,
    required this.invoice,
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
      onPressed: () {
          // Navigue vers la page de prévisualisation PDF en passant la invoice  en paramètre et la page pdfpreview.dart
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PdfPreviewPage(invoice: invoice),
            ),
          );
        },
        // Définit la couleur de fond du bouton flottant
        backgroundColor: Colors.deepOrange,
        // Définit l'icône du bouton flottant
        child: const Icon(Icons.picture_as_pdf, color: Colors.white,),
         // Définit la couleur de l'icône
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        shadowColor: const Color.fromARGB(255, 43, 16, 1),
        title: Text(invoice.numeroRapport, style: const TextStyle( color: Colors.white),),
        iconTheme: const IconThemeData
        (
          color: Colors.white, // Changez la couleur de l'icône ici
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              color: Colors.deepOrange[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Rapport :',
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      invoice.numeroRapport,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              color: Colors.deepOrange[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Client :',
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      invoice.client,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const  EdgeInsets.all(15.0),
            child: Card(
              color: Colors.deepOrange[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'N° Machine :',
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      invoice.numeroMachine,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                      
                     
                      
                    ),
                  ),
                ],
              ),
            ),
          ),

           Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              color: Colors.deepOrange[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    //flex: 2,
                    child: Text(
                      'Date :',
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                      selectionColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      invoice.date,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                      selectionColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
