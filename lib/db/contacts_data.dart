import '../helpers/methods.dart';

List<Contacts> listContact = (EnvironmentHandler.side == 'lelaki')
    ? [
        Contacts(name: 'Shafiq', phoneNo: '0123456789'),
        Contacts(name: 'Aiman', phoneNo: '0123456789'),
      ]
    : [
        Contacts(name: 'Firash', phoneNo: '0123456789'),
        Contacts(name: 'Arshad', phoneNo: '0123456789'),
      ];

class Contacts {
  String name;
  String phoneNo;
  Contacts({
    required this.name,
    required this.phoneNo,
  });
}
