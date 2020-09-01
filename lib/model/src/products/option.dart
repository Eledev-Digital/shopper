class Option {
  final String id;
  final String name;
  final List<String> values;

  Option({this.id, this.name, this.values});

  factory Option.fromJson(Map<String, dynamic> data) {
    List<String> _values =
        (data['values'] as List)?.map((value) => value as String)?.toList();

    return Option(
      id: data['id'] ?? "",
      name: data['name'] ?? "",
      values: _values,
    );
  }
}
