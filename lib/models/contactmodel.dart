const String tblcontact = "tbl_contact";
const String tblcontactid = "id";
const String tblcontactdesignation = "designation";
const String tblcontactname = "name";
const String tblcontactmobile = "mobile";
const String tblcontactemail = "email";
const String tblcontactaddress = "address";
const String tblcontactcompany = "company";
const String tblcontactwebsite = "website";
const String tblcontactimage = "image";
const String tblcontactfavorite = "";

class Contactmodel {
  int id;
  String name;
  String designation;
  String mobile;
  String email;
  String address;
  String company;
  String website;
  String image;
  bool favorite;
  Contactmodel({
    this.id = -1,
    required this.name,
    this.designation = "",
    required this.mobile,
    this.email = "",
    this.company = "",
    this.address = "",
    this.image = "",
    this.website = "",
    this.favorite = false,
  });
  Map<String, dynamic> tomap() {
    final Map<String, dynamic> mapping = {
      tblcontactname: name,
      tblcontactdesignation: designation,
      tblcontactmobile: mobile,
      tblcontactemail: email,
      tblcontactaddress: address,
      tblcontactcompany: company,
      tblcontactwebsite: website,
      tblcontactimage: image,
      tblcontactfavorite: favorite ? 1 : 0,
    };
    if (id > 0) {
      mapping[tblcontactid] = id;
    }
    return mapping;
  }

  factory Contactmodel.fromMap(Map<String, dynamic> mapping) => Contactmodel(
    name: mapping[tblcontactname],
    mobile: mapping[tblcontactmobile],
    designation: mapping[tblcontactdesignation],
    address: mapping[tblcontactaddress],
    email: mapping[tblcontactemail],
    company: mapping[tblcontactcompany],
    website: mapping[tblcontactwebsite],
    image: mapping[tblcontactimage],
    favorite: mapping[tblcontactfavorite] == 1 ? true : false,
  );
}
