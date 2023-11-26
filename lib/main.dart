// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:polygonid_flutter_sdk/sdk/polygon_id_sdk.dart';
// // import 'package:polygonid_flutter_sdk_example/src/presentation/dependency_injection/dependencies_provider.dart'
// //     as di;
// // import 'package:polygonid_flutter_sdk_example/src/presentation/app.dart';

// // Future<void> main() async {
// //   //Dependency Injection initialization
// //   await di.init();
// //   PolygonIdSdk.I.switchLog(enabled: true);

// //   // App UI locked in portrait mode
// //   await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

// //   runApp(const App());
// // }



// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:polygonid_flutter_sdk/sdk/polygon_id_sdk.dart';
// import 'package:polygonid_flutter_sdk_example/src/presentation/dependency_injection/dependencies_provider.dart'
//     as di;
// import 'package:polygonid_flutter_sdk_example/src/presentation/app.dart';

// Future<void> main() async {
//   // Dependency Injection initialization
//   await di.init();
//   PolygonIdSdk.I.switchLog(enabled: true);

//   // App UI locked in portrait mode
//   await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

//   // Perform biometric authentication
//   bool isAuthenticated = await performBiometricAuthentication();

//   // If biometric authentication is successful, runApp
//   if (isAuthenticated) {
//     runApp(const App());
//   }
// }

// Future<bool> performBiometricAuthentication() async {
//   // Implement your biometric authentication logic here
//   // Example using local_auth package
//   // Replace this with your actual biometric authentication logic
//   // ...

//   return true; // Return true if authentication is successful, otherwise return false
// }




import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart'; // Import the local_auth package
import 'package:polygonid_flutter_sdk/sdk/polygon_id_sdk.dart';
import 'package:polygonid_flutter_sdk_example/src/presentation/dependency_injection/dependencies_provider.dart'
    as di;
import 'package:polygonid_flutter_sdk_example/src/presentation/app.dart';

Future<void> main() async {
  // Dependency Injection initialization
  await di.init();
  PolygonIdSdk.I.switchLog(enabled: true);

  // App UI locked in portrait mode
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Perform biometric authentication
  bool isAuthenticated = await performBiometricAuthentication();

  // If biometric authentication is successful, runApp
  if (isAuthenticated) {
    runApp(const App());
  }
}

Future<bool> performBiometricAuthentication() async {
  final LocalAuthentication auth = LocalAuthentication();

  try {
    bool canCheckBiometrics = await auth.canCheckBiometrics;

    if (!canCheckBiometrics) {
      // Device does not support biometrics
      return false;
    }

    bool authenticated = await auth.authenticate(
      localizedReason: 'Authenticate to access the app',
      // useErrorDialogs: true,
      // stickyAuth: true,
    );

    return authenticated;
  } on PlatformException catch (e) {
    print("Error during biometric authentication: $e");
    return false;
  }
}
