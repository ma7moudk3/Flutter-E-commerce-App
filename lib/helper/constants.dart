// Database Columns names
import 'package:flutter/material.dart';

final String dbName = '/ecommerce.db';
final String tableName = 'cartProduct';
final String columnName = 'name';
final String columnImage = 'image';
final String columnPrice = 'price';
final String columnQuantity = 'quantity';
final String columnid = 'id';

// SharedPrefrences User Key

const USER_DATA_KEY = 'user';

// CheckOut
const kTileHeight = 50.0;
const inProgressColor = Colors.black87;
const todoColor = Color(0xffd1d2d7);

enum Pages {
  DeliveryTime,
  AddAddress,
  Summary,
}
