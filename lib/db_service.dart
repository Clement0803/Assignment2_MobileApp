import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('app.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  email TEXT NOT NULL,
  password TEXT NOT NULL
)
''');

    await db.execute('''
CREATE TABLE activities (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  location TEXT NOT NULL,
  image TEXT NOT NULL,
  description TEXT NOT NULL
)
''');

    await db.execute('''
CREATE TABLE cart (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  activityId INTEGER NOT NULL,
  numberOfBookings INTEGER NOT NULL,
  FOREIGN KEY (activityId) REFERENCES activities(id)
)
''');

    await _insertInitialActivities(db);
  }

  Future<int> createUser(String email, String password) async {
    final db = await instance.database;
    final data = {'email': email, 'password': password};
    return await db.insert('users', data);
  }

  Future<Map<String, dynamic>?> getUser(String email, String password) async {
    final db = await instance.database;
    final result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null;
    }
  }

  Future<int> createActivity(String name, String location, String image, String description) async {
    final db = await instance.database;
    final data = {
      'name': name,
      'location': location,
      'image': image,
      'description': description,
    };
    return await db.insert('activities', data);
  }

  Future<List<Map<String, dynamic>>> getActivities() async {
    final db = await instance.database;
    final result = await db.query('activities');
    return result;
  }

  Future<void> _insertInitialActivities(Database db) async {
    final activities = [
      {'name': 'Batu Caves Tour', 'location': 'Selangor', 'image': 'assets/images/batu_caves.jpg', 'description': 'Explore the historic limestone caves and Hindu shrines.' },
      {'name': 'Scuba Diving', 'location': 'Sipadan Island', 'image': 'assets/images/diving.jpg', 'description': 'Discover the vibrant marine life by scuba diving in Sipadan, one of the top diving spots in the world.'},
      {'name': 'Jungle Trekking', 'location': 'Taman Negara', 'image': 'assets/images/trekking.jpg', 'description': 'Immerse yourself in the oldest rainforest in the world through exciting jungle trekking adventures in Taman Negara.'},
      {'name': 'City Tour', 'location': 'Kuala Lumpur', 'image': 'assets/images/city_tour.jpg', 'description': 'Experience the bustling city life of Kuala Lumpur with visits to iconic landmarks like the Petronas Twin Towers and KL Tower.'},
      {'name': 'Island Hopping', 'location': 'Langkawi', 'image': 'assets/images/island_hopping.jpg', 'description': 'Embark on an island-hopping adventure in Langkawi, exploring its pristine beaches and vibrant marine ecosystems.'},
      {'name': 'River Cruise', 'location': 'Melaka', 'image': 'assets/images/river_cruise.jpg', 'description': 'Relax and enjoy a scenic river cruise along the Melaka River, surrounded by rich historical landmarks and cultural sites.'},
    ];

    for (var activity in activities) {
      await db.insert('activities', activity);
    }
  }

  Future<int> addToCart(Map<String, dynamic> activity, int numberOfBookings) async {
    final db = await instance.database;
    final data = {
      'activityId': activity['id'],
      'numberOfBookings': numberOfBookings,
    };
    return await db.insert('cart', data);
  }

  Future<List<Map<String, dynamic>>> getCartItems() async {
    final db = await instance.database;
    final result = await db.rawQuery('''
      SELECT c.id AS cartId, a.*, c.numberOfBookings
      FROM cart c
      JOIN activities a ON c.activityId = a.id
    ''');
    return result;
  }

  Future<int> updateCartItem(int cartId, int newNumberOfBookings) async {
    final db = await instance.database;
    return await db.update(
      'cart',
      {'numberOfBookings': newNumberOfBookings},
      where: 'id = ?',
      whereArgs: [cartId],
    );
  }

  Future<int> deleteCartItem(int cartId) async {
    final db = await instance.database;
    return await db.delete(
      'cart',
      where: 'id = ?',
      whereArgs: [cartId],
    );
  }
}
