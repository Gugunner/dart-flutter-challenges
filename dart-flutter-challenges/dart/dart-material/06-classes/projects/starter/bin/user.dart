

class User {
  ///Long-form constructor
  const User({required int id, required String name})
   :assert(id >= 0),
    _id = id,
    _name = name;

  ///Short-form constructor
  //User(this.id, this.name)
  ///Named constructor
  // User.anonymous() {
  //   id = 0;
  //   name = 'anonymous';
  // }
  ///DRY Named constructor with "forwarding" or "shadowing"
  const User.anonymous() : this(id: _anonymousId, name: _anonymousName);

  ///Factory constructor
  factory User.raul() {
    return User(id: 42, name:'Raul');
  }

  ///Another factory constructor
  factory User.fromJson(Map<String, Object> json) {
    final userId = json['id'] as int;
    final userName = json['name'] as String;
    return User(id: userId, name: userName);
  }

  ///Static Method
  static User fromJsonStatic(Map<String, Object> json) {
    final userId = json['id'] as int;
    final userName = json['name'] as String;
    return User(id: userId, name: userName);
  }

  ///Declares value types for properties
  final int _id;
  final String _name;
  static const _anonymousId = 0;
  static const _anonymousName = 'anonymous';
  ///Getter
  int get id => _id;
  String get name => _name;
  ///Calculated getter
  bool get isBigId => _id > 1000;
  String toJson() {
    return '{"id":$_id,"name":$_name}';
  }

  /// keep toString at the bottom to follow conventions
  @override
  String toString() {
    return 'User(id: $_id, name; $_name)';
  }
}