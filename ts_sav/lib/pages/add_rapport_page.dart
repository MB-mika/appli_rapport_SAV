import 'dart:ui';
import 'package:date_field/date_field.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
//import 'package:flutter/widgets.dart';

class AddRapportPage extends StatefulWidget {
  const AddRapportPage({super.key});

  @override
  State<AddRapportPage> createState() => _AddRapportPageState();
}

class _AddRapportPageState extends State<AddRapportPage> {
  final _formkey = GlobalKey<FormState>();
  final numeroRapportNameController = TextEditingController();
  final syntheseInterventionController = TextEditingController();
  final nomClientNameController = TextEditingController();
  final numeroMachineNameController = TextEditingController();
  final numeroMajNameController = TextEditingController();
  final emailClientNameController = TextEditingController();
  String selectedConnexionType = 'Câble';
  String selectedSavType = "a distance";
  String selectedBoiteSavType = 'Fournie';
  String selectedEtatMachineType = "Très bon état";
  String selectedNetoyageType = "OUI";
  DateTime selectedDateRapportDate = DateTime.now();
  DateTime selectedDateDemandeDate = DateTime.now();
  DateTime selectedDateInterventionDate = DateTime.now();
  List<String> _natureInterventionOptions = [];
  late List<bool> _natureInterventionSelectedOptions;

  @override
  void dispose() {
    super.dispose();

    numeroRapportNameController.dispose();
    nomClientNameController.dispose();
    numeroMachineNameController.dispose();
    numeroMajNameController.dispose();
    emailClientNameController.dispose();
    syntheseInterventionController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _natureInterventionOptions = [
      "Bouchon mobile",
      "Bouchon mobile small",
      "Pompe v1",
      "Pompe v2",
      "Joint bouchon fixe",
      "Bouchon fixe",
      "Sensor v1",
      "Sensor v2",
      "Bac L",
      "Bac R",
      "Bac récupérateur",
      "bac nettoyage intérieur",
      "Tête de distribution v1",
      "Tête de distribution v2",
      "Frigo",
      "Carte pompe",
      "Carte sensor",
      "Carte v2",
      "Porte frigo",
      "carte pieuvre",
      "Dongle wifi 2.4 Ghz",
      "Dongle wifi 5 Ghz",
      "Transformateur",
      "Verre de calibrage",
      "Raccord tuyau transparent",
      "Raccord coudé",
    ];
    _natureInterventionSelectedOptions =
        List.generate(_natureInterventionOptions.length, (_) => false);
  }

  List<String> get selectedNatureInterventionOptions {
    final selectedOptions = <String>[];
    for (int i = 0; i < _natureInterventionSelectedOptions.length; i++) {
      if (_natureInterventionSelectedOptions[i]) {
        selectedOptions.add(_natureInterventionOptions[i]);
      }
    }
    return selectedOptions;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(40),
      child: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Aligner le titre à gauche
            children: [
              const Text(
                'Formulaire de Rapport',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange, // Couleur du titre
                ),
              ),
              const SizedBox(height: 16),

              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  maxLines:
                      null, // étendre le champ en fonction de la quantité de texte saisi
                  cursorColor: Colors.deepOrange,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.deepOrange),
                    labelText: 'n° du Rapport',
                    hintStyle: const TextStyle(color: Colors.deepOrange),
                    hintText: 'Entre le numéro d\'intervention',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(
                          20.0), // Couleur de la bordure non sélectionnée
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(
                          20.0), // Couleur de la bordure sélectionnée
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(
                          20.0), // Couleur de la bordure en cas d'erreur
                    ),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Tu dois compléter ce champ";
                    }
                    return null;
                  },
                  controller: numeroRapportNameController,
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: DateTimeFormField(
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(color: Colors.black45),
                    errorStyle: const TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20.0), 
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(
                          20.0),
                    ),
                    suffixIcon: const Icon(
                      Icons.event_note,
                      color: Colors.deepOrange,
                    ),
                    labelStyle: const TextStyle(color: Colors.deepOrange),
                    labelText: "Date et heure d'arrivée",
                  ),
                  mode: DateTimeFieldPickerMode.dateAndTime,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) => (e?.day ?? 0) == -365
                      ? 'S\'il te plaît pas le premier jour'
                      : null,
                  onChanged: (DateTime? value) {
                    if (value != null) {
                      setState(() {
                        selectedDateRapportDate = value;
                      });
                    }
                  }, //onChanged: (DateTime? value) {  },
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  cursorColor: Colors.deepOrange,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.deepOrange),
                    labelText: 'Nom et prénom du client',
                    hintText: 'Entre le nom et le prénom du client',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(
                          20.0), // Couleur de la bordure non sélectionnée
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(
                          20.0), // Couleur de la bordure sélectionnée
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Tu dois compléter ce champ";
                    }
                    return null;
                  },
                  controller: nomClientNameController,
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  cursorColor: Colors.deepOrange,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.deepOrange),
                    labelText: 'Email du client',
                    hintText: 'Entre l\'email du client',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(
                          20.0), // Couleur de la bordure non sélectionnée
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(
                          20.0), // Couleur de la bordure sélectionnée
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Tu dois compléter ce champ";
                    }
                    return null;
                  },
                  controller: emailClientNameController,
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  cursorColor: Colors.deepOrange,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.deepOrange),
                    labelText: 'N° machine',
                    hintText: 'Entre le numéro de la machine',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(
                          20.0), // Couleur de la bordure non sélectionnée
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(
                          20.0), // Couleur de la bordure sélectionnée
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Tu dois compléter ce champ";
                    }
                    return null;
                  },
                  controller: numeroMachineNameController,
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: DateTimeFormField(
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(color: Colors.black45),
                    errorStyle: const TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(
                          20.0),
                    ),
                    suffixIcon: const Icon(
                      Icons.event_note,
                      color: Colors.deepOrange,
                    ),
                    labelStyle: const TextStyle(color: Colors.deepOrange),
                    labelText: 'Date de demande',
                  ),
                  mode: DateTimeFieldPickerMode.dateAndTime,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) => (e?.day ?? 0) == -365
                      ? 'S\'il te plaît pas le premier jour'
                      : null,
                  onChanged: (DateTime? value) {
                    if (value != null) {
                      setState(() {
                        selectedDateDemandeDate = value;
                      });
                    }
                  }, //onChanged: (DateTime? value) {  },
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(value: 'Câble', child: Text("Par câble")),
                    DropdownMenuItem(value: 'Wifi', child: Text("Par Wifi"))
                  ],
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.deepOrange),
                    labelText: 'Type de connexion',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(
                          20.0),
                    ),
                  ),
                  value: selectedConnexionType,
                  onChanged: ((value) {
                    setState(() {
                      selectedConnexionType = value!;
                    });
                  }),
                ),
              ),
              // SizedBox(height: 10,),

              Container
              (
                margin: const EdgeInsets.only(bottom: 10),
                child: DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(
                        value: "a distance", child: Text("A distance")),
                    DropdownMenuItem(
                        value: " sur place", child: Text("Sur place"))
                  ],
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.deepOrange),
                    labelText: 'SAV',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(
                          20.0),
                    ),
                  ),
                  value: selectedSavType,
                  onChanged: ((value) {
                    setState(() {
                      selectedSavType = value!;
                    });
                  }),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  cursorColor: Colors.deepOrange,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.deepOrange),
                    labelText: 'Version MAJ :',
                    hintText: 'Entre le numéro de la MAJ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(
                          20.0), // Couleur de la bordure non sélectionnée
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(
                          20.0), // Couleur de la bordure sélectionnée
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Tu dois compléter ce champ";
                    }
                    return null;
                  },
                  controller: numeroMajNameController,
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: DateTimeFormField(
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(color: Colors.black45),
                    errorStyle: const TextStyle(color: Colors.redAccent),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(
                          20.0),
                    ),
                    suffixIcon: const Icon(
                      Icons.event_note,
                      color: Colors.deepOrange,
                    ),
                    labelStyle: const TextStyle(color: Colors.deepOrange),
                    labelText: 'Date d\'intervention',
                  ),
                  mode: DateTimeFieldPickerMode.dateAndTime,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) => (e?.day ?? 0) == -1
                      ? 'S\'il te plaît pas le premier jour'
                      : null,
                  onChanged: (DateTime? value) {
                    if (value != null) {
                      setState(() {
                        selectedDateInterventionDate = value;
                      });
                    }
                  }, //onChanged: (DateTime? value) {  },
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(value: 'Fournie', child: Text("Fournie")),
                    DropdownMenuItem(
                        value: 'Non fournie', child: Text("Non fournie"))
                  ],
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.deepOrange),
                    labelText: 'Boite SAV avec échantillon',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(
                          20.0),
                    ),
                  ),
                  value: selectedBoiteSavType,
                  onChanged: ((value) {
                    setState(() {
                      selectedBoiteSavType = value!;
                    });
                  }),
                ),
              ),

              // Ajoutez ce widget dans la colonne des enfants
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Column
                (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: 
                  [
                    const Text
                    (
                      "Nature de l'intervention",
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                      const SizedBox(height: 8),
                      ..._natureInterventionOptions.asMap().entries.map
                      ((entry) 
                        {
                          final index = entry.key;
                          final option = entry.value;

                          return CheckboxListTile
                          (
                            
                              title: Text(option),
                              value: _natureInterventionSelectedOptions[index],
                                onChanged: (value) 
                                {
                                  setState
                                  (() {
                                      _natureInterventionSelectedOptions[index] = value!;
                                      }
                                  );
                                },

                              shape: _natureInterventionSelectedOptions[index]
                              ? RoundedRectangleBorder
                                (
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: const BorderSide
                                  (
                                    color: Colors.deepOrange,
                                    width: 1.0,
                                  ),
                                )
                              : null,

                              fillColor: MaterialStateProperty.resolveWith<Color?>
                              ((Set<MaterialState> states) 
                              {
                                if (states.contains(MaterialState.selected)) 
                                {
                                return Colors.deepOrange;
                                }
                                return null;
                              }
                            ),
                            activeColor: Colors.deepOrange, // Définit la couleur du checkbox sélectionné
                            checkColor: Colors.white, // Définit la couleur de la coche
                            hoverColor: Colors.deepOrange.withOpacity(0.5), // Définit la couleur de survol
                          );
                        }
                      ),
                  ],
                ),
              ),
              // SizedBox( height: 10, ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  maxLines: null, // étendre le champ en fonction de la quantité de texte saisi
                  cursorColor: Colors.deepOrange,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.deepOrange),
                    labelText: "Déroulement de l'intervention",
                    //hintStyle: const TextStyle(color: Colors.deepOrange),
                    hintText: " décrit l'intervention en générale - (synthèse)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(
                          20.0), // Couleur de la bordure non sélectionnée
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(
                          20.0), // Couleur de la bordure sélectionnée
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(
                          20.0), // Couleur de la bordure en cas d'erreur
                    ),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Tu dois compléter ce champ";
                    }
                    return null;
                  },
                  controller: syntheseInterventionController,
                ),
              ),

              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(
                        value: "Très bon état", child: Text("Très bon état")),
                    DropdownMenuItem(
                        value: "Bon état", child: Text("Bon état")),
                    DropdownMenuItem(
                        value: "Mauvais état", child: Text("Mauvais état")),
                  ],
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.deepOrange),
                    labelText: 'Etat de la machine général',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(
                          20.0),
                    ),
                  ),
                  value: selectedEtatMachineType,
                  onChanged: ((value) {
                    setState(() {
                      selectedEtatMachineType = value!;
                    });
                  }),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(value: "OUI", child: Text("OUI")),
                    DropdownMenuItem(value: "NON", child: Text("NON")),
                  ],
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.deepOrange),
                    labelText: 'Nettoyages respectés',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.circular(
                          20.0),
                    ),
                  ),
                  value: selectedNetoyageType,
                  onChanged: ((value) {
                    setState(() {
                      selectedNetoyageType = value!;
                    });
                  }),
                ),
              ),
              const SizedBox( height: 10, ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      final numeroRapportName = numeroRapportNameController.text;
                      final nomClientName = nomClientNameController.text;
                      final emailClientName = emailClientNameController.text;
                      final numeroMachineName = numeroMachineNameController.text;
                      final numeroMajName = numeroMajNameController.text;
                      final syntheseIntervention = syntheseInterventionController.text;
                      final selectedOptions = selectedNatureInterventionOptions;
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Envoi en cours...")));
                      FocusScope.of(context).requestFocus(FocusNode());

                      print("Date :$selectedDateRapportDate");
                      print("Ajout du raport $numeroRapportName pour le client $nomClientName");
                      print("email du client:$emailClientName");
                      print("Numéo de la machine: $numeroMachineName");
                      print("Date de demande:$selectedDateDemandeDate");
                      print("version de la MAJ: $numeroMajName");
                      print("Type de connexion: $selectedConnexionType");
                      print("Type de sav: $selectedSavType");
                      print(
                          "Date d'intervention et heure d'arrivée:$selectedDateRapportDate");
                      print(
                          "Boite SAV avec échantillons : $selectedBoiteSavType ");
                      print(
                          "Etat de la machine général  : $selectedEtatMachineType ");
                      print("Netoyages respectés ? $selectedNetoyageType ");
                      print("Nature de l'intervention : $selectedOptions");
                      print("Déroulement de l'intervention: $syntheseIntervention");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text(
                    "Valider",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

   /* class _natureInterventionOptions 
    {
    static asMap() {}
    }*/
