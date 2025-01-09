import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String name;
  final String email;
  final String password;
  final String address;
  final String type;
  final String id;
  final String token;
  final int version;
  final List<dynamic> cart;

  // constructor
  const UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.type,
    required this.id,
    required this.token,
    required this.version,
    required this.cart,
  });

  // from json method
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      address: json['address'],
      type: json['type'],
      id: json['_id'],
      token: json['token'],
      version: json['__v'],
      cart: List<Map<String, dynamic>>.from(
        json['cart']?.map(
          (x) => Map<String, dynamic>.from(x),
        ),
      ),
    );
  }

  // to json method
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'type': type,
      '_id': id,
      'token': token,
      '__v': version,
      'cart': cart,
    };
  }

  // empty constructor
  factory UserModel.empty() {
    return const UserModel(
      name: '',
      email: '',
      password: '',
      address: '',
      type: '',
      id: '',
      token: '',
      version: 0,
      cart: [],
    );
  }

  // copy with method
  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? address,
    String? type,
    String? id,
    String? token,
    int? version,
    List<dynamic>? cart,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      type: type ?? this.type,
      id: id ?? this.id,
      token: token ?? this.token,
      version: version ?? this.version,
      cart: cart ?? this.cart,
    );
  }

  // to string method
  @override
  String toString() {
    return """

      UserModel(id: $id, email: $email, username: $name, cart: $cart)

      ----------------------------------------------------------
      TOKEN: $token

      """;
  }

  @override
  List<Object?> get props =>
      [name, email, password, address, type, id, token, version, cart];
}
