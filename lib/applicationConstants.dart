import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:latlong2/latlong.dart';

class applicationConstants {
  // Firebase constants
  static const String FIREBASE_BASE_URL =
      "https://hope-line-default-rtdb.asia-southeast1.firebasedatabase.app";

  static FirebaseDatabase getFirebaseInstance() {
    return FirebaseDatabase.instanceFor(
        app: Firebase.app(),
        databaseURL: applicationConstants.FIREBASE_BASE_URL);
  }

  static const String mapBoxAccessToken =
      'pk.eyJ1IjoiZHlhcnkwMTciLCJhIjoiY2wxaDhtams2MGJrcTNqbjJ5N2s2bTh5diJ9.cidFRjA1obU6y8MoJTy3RA';

  static const String mapBoxStyleId =
      'https://api.mapbox.com/styles/v1/dyary017/clj7qr4em000301nufkhz6ldq/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZHlhcnkwMTciLCJhIjoiY2wxaDhtams2MGJrcTNqbjJ5N2s2bTh5diJ9.cidFRjA1obU6y8MoJTy3RA';

  static const myLocation = LatLng(51.5090214, -0.1982948);
}
