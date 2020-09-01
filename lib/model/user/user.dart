import 'address.dart';

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String displayName;
  final String email;
  final String phone;
  final List<Address> addresses;
  final String createdAt;
  final List<String> tags;
  final String lastIncompleteCheckout;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.displayName,
    this.email,
    this.phone,
    this.addresses,
    this.createdAt,
    this.tags,
    this.lastIncompleteCheckout,
  });

  factory User.fromJson(Map<String, dynamic> data) {
    List<Address> _addresses = (data['addresses']['edges'] as List)
        ?.map((address) => Address.fromJson(address))
        ?.toList();

    return User(
      id: data['id'],
      firstName: data['firstName'],
      lastName: data['lastName'],
      displayName: data['displayName'],
      email: data['email'],
      phone: data['phone'],
      tags: data['tags'],
      addresses: _addresses,
      createdAt: data['createdAt'],
    );
  }
}
