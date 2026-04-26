class Contactmodel {
  int id;
  String name;
  String mobile;
  String email;
  String address;
  String company;
  String website;
  String image;
  Contactmodel({
    this.id = -1,
    required this.name,
    required this.mobile,
    this.email = "",
    this.company = "",
    this.address = "",
    this.image = "",
    this.website = "",
  });
}
