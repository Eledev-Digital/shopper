class Address {
  final String id;
  final String address1;
  final String address2;
  final String city;
  final String company;
  final String country;
  final String countryCode;
  final String firstName;
  final String lastName;
  final String formattedArea;
  final String latitude;
  final String longitude;
  final String name;
  final String phone;
  final String province;
  final String provinceCode;
  final String zip;

  Address({
    this.id,
    this.address1,
    this.address2,
    this.city,
    this.company,
    this.country,
    this.countryCode,
    this.firstName,
    this.lastName,
    this.formattedArea,
    this.latitude,
    this.longitude,
    this.name,
    this.phone,
    this.province,
    this.provinceCode,
    this.zip,
  });

  factory Address.fromJson(Map<String, dynamic> data) {
    var node = data['node'] ?? {};

    return Address(
      id: node['id'],
      address1: node['address1'],
      address2: node['address2'],
      city: node['city'],
      company: node['company'],
      country: node['country'],
      countryCode: node['countryCode'],
      firstName: node['firstName'],
      lastName: node['lastName'],
      formattedArea: node['formattedArea'],
      latitude: node['latitude'],
      longitude: node['longitude'],
      name: node['name'],
      phone: node['phone'],
      province: node['province'],
      provinceCode: node['provinceCode'],
      zip: node['zip'],
    );
  }
}
