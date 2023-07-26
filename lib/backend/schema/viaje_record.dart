import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ViajeRecord extends FirestoreRecord {
  ViajeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_location" field.
  LatLng? _userLocation;
  LatLng? get userLocation => _userLocation;
  bool hasUserLocation() => _userLocation != null;

  // "user_uid" field.
  String? _userUid;
  String get userUid => _userUid ?? '';
  bool hasUserUid() => _userUid != null;

  // "driver_location" field.
  LatLng? _driverLocation;
  LatLng? get driverLocation => _driverLocation;
  bool hasDriverLocation() => _driverLocation != null;

  // "driver_uid" field.
  String? _driverUid;
  String get driverUid => _driverUid ?? '';
  bool hasDriverUid() => _driverUid != null;

  // "destination_location" field.
  LatLng? _destinationLocation;
  LatLng? get destinationLocation => _destinationLocation;
  bool hasDestinationLocation() => _destinationLocation != null;

  // "destination_address" field.
  String? _destinationAddress;
  String get destinationAddress => _destinationAddress ?? '';
  bool hasDestinationAddress() => _destinationAddress != null;

  // "user_adress" field.
  String? _userAdress;
  String get userAdress => _userAdress ?? '';
  bool hasUserAdress() => _userAdress != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "driver_name" field.
  String? _driverName;
  String get driverName => _driverName ?? '';
  bool hasDriverName() => _driverName != null;

  // "is_driver_assigne" field.
  bool? _isDriverAssigne;
  bool get isDriverAssigne => _isDriverAssigne ?? false;
  bool hasIsDriverAssigne() => _isDriverAssigne != null;

  void _initializeFields() {
    _userLocation = snapshotData['user_location'] as LatLng?;
    _userUid = snapshotData['user_uid'] as String?;
    _driverLocation = snapshotData['driver_location'] as LatLng?;
    _driverUid = snapshotData['driver_uid'] as String?;
    _destinationLocation = snapshotData['destination_location'] as LatLng?;
    _destinationAddress = snapshotData['destination_address'] as String?;
    _userAdress = snapshotData['user_adress'] as String?;
    _userName = snapshotData['user_name'] as String?;
    _driverName = snapshotData['driver_name'] as String?;
    _isDriverAssigne = snapshotData['is_driver_assigne'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('viaje');

  static Stream<ViajeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ViajeRecord.fromSnapshot(s));

  static Future<ViajeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ViajeRecord.fromSnapshot(s));

  static ViajeRecord fromSnapshot(DocumentSnapshot snapshot) => ViajeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ViajeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ViajeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ViajeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ViajeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createViajeRecordData({
  LatLng? userLocation,
  String? userUid,
  LatLng? driverLocation,
  String? driverUid,
  LatLng? destinationLocation,
  String? destinationAddress,
  String? userAdress,
  String? userName,
  String? driverName,
  bool? isDriverAssigne,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_location': userLocation,
      'user_uid': userUid,
      'driver_location': driverLocation,
      'driver_uid': driverUid,
      'destination_location': destinationLocation,
      'destination_address': destinationAddress,
      'user_adress': userAdress,
      'user_name': userName,
      'driver_name': driverName,
      'is_driver_assigne': isDriverAssigne,
    }.withoutNulls,
  );

  return firestoreData;
}

class ViajeRecordDocumentEquality implements Equality<ViajeRecord> {
  const ViajeRecordDocumentEquality();

  @override
  bool equals(ViajeRecord? e1, ViajeRecord? e2) {
    return e1?.userLocation == e2?.userLocation &&
        e1?.userUid == e2?.userUid &&
        e1?.driverLocation == e2?.driverLocation &&
        e1?.driverUid == e2?.driverUid &&
        e1?.destinationLocation == e2?.destinationLocation &&
        e1?.destinationAddress == e2?.destinationAddress &&
        e1?.userAdress == e2?.userAdress &&
        e1?.userName == e2?.userName &&
        e1?.driverName == e2?.driverName &&
        e1?.isDriverAssigne == e2?.isDriverAssigne;
  }

  @override
  int hash(ViajeRecord? e) => const ListEquality().hash([
        e?.userLocation,
        e?.userUid,
        e?.driverLocation,
        e?.driverUid,
        e?.destinationLocation,
        e?.destinationAddress,
        e?.userAdress,
        e?.userName,
        e?.driverName,
        e?.isDriverAssigne
      ]);

  @override
  bool isValidKey(Object? o) => o is ViajeRecord;
}
