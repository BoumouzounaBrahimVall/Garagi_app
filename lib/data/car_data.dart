import '../domain/models/car_details_model.dart';
import '../domain/models/car_model.dart';

final List<CarModel> cars = [
  CarModel(
    carId: '2324AA12',
    carTitle: 'Toyota Hilux 2020',
  ),
  CarModel(
    carId: '2324AA13',
    carTitle: 'Toyota Hilux 2020',
    isDanger: true,
    message: "Besoin d’une vidange ",
  ),
  CarModel(
    carId: '2324AA14',
    carTitle: 'Toyota Hilux 2020',
    message: "vidange apres 100km",
  ),
  CarModel(
    carId: '2324AA15',
    carTitle: 'Toyota Hilux 2020',
  ),
  CarModel(
    carId: '2324AA16',
    carTitle: 'Toyota Hilux 2020',
  ),
  CarModel(
    carId: '2324AA17',
    carTitle: 'Toyota Hilux 2020',
  ),
  CarModel(
    carId: '2324AA18',
    carTitle: 'Toyota Hilux 2020',
  ),
  CarModel(
    carId: '2324AA19',
    carTitle: 'Toyota Hilux 2020',
  ),
  CarModel(
    carId: '2324AA110',
    carTitle: 'Toyota Hilux 2020',
  ),
  CarModel(
    carId: '2324AA111',
    carTitle: 'Toyota Hilux 2020',
  ),
];

List<String> problemsList = [
  "Cylindres qui ratent",
  "Surchauffe du moteur",
  "Fuites d'huile",
  "Fuites de liquide de refroidissement",
  "Problèmes de courroie de distribution",
  "Problèmes avec le système d'allumage",
  "Glissement de la transmission",
  "Changements retardés ou brusques",
  "Fuites de liquide de transmission",
  "Plaquettes de frein usées",
  "Fuites de liquide de frein",
  "Pédale de frein molle",
  "Disques de frein déformés",
  "Amortisseurs ou ressorts usés",
  "Problèmes d'alignement de la direction",
  "Bruits inhabituels en tournant",
  "Composants de direction desserrés ou endommagés",
  "Fuites dans le système d'échappement",
  "Silencieux cassé ou rouillé",
  "Problèmes de convertisseur catalytique",
  "Batterie déchargée",
  "Alternateur défectueux",
  "Problèmes de câblage",
  "Capteurs défectueux",
  "Injecteurs de carburant obstrués",
  "Problèmes de pompe à carburant",
  "Problèmes de bouchon de réservoir",
  "Usure inégale des pneus",
  "Pression des pneus basse",
  "Problèmes d'alignement des roues",
  "Jantes endommagées ou pliées",
  "Chauffage ou refroidissement inefficace",
  "Fuites de réfrigérant",
  "Problèmes de moteur de soufflante",
  "Fuites de liquide de transmission",
  "Fuites de liquide de direction assistée",
  "Fuites de liquide de frein",
  "Fuites de liquide de refroidissement",
  "Phares, feux arrière ou clignotants défectueux",
  "Problèmes de câblage dans le système d'éclairage",
  "Problèmes du système électrique (fusibles, relais)",
  "Courroies usées",
  "Durites vieillissantes",
  "Rouille et corrosion sur divers composants",
  "Bruits inhabituels en conduisant",
  "Vibrations dans le volant ou sur l'ensemble du véhicule",
  "Huile moteur contaminée ou sale",
  "Liquide de transmission contaminé",
  "Contamination du liquide de frein",
];
List<Problem> problems = List<Problem>.generate(
    problemsList.length,
    (index) => Problem(
          id: index,
          consultationId: 0,
          description: problemsList[index],
        ));

List<String> carServices = [
  // Vidange (Oil Change)
  "Changement d'huile moteur",
  "Remplacement du filtre à huile",
  "Lubrification des composants du châssis",
  "Vérification et complément des fluides", //(huile de transmission, liquide de frein, liquide de direction assistée, liquide de refroidissement, etc.)
  "Inspection du système d'échappement",

  // Réparations (Repairs)
  "Réparation et remplacement du système de freinage", //(plaquettes de frein, disques de frein, étriers)
  "Réparations moteur",
  "Réparations de la transmission",
  "Réparations du système de suspension",
  "Réparations du système de direction",
  "Réparations du système électrique",
  "Réparations du système de climatisation",
  "Réparations du système d'échappement",
  "Réparations du système de carburant", //(pompe à carburant, injecteurs, etc.)
  "Réparation et remplacement des pneus",
  "Remplacement de la batterie",

  // Services de diagnostic (Diagnostic Services)
  "Diagnostic moteur",
  "Diagnostic de la transmission",
  "Diagnostic du système électrique",
  "Analyse informatisée du véhicule pour les codes d'erreur",
  "Diagnostic du système ABS", // (système de freinage antiblocage)
  "Diagnostic du système d'airbag",
  "Diagnostic du témoin de moteur",
  "Diagnostic du système de carburant",
  "Diagnostic du système HVAC", //(chauffage, ventilation et climatisation)

  // Maintenance régulière (Routine Maintenance)
  "Rotation et équilibrage des pneus",
  "Alignement des roues",
  "Remplacement du filtre à air",
  "Remplacement du filtre d'habitacle",
  "Remplacement des bougies d'allumage",
  "Remplacement de la courroie de distribution",
  "Remplacement de la courroie serpentine",
  "Flush du système de refroidissement",

  // Maintenance préventive (Preventive Maintenance)
  "Flush et remplacement des fluides", //(huile de transmission, liquide de frein, liquide de direction assistée)
  "Inspection et test de la batterie",
  "Inspection des courroies et des durites",
  "Vérification et serrage des écrous et des boulons",
  "Inspection du système d'échappement",

  // Services additionnels (Additional Services)
  "Alignement des roues et des pneus",
  "Remplacement des phares et feux arrière",
  "Remplacement des balais d'essuie-glace",
  "Réparation ou remplacement des éclats de pare-brise",
  "Nettoyage et entretien de l'intérieur",
  "Nettoyage et lustrage de l'extérieur",
];
List<Service> services = List<Service>.generate(
    carServices.length,
    (index) => Service(
          id: index,
          consultationId: 0,
          description: carServices[index],
        ));
List<String> categories = ["DIAGNOSTIC", "VIDANGE", "REPARATION"];
