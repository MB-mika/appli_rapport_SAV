// Importe le package 'flutter/material.dart' qui fournit les widgets de base pour créer une application Flutter
import 'package:flutter/material.dart';
// Importe le package 'flutter/widgets.dart' qui fournit des widgets supplémentaires
//import 'package:flutter/widgets.dart';
// Importe le modèle 'invoice.dart' situé dans le dossier 'models' du projet 'makepdfs'
import 'package:ts_sav/models/invoice.dart';
// Importe le package 'printing' qui permet d'exporter des documents PDF
import 'package:printing/printing.dart';
// Importe le fichier 'pdfexport.dart' situé dans le dossier 'pdf' du projet 'makepdfs'
import 'package:ts_sav/pages/pdfViewExport/pdfexport.dart';


// La classe 'PdfPreviewPage' est un widget statique qui représente la page de prévisualisation PDF
class PdfPreviewPage extends StatelessWidget {
  // Propriété 'invoice' qui contient l'objet 'Invoice' à afficher dans la prévisualisation
  final Invoice invoice;
  // Constructeur de la classe 'PdfPreviewPage'
  const PdfPreviewPage({super.key, required this.invoice});

  // Cette méthode 'build()' définit l'arborescence des widgets pour la page de prévisualisation PDF
  @override
  Widget build(BuildContext context) {
    // Crée une instance de Scaffold, qui est le widget de base pour une page
    return Scaffold(
      // Définit la barre d'application (AppBar) avec le titre "PDF Preview"
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 102, 10, 138),
          shadowColor: const Color.fromARGB(255, 43, 16, 1),
        title: const Text('PDF Preview',style: TextStyle( color: Colors.white),),
        iconTheme: const IconThemeData
        (
          color: Colors.white, // Changez la couleur de l'icône ici
        ),
      ),
      // Définit le contenu principal de la page en utilisant un widget PdfPreview
      body: PdfPreview(
        // Appelle la fonction 'makePdf' pour générer le document PDF à partir de la facture
        build: (context) => makePdf(invoice),
      ),
    );
  }
}
