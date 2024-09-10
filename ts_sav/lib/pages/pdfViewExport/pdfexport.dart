// Importe le type de données 'Uint8List' utilisé pour la création de PDF
import 'dart:typed_data';
// Importe le package 'pdf' qui fournit des outils pour la création de documents PDF
import 'package:pdf/pdf.dart';
// Importe le package 'widgets' du package 'pdf' qui fournit des widgets pour la mise en page du PDF
import 'package:pdf/widgets.dart';
// Importe le package 'dart:io' pour accéder au système de fichiers
//import 'dart:io';
// Importe le package 'flutter/services.dart' pour accéder aux fichiers d'assets
import 'package:flutter/services.dart' show rootBundle;
// Importe le modèle 'invoice.dart' situé dans le dossier 'models' du projet
import 'package:ts_sav/models/invoice.dart';

import 'package:pdf/widgets.dart' as pw;

// Fonction asynchrone qui crée un document PDF à partir d'une facture
Future<Uint8List> makePdf(Invoice invoice) async {
  /* var myTheme = ThemeData.withFont(
    base: Font.ttf(await rootBundle.load("assets/fonts/poppins/Poppins-Regular.ttf")),
    bold: Font.ttf(await rootBundle.load("assets/fonts/poppins/Poppins-Bold.ttf")),
    italic: Font.ttf(await rootBundle.load("assets/fonts/poppins/Poppins-Medium.ttf")),
    boldItalic: Font.ttf(await rootBundle.load("assets/fonts/poppins/Poppins-SemiBold.ttf")),
    );*/

  //final pdf = pw.Document(theme: myTheme,);

  // Crée un nouveau document PDF
  final pdf = pw.Document();

  // Charge l'image du logo depuis les assets de l'application
  final imageLogo = MemoryImage((await rootBundle.load('assets/images/TS.png')).buffer.asUint8List());
  // Ajoute une page au document PDF
  pdf.addPage(
    Page(
      // Définit le contenu de la page
      build: (context) {
        return Column(
          children: [
            // Ajoute une ligne avec les informations du client
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("A l'Attention de : ${invoice.client}"),
                    Text("Date d'intervention : ${invoice.date}"),
                    Text("Email : ${invoice.email}"),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                // Ajoute l'image du logo
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Image(imageLogo),
                )
              ],
            ),
            Container(height: 30),
            Table(
                border: TableBorder.all(color: PdfColors.black),
                children: [
                  TableRow(
                    children: [
                      Padding(
                        child: Text(
                          "RAPPORT D'INTERVENTION",
                          style: Theme.of(context).header1.copyWith(
                            color: const PdfColor.fromInt(0xFFFF5722),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.all(10),
                      ),
                    ]
                  ),
                ],
            ),

            // Ajoute un espace vertical
            Container(height: 10),
            // Crée un tableau avec les éléments de la facture
            Table(
              border: TableBorder.all(color: PdfColors.black),
              children: [
                // Ajoute la ligne de numéro de rapport
                TableRow(
                  children: [
                    /*Expanded(
                      child: Text('N° du rapport:', style: TextStyle
                      (
                      color: PdfColor.fromInt(0xFF000000),
                      ),
                      textAlign: TextAlign.right,
                      ),
                      flex: 3,
                    ),*/
                     Expanded(
                      child:   PaddedText( 'N° du rapport:', align: TextAlign.right,),
                      flex: 3,
                    ),

                    Expanded(
                      child: PaddedText(invoice.numeroRapport),
                      flex: 3,
                    ),
                    Expanded(
                      child: PaddedText('Nom du client:', align: TextAlign.right),
                      flex: 3,
                    ),
                    Expanded(
                      child: PaddedText(invoice.client),
                      flex: 3,
                    ),
                    Expanded(
                      child: PaddedText('N° Machine:', align: TextAlign.right),
                      flex: 3,
                    ),
                    Expanded(
                      child: PaddedText(invoice.numeroMachine),
                      flex: 3,
                    ),
                  ],
                ),
                // Ajoute la ligne de date
                TableRow(
                  children: [
                    PaddedText("Date et Heure d'arrivée:", align: TextAlign.right),
                    PaddedText(invoice.date),
                    PaddedText('Type de connexion:', align: TextAlign.right),
                    PaddedText(invoice.connexionType),
                    PaddedText('SAV :', align: TextAlign.right),
                    PaddedText(invoice.savType),
                  ],
                ),
                // Ajoute la ligne de client
                TableRow(
                  children: [
                    PaddedText('Version MAJ:', align: TextAlign.right),
                    PaddedText(invoice.versionMaj),
                    PaddedText('Date et Heure de départ:', align: TextAlign.right),
                    PaddedText(invoice.dateHeureDepart),
                    PaddedText('Image:', align: TextAlign.right),
                    PaddedText(invoice.image)
                  ],
                ),
                // Ajoute la ligne d'image
                TableRow(
                  children: [
                    PaddedText(' ', align: TextAlign.right),
                    PaddedText(' '),
                    PaddedText(' ', align: TextAlign.right),
                    PaddedText(' '),
                    PaddedText(' ', align: TextAlign.right),
                    PaddedText(' '),
                  ],
                ),
                /*TableRow(
                  children: [
                    PaddedText('Image:', align: TextAlign.right),
                    PaddedText(invoice.image)
                  ],
                ),*/
              ],
            ),
             Container(height: 10),
            Table(
                border: TableBorder.all(color: PdfColors.black),
                children: [
                  TableRow(
                      children: [
                    Expanded(
                      child: PaddedText("Nature de l'intervention", align: TextAlign.center),
                      flex: 1,
                    ),
                    Expanded(
                      child: PaddedText("Pompe v1, Carte Pompe"),
                      flex: 3,
                    ),
                    ]
                  ),
                ],
            ),
            // Ajoute un message de remerciement
            
            // Ajoute un message supplémentaire
            Padding(
              child: Text("PIECES FOURNIES OU ECHANGEES",
              style: Theme.of(context).header5.copyWith(
                      
                      color: const PdfColor.fromInt(0xFFFF5722),
                      
                    ), ),
             
              padding: const EdgeInsets.all(5),
            ),
             Container(height: 5),
            // Crée un tableau avec les éléments de la facture
            Table(
              border: TableBorder.all(color: PdfColors.black),
              children: [
                // Ajoute la ligne de numéro de rapport
                TableRow(
                  children: [
                    Expanded(
                      child: PaddedText('Nb.', align: TextAlign.right),
                      flex: 1,
                    ),
                    Expanded(
                      child: PaddedText("Pièce"),
                      flex: 3,
                    ),
                    Expanded(
                      child: PaddedText('Nb.', align: TextAlign.right),
                      flex: 1,
                    ),
                    Expanded(
                      child: PaddedText('Pièce'),
                      flex: 3,
                    ),
                    Expanded(
                      child: PaddedText('Nb.', align: TextAlign.right),
                      flex: 1,
                    ),
                    Expanded(
                      child: PaddedText('Pièce'),
                      flex: 3,
                    ),
                  ],
                ),
                // Ajoute la ligne de date
                TableRow(
                  children: [
                    PaddedText('', align: TextAlign.right),
                    PaddedText(" "),
                    PaddedText(" ", align: TextAlign.right),
                    PaddedText(" "),
                    PaddedText('', align: TextAlign.right),
                    PaddedText(" "),
                  ],
                ),
                // Ajoute la ligne de client
                TableRow(
                  children: [
                    PaddedText(' ', align: TextAlign.right),
                    PaddedText(' '),
                    PaddedText(' ', align: TextAlign.right),
                    PaddedText(' '),
                    PaddedText('', align: TextAlign.right),
                    PaddedText(" "),
                  ],
                ),
                // Ajoute la ligne d'image
               
              ],
            ),
            // Ajoute une ligne de séparation
            /*Divider(
              height: 1,
              borderStyle: BorderStyle.dashed,
            ),*/
            Container(height: 10),
            Table(
                border: TableBorder.all(color: PdfColors.black),
                children: 
                [
                  TableRow
                  (
                    children: 
                    [
                      Padding(
                        child:Text
                        (
                           "Déroulement de l'intervention",
                            style: Theme.of(context).header3.copyWith(
                              color: const PdfColor.fromInt(0xFFFF5722),
                            ),
                             
                            textAlign: TextAlign.center,
                        ),
                        padding: const EdgeInsets.all(10), ),
                    ]
                  ),

                ],
            ),
            Padding(
              child: Text("OBSERVATIONS (anomalies constatées, suggestions, améliorations...)",
              style: Theme.of(context).header5.copyWith(
                      
                      color: const PdfColor.fromInt(0xFFFF5722),
                      
                    ), ),
             
              padding: const EdgeInsets.all(10),
            ),
            // Ajoute un espace vertical
            Container(height: 5),
            // Crée un tableau avec les informations bancaires
            Table(
              border: TableBorder.all(color: PdfColors.black),
              children: [
                
                TableRow(
                  children: [
                    PaddedText('Etat de la machine:', align: TextAlign.right),
                    PaddedText(invoice.etatMachineType),
                    PaddedText("Netoyages respectés ?", align: TextAlign.right),
                    PaddedText(invoice.respectNetoyageType),
                    
                  ],
                ),
                TableRow(
                  children: [
                    PaddedText('Signature Intervenant',align: TextAlign.right ),
                    PaddedText('TIME-SHAKER S.A.V'),
                    PaddedText('Signature du client',align: TextAlign.right ),
                    PaddedText(' '),
                  ],
                ),
              ],
            ),
            // Ajoute un message final
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                '"Veuillez vous assurer que tous les accessoires et bouteilles soient bien à leurs places."',
                style: Theme.of(context).header5.copyWith(
                      fontStyle: FontStyle.italic,
                      color: const PdfColor.fromInt(0xFFFF5722),
                      
                    ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        );
      },
    ),
  );
  // Enregistre le document PDF créé et le retourne sous forme de liste d'octets
  return pdf.save();
}

// Fonction qui crée un widget de texte avec un remplissage
// ignore: non_constant_identifier_names
Widget PaddedText(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        text,
        textAlign: align,
      ),
    );
