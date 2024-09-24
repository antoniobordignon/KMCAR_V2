import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import 'package:kmcar/features/add_info/data/repositories/image_repository.dart';

part 'model.g.dart';

// Fazendo chamada do banco.
LazyDatabase _openConnection(){
  return LazyDatabase(() async {

    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'kmcar.sqlite'));

    return NativeDatabase(file);
  }); 
}

@DriftDatabase(tables: [Trips])
// Criando rotas.
class AppDb extends _$AppDb{

  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Trip>> getTrips() async {
    return await select(trips).get();
  }

  Future<Trip> getTrip(int id) async {
    return await (select (trips)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<bool> updateTrip(TripsCompanion entity) async {
    return await update(trips).replace(entity);
  }

  Future<int> insertTrip(TripsCompanion entity) async {
    return await into(trips).insert(entity);
  }

  Future<int> deleteTrip(int id) async {
    return await (delete(trips)..where((tbl) => tbl.id.equals(id))).go();  
  }
}