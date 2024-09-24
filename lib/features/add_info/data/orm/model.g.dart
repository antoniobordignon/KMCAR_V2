// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// ignore_for_file: type=lint
class $TripsTable extends Trips with TableInfo<$TripsTable, Trip> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TripsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _kilometragemMeta =
      const VerificationMeta('kilometragem');
  @override
  late final GeneratedColumn<double> kilometragem = GeneratedColumn<double>(
      'kilometragem', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _motoristaMeta =
      const VerificationMeta('motorista');
  @override
  late final GeneratedColumn<String> motorista = GeneratedColumn<String>(
      'motorista', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _destinoMeta =
      const VerificationMeta('destino');
  @override
  late final GeneratedColumn<String> destino = GeneratedColumn<String>(
      'destino', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _imagePathMeta =
      const VerificationMeta('imagePath');
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
      'image_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, kilometragem, motorista, destino, imagePath];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trips';
  @override
  VerificationContext validateIntegrity(Insertable<Trip> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('kilometragem')) {
      context.handle(
          _kilometragemMeta,
          kilometragem.isAcceptableOrUnknown(
              data['kilometragem']!, _kilometragemMeta));
    } else if (isInserting) {
      context.missing(_kilometragemMeta);
    }
    if (data.containsKey('motorista')) {
      context.handle(_motoristaMeta,
          motorista.isAcceptableOrUnknown(data['motorista']!, _motoristaMeta));
    } else if (isInserting) {
      context.missing(_motoristaMeta);
    }
    if (data.containsKey('destino')) {
      context.handle(_destinoMeta,
          destino.isAcceptableOrUnknown(data['destino']!, _destinoMeta));
    } else if (isInserting) {
      context.missing(_destinoMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Trip map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Trip(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      kilometragem: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}kilometragem'])!,
      motorista: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}motorista'])!,
      destino: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}destino'])!,
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path']),
    );
  }

  @override
  $TripsTable createAlias(String alias) {
    return $TripsTable(attachedDatabase, alias);
  }
}

class Trip extends DataClass implements Insertable<Trip> {
  final int id;
  final double kilometragem;
  final String motorista;
  final String destino;
  final String? imagePath;
  const Trip(
      {required this.id,
      required this.kilometragem,
      required this.motorista,
      required this.destino,
      this.imagePath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['kilometragem'] = Variable<double>(kilometragem);
    map['motorista'] = Variable<String>(motorista);
    map['destino'] = Variable<String>(destino);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    return map;
  }

  TripsCompanion toCompanion(bool nullToAbsent) {
    return TripsCompanion(
      id: Value(id),
      kilometragem: Value(kilometragem),
      motorista: Value(motorista),
      destino: Value(destino),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
    );
  }

  factory Trip.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Trip(
      id: serializer.fromJson<int>(json['id']),
      kilometragem: serializer.fromJson<double>(json['kilometragem']),
      motorista: serializer.fromJson<String>(json['motorista']),
      destino: serializer.fromJson<String>(json['destino']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'kilometragem': serializer.toJson<double>(kilometragem),
      'motorista': serializer.toJson<String>(motorista),
      'destino': serializer.toJson<String>(destino),
      'imagePath': serializer.toJson<String?>(imagePath),
    };
  }

  Trip copyWith(
          {int? id,
          double? kilometragem,
          String? motorista,
          String? destino,
          Value<String?> imagePath = const Value.absent()}) =>
      Trip(
        id: id ?? this.id,
        kilometragem: kilometragem ?? this.kilometragem,
        motorista: motorista ?? this.motorista,
        destino: destino ?? this.destino,
        imagePath: imagePath.present ? imagePath.value : this.imagePath,
      );
  Trip copyWithCompanion(TripsCompanion data) {
    return Trip(
      id: data.id.present ? data.id.value : this.id,
      kilometragem: data.kilometragem.present
          ? data.kilometragem.value
          : this.kilometragem,
      motorista: data.motorista.present ? data.motorista.value : this.motorista,
      destino: data.destino.present ? data.destino.value : this.destino,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Trip(')
          ..write('id: $id, ')
          ..write('kilometragem: $kilometragem, ')
          ..write('motorista: $motorista, ')
          ..write('destino: $destino, ')
          ..write('imagePath: $imagePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, kilometragem, motorista, destino, imagePath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Trip &&
          other.id == this.id &&
          other.kilometragem == this.kilometragem &&
          other.motorista == this.motorista &&
          other.destino == this.destino &&
          other.imagePath == this.imagePath);
}

class TripsCompanion extends UpdateCompanion<Trip> {
  final Value<int> id;
  final Value<double> kilometragem;
  final Value<String> motorista;
  final Value<String> destino;
  final Value<String?> imagePath;
  const TripsCompanion({
    this.id = const Value.absent(),
    this.kilometragem = const Value.absent(),
    this.motorista = const Value.absent(),
    this.destino = const Value.absent(),
    this.imagePath = const Value.absent(),
  });
  TripsCompanion.insert({
    this.id = const Value.absent(),
    required double kilometragem,
    required String motorista,
    required String destino,
    this.imagePath = const Value.absent(),
  })  : kilometragem = Value(kilometragem),
        motorista = Value(motorista),
        destino = Value(destino);
  static Insertable<Trip> custom({
    Expression<int>? id,
    Expression<double>? kilometragem,
    Expression<String>? motorista,
    Expression<String>? destino,
    Expression<String>? imagePath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (kilometragem != null) 'kilometragem': kilometragem,
      if (motorista != null) 'motorista': motorista,
      if (destino != null) 'destino': destino,
      if (imagePath != null) 'image_path': imagePath,
    });
  }

  TripsCompanion copyWith(
      {Value<int>? id,
      Value<double>? kilometragem,
      Value<String>? motorista,
      Value<String>? destino,
      Value<String?>? imagePath}) {
    return TripsCompanion(
      id: id ?? this.id,
      kilometragem: kilometragem ?? this.kilometragem,
      motorista: motorista ?? this.motorista,
      destino: destino ?? this.destino,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (kilometragem.present) {
      map['kilometragem'] = Variable<double>(kilometragem.value);
    }
    if (motorista.present) {
      map['motorista'] = Variable<String>(motorista.value);
    }
    if (destino.present) {
      map['destino'] = Variable<String>(destino.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TripsCompanion(')
          ..write('id: $id, ')
          ..write('kilometragem: $kilometragem, ')
          ..write('motorista: $motorista, ')
          ..write('destino: $destino, ')
          ..write('imagePath: $imagePath')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $TripsTable trips = $TripsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [trips];
}

typedef $$TripsTableCreateCompanionBuilder = TripsCompanion Function({
  Value<int> id,
  required double kilometragem,
  required String motorista,
  required String destino,
  Value<String?> imagePath,
});
typedef $$TripsTableUpdateCompanionBuilder = TripsCompanion Function({
  Value<int> id,
  Value<double> kilometragem,
  Value<String> motorista,
  Value<String> destino,
  Value<String?> imagePath,
});

class $$TripsTableFilterComposer extends FilterComposer<_$AppDb, $TripsTable> {
  $$TripsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get kilometragem => $state.composableBuilder(
      column: $state.table.kilometragem,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get motorista => $state.composableBuilder(
      column: $state.table.motorista,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get destino => $state.composableBuilder(
      column: $state.table.destino,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get imagePath => $state.composableBuilder(
      column: $state.table.imagePath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TripsTableOrderingComposer
    extends OrderingComposer<_$AppDb, $TripsTable> {
  $$TripsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get kilometragem => $state.composableBuilder(
      column: $state.table.kilometragem,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get motorista => $state.composableBuilder(
      column: $state.table.motorista,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get destino => $state.composableBuilder(
      column: $state.table.destino,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get imagePath => $state.composableBuilder(
      column: $state.table.imagePath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$TripsTableTableManager extends RootTableManager<
    _$AppDb,
    $TripsTable,
    Trip,
    $$TripsTableFilterComposer,
    $$TripsTableOrderingComposer,
    $$TripsTableCreateCompanionBuilder,
    $$TripsTableUpdateCompanionBuilder,
    (Trip, BaseReferences<_$AppDb, $TripsTable, Trip>),
    Trip,
    PrefetchHooks Function()> {
  $$TripsTableTableManager(_$AppDb db, $TripsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TripsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TripsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<double> kilometragem = const Value.absent(),
            Value<String> motorista = const Value.absent(),
            Value<String> destino = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
          }) =>
              TripsCompanion(
            id: id,
            kilometragem: kilometragem,
            motorista: motorista,
            destino: destino,
            imagePath: imagePath,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required double kilometragem,
            required String motorista,
            required String destino,
            Value<String?> imagePath = const Value.absent(),
          }) =>
              TripsCompanion.insert(
            id: id,
            kilometragem: kilometragem,
            motorista: motorista,
            destino: destino,
            imagePath: imagePath,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TripsTableProcessedTableManager = ProcessedTableManager<
    _$AppDb,
    $TripsTable,
    Trip,
    $$TripsTableFilterComposer,
    $$TripsTableOrderingComposer,
    $$TripsTableCreateCompanionBuilder,
    $$TripsTableUpdateCompanionBuilder,
    (Trip, BaseReferences<_$AppDb, $TripsTable, Trip>),
    Trip,
    PrefetchHooks Function()>;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$TripsTableTableManager get trips =>
      $$TripsTableTableManager(_db, _db.trips);
}
