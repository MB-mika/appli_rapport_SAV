// La classe 'Invoice' représente une facture
class Invoice {
  final String numeroRapport;
  final String date;
  final String client;
  final String numeroMachine;
  final String image;
  final String email;
  final String connexionType;
  final String savType;
  final String versionMaj;
  final String dateHeureDepart;
  final String etatMachineType;
  final String respectNetoyageType;

  Invoice({
    required this.numeroMachine,
    required this.numeroRapport,
    required this.date,
    required this.client,
    required this.image,
    required this.email,
    required this.connexionType,
    required this.savType,
    required this.versionMaj,
    required this.dateHeureDepart,
    required this.etatMachineType,
    required this.respectNetoyageType,
  });

  String? get saisie => null;

  String? get description => null;
  String? get champ => null;

  get montant => null;
  // Méthode qui calcule le coût total de la facture
  /* double totalCost() {
    // Utilise la méthode 'fold()' pour additionner les coûts de tous les éléments de la facture
    return items.fold(0, (previousValue, element) => previousValue + element.cost);
  }
}

// La classe 'LineItem' représente un élément de la facture
class LineItem {
  // Propriété 'description' qui contient la description de l'élément
  final String description;
  // Propriété 'cost' qui contient le coût de l'élément
  final double cost;
  // Constructeur de la classe 'LineItem'
  LineItem(this.description, this.cost);*/
}
