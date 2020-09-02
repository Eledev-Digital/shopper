class SelectedOption {
  final String name;
  final String value;

  SelectedOption({this.value, this.name});

  factory SelectedOption.fromJson(Map<String, dynamic> data) =>
      SelectedOption(name: data['name'], value: data['value']);
}
