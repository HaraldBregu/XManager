// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import '../../../src/data/models/device_program.dart';
import '../../../src/data/models/player.dart';
import '../../../src/data/models/session_program.dart';
import '../../../src/data/models/user.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 1867851614018690700),
      name: 'DeviceProgram',
      lastPropertyId: const IdUid(2, 6681701288498094287),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 4607639344418865982),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 6681701288498094287),
            name: 'title',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 5130765843542086929),
      name: 'Player',
      lastPropertyId: const IdUid(7, 3886669958476114414),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7247297488175405934),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 477777211584605699),
            name: 'fullname',
            type: 9,
            flags: 2080,
            indexId: const IdUid(1, 3561374273845448870)),
        ModelProperty(
            id: const IdUid(3, 8845614941537992231),
            name: 'birthdate',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 1365127327882642222),
            name: 'weight',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 1630141694525570271),
            name: 'height',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 7395739180677865982),
            name: 'role',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 3886669958476114414),
            name: 'nationality',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 8047256837186541153),
      name: 'SessionProgram',
      lastPropertyId: const IdUid(6, 3719024897322297168),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2226798289637898018),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3313478411236135078),
            name: 'title',
            type: 9,
            flags: 2080,
            indexId: const IdUid(2, 494764993099841677)),
        ModelProperty(
            id: const IdUid(3, 4313053614974121059),
            name: 'description',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 3574555201736626415),
            name: 'startDate',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 3334105498706692345),
            name: 'createdAt',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 3719024897322297168),
            name: 'updatedAt',
            type: 10,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(5, 7310995955925224460),
      name: 'User',
      lastPropertyId: const IdUid(7, 1017968642511537596),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 8982345125835003799),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 6668513622713303230),
            name: 'fullname',
            type: 9,
            flags: 2080,
            indexId: const IdUid(3, 2746940215013751864)),
        ModelProperty(
            id: const IdUid(3, 7416909721912551910),
            name: 'birthdate',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 7907521402553467372),
            name: 'weight',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 3241214933951934163),
            name: 'height',
            type: 8,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 8908268571206559789),
            name: 'role',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 1017968642511537596),
            name: 'nationality',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Shortcut for [Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [Store.new] for an explanation of all parameters.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// Returns the ObjectBox model definition for this project for use with
/// [Store.new].
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(5, 7310995955925224460),
      lastIndexId: const IdUid(3, 2746940215013751864),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [5790660189180963841],
      retiredIndexUids: const [],
      retiredPropertyUids: const [767879421192578772, 8126492403450893890],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    DeviceProgram: EntityDefinition<DeviceProgram>(
        model: _entities[0],
        toOneRelations: (DeviceProgram object) => [],
        toManyRelations: (DeviceProgram object) => {},
        getId: (DeviceProgram object) => object.id,
        setId: (DeviceProgram object, int id) {
          object.id = id;
        },
        objectToFB: (DeviceProgram object, fb.Builder fbb) {
          final titleOffset = fbb.writeString(object.title);
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, titleOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = DeviceProgram()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..title = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 6, '');

          return object;
        }),
    Player: EntityDefinition<Player>(
        model: _entities[1],
        toOneRelations: (Player object) => [],
        toManyRelations: (Player object) => {},
        getId: (Player object) => object.id,
        setId: (Player object, int id) {
          object.id = id;
        },
        objectToFB: (Player object, fb.Builder fbb) {
          final fullnameOffset = fbb.writeString(object.fullname);
          final roleOffset =
              object.role == null ? null : fbb.writeString(object.role!);
          final nationalityOffset = object.nationality == null
              ? null
              : fbb.writeString(object.nationality!);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, fullnameOffset);
          fbb.addInt64(2, object.birthdate?.millisecondsSinceEpoch);
          fbb.addFloat64(3, object.weight);
          fbb.addFloat64(4, object.height);
          fbb.addOffset(5, roleOffset);
          fbb.addOffset(6, nationalityOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final birthdateValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 8);
          final object = Player()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..fullname = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 6, '')
            ..birthdate = birthdateValue == null
                ? null
                : DateTime.fromMillisecondsSinceEpoch(birthdateValue)
            ..weight = const fb.Float64Reader()
                .vTableGetNullable(buffer, rootOffset, 10)
            ..height = const fb.Float64Reader()
                .vTableGetNullable(buffer, rootOffset, 12)
            ..role = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 14)
            ..nationality = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 16);

          return object;
        }),
    SessionProgram: EntityDefinition<SessionProgram>(
        model: _entities[2],
        toOneRelations: (SessionProgram object) => [],
        toManyRelations: (SessionProgram object) => {},
        getId: (SessionProgram object) => object.id,
        setId: (SessionProgram object, int id) {
          object.id = id;
        },
        objectToFB: (SessionProgram object, fb.Builder fbb) {
          final titleOffset = fbb.writeString(object.title);
          final descriptionOffset = fbb.writeString(object.description);
          fbb.startTable(7);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, titleOffset);
          fbb.addOffset(2, descriptionOffset);
          fbb.addInt64(3, object.startDate?.millisecondsSinceEpoch);
          fbb.addInt64(4, object.createdAt?.millisecondsSinceEpoch);
          fbb.addInt64(5, object.updatedAt?.millisecondsSinceEpoch);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final startDateValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 10);
          final createdAtValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 12);
          final updatedAtValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 14);
          final object = SessionProgram()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..title = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 6, '')
            ..description = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 8, '')
            ..startDate = startDateValue == null
                ? null
                : DateTime.fromMillisecondsSinceEpoch(startDateValue)
            ..createdAt = createdAtValue == null
                ? null
                : DateTime.fromMillisecondsSinceEpoch(createdAtValue)
            ..updatedAt = updatedAtValue == null
                ? null
                : DateTime.fromMillisecondsSinceEpoch(updatedAtValue);

          return object;
        }),
    User: EntityDefinition<User>(
        model: _entities[3],
        toOneRelations: (User object) => [],
        toManyRelations: (User object) => {},
        getId: (User object) => object.id,
        setId: (User object, int id) {
          object.id = id;
        },
        objectToFB: (User object, fb.Builder fbb) {
          final fullnameOffset = fbb.writeString(object.fullname);
          final roleOffset =
              object.role == null ? null : fbb.writeString(object.role!);
          final nationalityOffset = object.nationality == null
              ? null
              : fbb.writeString(object.nationality!);
          fbb.startTable(8);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, fullnameOffset);
          fbb.addInt64(2, object.birthdate?.millisecondsSinceEpoch);
          fbb.addFloat64(3, object.weight);
          fbb.addFloat64(4, object.height);
          fbb.addOffset(5, roleOffset);
          fbb.addOffset(6, nationalityOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final birthdateValue =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 8);
          final object = User()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..fullname = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 6, '')
            ..birthdate = birthdateValue == null
                ? null
                : DateTime.fromMillisecondsSinceEpoch(birthdateValue)
            ..weight = const fb.Float64Reader()
                .vTableGetNullable(buffer, rootOffset, 10)
            ..height = const fb.Float64Reader()
                .vTableGetNullable(buffer, rootOffset, 12)
            ..role = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 14)
            ..nationality = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 16);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [DeviceProgram] entity fields to define ObjectBox queries.
class DeviceProgram_ {
  /// see [DeviceProgram.id]
  static final id =
      QueryIntegerProperty<DeviceProgram>(_entities[0].properties[0]);

  /// see [DeviceProgram.title]
  static final title =
      QueryStringProperty<DeviceProgram>(_entities[0].properties[1]);
}

/// [Player] entity fields to define ObjectBox queries.
class Player_ {
  /// see [Player.id]
  static final id = QueryIntegerProperty<Player>(_entities[1].properties[0]);

  /// see [Player.fullname]
  static final fullname =
      QueryStringProperty<Player>(_entities[1].properties[1]);

  /// see [Player.birthdate]
  static final birthdate =
      QueryIntegerProperty<Player>(_entities[1].properties[2]);

  /// see [Player.weight]
  static final weight = QueryDoubleProperty<Player>(_entities[1].properties[3]);

  /// see [Player.height]
  static final height = QueryDoubleProperty<Player>(_entities[1].properties[4]);

  /// see [Player.role]
  static final role = QueryStringProperty<Player>(_entities[1].properties[5]);

  /// see [Player.nationality]
  static final nationality =
      QueryStringProperty<Player>(_entities[1].properties[6]);
}

/// [SessionProgram] entity fields to define ObjectBox queries.
class SessionProgram_ {
  /// see [SessionProgram.id]
  static final id =
      QueryIntegerProperty<SessionProgram>(_entities[2].properties[0]);

  /// see [SessionProgram.title]
  static final title =
      QueryStringProperty<SessionProgram>(_entities[2].properties[1]);

  /// see [SessionProgram.description]
  static final description =
      QueryStringProperty<SessionProgram>(_entities[2].properties[2]);

  /// see [SessionProgram.startDate]
  static final startDate =
      QueryIntegerProperty<SessionProgram>(_entities[2].properties[3]);

  /// see [SessionProgram.createdAt]
  static final createdAt =
      QueryIntegerProperty<SessionProgram>(_entities[2].properties[4]);

  /// see [SessionProgram.updatedAt]
  static final updatedAt =
      QueryIntegerProperty<SessionProgram>(_entities[2].properties[5]);
}

/// [User] entity fields to define ObjectBox queries.
class User_ {
  /// see [User.id]
  static final id = QueryIntegerProperty<User>(_entities[3].properties[0]);

  /// see [User.fullname]
  static final fullname = QueryStringProperty<User>(_entities[3].properties[1]);

  /// see [User.birthdate]
  static final birthdate =
      QueryIntegerProperty<User>(_entities[3].properties[2]);

  /// see [User.weight]
  static final weight = QueryDoubleProperty<User>(_entities[3].properties[3]);

  /// see [User.height]
  static final height = QueryDoubleProperty<User>(_entities[3].properties[4]);

  /// see [User.role]
  static final role = QueryStringProperty<User>(_entities[3].properties[5]);

  /// see [User.nationality]
  static final nationality =
      QueryStringProperty<User>(_entities[3].properties[6]);
}
