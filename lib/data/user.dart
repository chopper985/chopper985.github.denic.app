import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class User {
  String? idUser;
  String? name;
  String? avatar;
  String? phone_number;
  String? email;
  String? gioiTinh;
  String? ngaySinh;
  User({
    this.idUser,
    this.name,
    this.avatar,
    this.phone_number,
    this.email,
    this.gioiTinh,
    this.ngaySinh,
  });

  User copyWith({
    String? idUser,
    String? name,
    String? avatar,
    String? phone_number,
    String? email,
    String? gioiTinh,
    String? ngaySinh,
  }) {
    return User(
      idUser: idUser ?? this.idUser,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      phone_number: phone_number ?? this.phone_number,
      email: email ?? this.email,
      gioiTinh: gioiTinh ?? this.gioiTinh,
      ngaySinh: ngaySinh ?? this.ngaySinh,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idUser': idUser,
      'name': name,
      'avatar': avatar,
      'phone_number': phone_number,
      'email': email,
      'gioiTinh': gioiTinh,
      'ngaySinh': ngaySinh,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      idUser: map['idUser'],
      name: map['name'],
      avatar: map['avatar'],
      phone_number: map['phone_number'],
      email: map['email'],
      gioiTinh: map['gioiTinh'],
      ngaySinh: map['ngaySinh'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(idUser: $idUser, name: $name, avatar: $avatar, phone_number: $phone_number, email: $email, gioiTinh: $gioiTinh, ngaySinh: $ngaySinh)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.idUser == idUser &&
      other.name == name &&
      other.avatar == avatar &&
      other.phone_number == phone_number &&
      other.email == email &&
      other.gioiTinh == gioiTinh &&
      other.ngaySinh == ngaySinh;
  }

  @override
  int get hashCode {
    return idUser.hashCode ^
      name.hashCode ^
      avatar.hashCode ^
      phone_number.hashCode ^
      email.hashCode ^
      gioiTinh.hashCode ^
      ngaySinh.hashCode;
  }
}
