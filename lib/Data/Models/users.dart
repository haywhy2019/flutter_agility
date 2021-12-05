class Users {
  String id;
  String name;
  String title;
  int phoneNumber;
  String whatsapp;
  String image;

  Users(
      {required this.id,
      required this.name,
      required this.title,
      required this.phoneNumber,
      required this.whatsapp,
      required this.image});
}

List<Users> data = [
  Users(
    id: "1",
    name: "Dimeji Johnson",
    title: "Software Engineer",
    phoneNumber: 07064959292,
    whatsapp: "dimeji@sasays.tech",
    image: "assets/images/man.png",
  ),
  Users(
    id: "2",
    name: "Dimeji Johnson",
    title: "Software Engineer",
    phoneNumber: 07064959292,
    whatsapp: "dimeji@sasays.tech",
    image: "assets/images/man.png",
  ),
  Users(
    id: "3",
    name: "Dimeji Johnson",
    title: "Software Engineer",
    phoneNumber: 07064959292,
    whatsapp: "dimeji@sasays.tech",
    image: "assets/images/woman.png",
  ),
];
