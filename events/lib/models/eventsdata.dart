class Evenements {
  String eventName;
  String eventImg;
  String eventDate;
  String eventHours;
  String eventMaps;
  String eventCateg;
  String eventDesc;
  int eventPrice;
  List<Map<String, dynamic>> eventTickets;

  Evenements(
    this.eventName,
    this.eventImg,
    this.eventDate,
    this.eventHours,
    this.eventMaps,
    this.eventCateg,
    this.eventDesc,
    this.eventPrice,
    this.eventTickets,
  );

  static List<Evenements> getEvents() {
    return [
      Evenements(
        "Parc Magic",
        "assets/images/event1.jpg",
        "12 Fevrier 2024",
        "18h-22h",
        "Parc National ( Bamako )",
        "show",
        "Qu'est-ce que le Lorem Ipsum ?  Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500",
        1000,
        [
          {"type": "simple", "price": 1000},
          {"type": "VIP", "price": 2000},
        ],
      ),
      Evenements(
        "Festival Dibi",
        "assets/images/event3.jpg",
        "14 Fevrier 2024",
        "16h-01h",
        "Place cinquantenaire",
        "show",
        "Qu'est-ce que le Lorem Ipsum ?  Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500",
        1000,
        [
          {"type": "simple", "price": 1000},
          {"type": "VIP", "price": 2000},
        ],
      ),
      Evenements(
        "Festival Hola",
        "assets/images/event3.jpg",
        "07 Mars 2024",
        "15h-00h",
        "CICB ( Bamako )",
        "festival",
        "Qu'est-ce que le Lorem Ipsum ?  Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500",
        1000,
        [
          {"type": "simple", "price": 1000},
          {"type": "VIP", "price": 2000},
        ],
      ),
      Evenements(
        "Parc Magic",
        "assets/images/event4.jpg",
        "20 Mars 2024",
        "18h-20h",
        "Parc National ( Bamako )",
        "show",
        "Qu'est-ce que le Lorem Ipsum ?  Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500",
        500,
        [
          {"type": "simple", "price": 500},
          {"type": "VIP", "price": 1000},
        ],
      ),
      Evenements(
        "Hola festival",
        "assets/images/event5.jpg",
        "01 Avril 2024",
        "18h-00h",
        "Muse National ( Bamako )",
        "Festival",
        "Qu'est-ce que le Lorem Ipsum ?  Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500",
        1000,
        [
          {"type": "simple", "price": 1000},
          {"type": "VIP", "price": 2000},
        ],
      ),
      Evenements(
        "Bama-Art",
        "assets/images/event6.jpg",
        "04 Mars 2024",
        "18h-01h",
        "Berge du Palais ( Bamako )",
        "show",
        "Qu'est-ce que le Lorem Ipsum ?  Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500",
        2000,
        [
          {"type": "simple", "price": 2000},
          {"type": "VIP", "price": 3000},
        ],
      ),
      Evenements(
        "Concert ",
        "assets/images/event7.jpg",
        "24 Fevrier 2024",
        "20h-01h",
        "ACI Palais des sports",
        "Concert",
        "Qu'est-ce que le Lorem Ipsum ?  Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500",
        1000,
        [
          {"type": "simple", "price": 1000},
          {"type": "VIP", "price": 5000},
        ],
      ),
      Evenements(
        "Concert",
        "assets/images/event8.jpg",
        "04 Avril 2024",
        "20h-00h",
        "Parc National ( Bamako )",
        "Concert",
        "Qu'est-ce que le Lorem Ipsum ?  Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500",
        1000,
        [
          {"type": "simple", "price": 1000},
          {"type": "VIP", "price": 5000},
        ],
      ),
      Evenements(
        "Humour",
        "assets/images/event9.jpg",
        "12 Fevrier 2024",
        "20h-00h",
        "CICB ( Bamako )",
        "Humour",
        "Qu'est-ce que le Lorem Ipsum ?  Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500",
        2000,
        [
          {"type": "simple", "price": 2000},
          {"type": "VIP", "price": 5000},
        ],
      ),
    ];
  }
}
