import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
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
  const UserEntity({
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

  // copy with method
  UserEntity copyWith({
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
    return UserEntity(
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

// empty constructor
  factory UserEntity.empty() {
    return const UserEntity(
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

  // to string method
  @override
  String toString() {
    return """
      UserEntity(id: $id, email: $email, username: $name, password: $password, address: $address, type: $type, version: $version, cart: $cart)
      ----------------------------------------------------------
      TOKEN: $token
      """;
  }

  @override
  List<Object?> get props =>
      [name, email, password, address, type, id, token, version, cart];
}
