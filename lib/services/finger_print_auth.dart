// // import 'package:flutter/material.dart';
// // import 'package:local_auth/local_auth.dart';

// // class LocalAuthService {
// //   static final _auth = LocalAuthentication();

// //   static Future<bool> _canAuthenticate() async => await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

// //   static Future<bool> authenticate() async {
// //     try {
// //       if (!await _canAuthenticate()) {
// //         return false;
// //       }

// //       return await _auth.authenticate(
// //         authMessages: const [
// //           AndroidAuthMessages(
// //             signInTitle: 'Authenticate to unlock',
// //             cancelButton: 'Cancel',
// //           ),
// //           IOSAuthMessages(
// //             cancelButton: 'Cancel',
// //           ),
// //         ],
// //         localizedReason: 'Use Face Id to authenticate',
// //         options: const AuthenticationOptions(
// //           stickyAuth: true,
// //           useErrorDialogs: true,
// //         )
// //       );
// //     } catch (e) {
// //       debugPrint('Error authenticating: $e');
// //       return false;
// //     }
// //   }
// // }





// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:local_auth/local_auth.dart';

// // class FingerprintAuth extends StatefulWidget {
// //   const FingerprintAuth({Key? key}) : super(key: key);

// //   @override
// //   _FingerprintAuthState createState() => _FingerprintAuthState();
// // }

// // class _FingerprintAuthState extends State<FingerprintAuth> {
// //   final auth = LocalAuthentication();
// //   String authorized = " not authorized";
// //   bool _canCheckBiometric = false;
// //   late List<BiometricType> _availableBiometric;

// //   Future<void> _authenticate() async {
// //     bool authenticated = false;

// //     try {
// //       authenticated = await auth.authenticateWithBiometrics(
// //           localizedReason: "Scan your finger to authenticate",
// //           useErrorDialogs: true,
// //           stickyAuth: true);
// //     } on PlatformException catch (e) {
// //       print(e);
// //     }

// //     setState(() {
// //       authorized =
// //           authenticated ? "Authorized success" : "Failed to authenticate";
// //       print(authorized);
// //     });
// //   }

// //   Future<void> _checkBiometric() async {
// //     bool canCheckBiometric = false;

// //     try {
// //       canCheckBiometric = await auth.canCheckBiometrics;
// //     } on PlatformException catch (e) {
// //       print(e);
// //     }

// //     if (!mounted) return;

// //     setState(() {
// //       _canCheckBiometric = canCheckBiometric;
// //     });
// //   }

// //   Future _getAvailableBiometric() async {
// //     List<BiometricType> availableBiometric = [];

// //     try {
// //       availableBiometric = await auth.getAvailableBiometrics();
// //     } on PlatformException catch (e) {
// //       print(e);
// //     }

// //     setState(() {
// //       _availableBiometric = availableBiometric;
// //     });
// //   }

// //   @override
// //   void initState() {
// //     _checkBiometric();
// //     _getAvailableBiometric();

// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       // appBar: AppBar(title: Text("Fingerprint Auth")),
// //       backgroundColor: Color(0xFF3C3E52),
// //       body: Padding(
// //         padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Center(
// //               child: Text(
// //                 "Login",
// //                 style: TextStyle(
// //                   color: Colors.white,
// //                   fontSize: 48.0,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //             ),
// //             Container(
// //               margin: EdgeInsets.symmetric(vertical: 50.0),
// //               child: Column(
// //                 children: [
// //                   Image.asset(
// //                     "assets/images/fingerprint.png",
// //                     width: 120.0,
// //                   ),
// //                   Text(
// //                     "Fingerprint Auth",
// //                     style: TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 22.0,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                   Container(
// //                     margin: EdgeInsets.symmetric(vertical: 15.0),
// //                     child: Text(
// //                       "Authenticate using your fingerprint insted of your password",
// //                       textAlign: TextAlign.center,
// //                       style: TextStyle(color: Colors.white, height: 1.5),
// //                     ),
// //                   ),
// //                   Container(
// //                     margin: EdgeInsets.symmetric(vertical: 15.0),
// //                     width: double.infinity,
// //                     child: RaisedButton(
// //                       onPressed: _authenticate,
// //                       elevation: 0.0,
// //                       color: Color(0xFF04A5ED),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(30.0),
// //                       ),
// //                       child: Padding(
// //                         padding: const EdgeInsets.symmetric(
// //                             horizontal: 24.0, vertical: 14.0),
// //                         child: Text(
// //                           "Authenticate",
// //                           style: TextStyle(color: Colors.white),
// //                         ),
// //                       ),
// //                     ),
// //                   )
// //                 ],
// //               ),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }




// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:local_auth/local_auth.dart';

// class FingerprintAuth extends StatefulWidget {
//   const FingerprintAuth({Key? key}) : super(key: key);

//   @override
//   _FingerprintAuthState createState() => _FingerprintAuthState();
// }

// class _FingerprintAuthState extends State<FingerprintAuth> {
//   final auth = LocalAuthentication();
//   String authorized = "not authorized";
//   bool _canCheckBiometric = false;
//   late List<BiometricType> _availableBiometric;

//   Future<void> _authenticate() async {
//     bool authenticated = false;

//     try {
//       authenticated = await auth.authenticate(
//         localizedReason: "Scan your finger to authenticate",
//         useErrorDialogs: true,
//         stickyAuth: true,
//       );
//     } on PlatformException catch (e) {
//       print("Error during authentication: $e");
//     }

//     setState(() {
//       authorized =
//           authenticated ? "Authorized success" : "Failed to authenticate";
//       print(authorized);
//     });
//   }

//   Future<void> _checkBiometric() async {
//     bool canCheckBiometric = false;

//     try {
//       canCheckBiometric = await auth.canCheckBiometrics;
//     } on PlatformException catch (e) {
//       print("Error checking biometrics: $e");
//     }

//     if (!mounted) return;

//     setState(() {
//       _canCheckBiometric = canCheckBiometric;
//     });
//   }

//   Future<void> _getAvailableBiometric() async {
//     List<BiometricType> availableBiometric = [];

//     try {
//       availableBiometric = await auth.getAvailableBiometrics();
//     } on PlatformException catch (e) {
//       print("Error getting available biometrics: $e");
//     }

//     setState(() {
//       _availableBiometric = availableBiometric;
//     });
//   }

//   @override
//   void initState() {
//     _checkBiometric();
//     _getAvailableBiometric();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF3C3E52),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//               child: Text(
//                 "Login",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 48.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.symmetric(vertical: 50.0),
//               child: Column(
//                 children: [
//                   Image.asset(
//                     "assets/images/fingerprint.png",
//                     width: 120.0,
//                   ),
//                   Text(
//                     "Fingerprint Auth",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 22.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.symmetric(vertical: 15.0),
//                     child: Text(
//                       "Authenticate using your fingerprint instead of your password",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(color: Colors.white, height: 1.5),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.symmetric(vertical: 15.0),
//                     width: double.infinity,
//                     child: RaisedButton(
//                       onPressed: _authenticate,
//                       elevation: 0.0,
//                       color: Color(0xFF04A5ED),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30.0),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 24.0, vertical: 14.0),
//                         child: Text(
//                           "Authenticate",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class FingerprintAuth extends StatefulWidget {
  const FingerprintAuth({Key? key}) : super(key: key);

  @override
  _FingerprintAuthState createState() => _FingerprintAuthState();
}

class _FingerprintAuthState extends State<FingerprintAuth> {
  final auth = LocalAuthentication();
  String authorized = "not authorized";
  bool _canCheckBiometric = false;
  late List<BiometricType> _availableBiometric;

  Future<void> _authenticate() async {
    bool authenticated = false;

    try {
      authenticated = await auth.authenticate(
        localizedReason: "Scan your finger to authenticate",
        // useErrorDialogs: true,
        // stickyAuth: true,
      );
    } on PlatformException catch (e) {
      print("Error during authentication: $e");
    }

    setState(() {
      authorized =
          authenticated ? "Authorized success" : "Failed to authenticate";
      print(authorized);
    });
  }

  Future<void> _checkBiometric() async {
    bool canCheckBiometric = false;

    try {
      canCheckBiometric = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print("Error checking biometrics: $e");
    }

    if (!mounted) return;

    setState(() {
      _canCheckBiometric = canCheckBiometric;
    });
  }

  Future<void> _getAvailableBiometric() async {
    List<BiometricType> availableBiometric = [];

    try {
      availableBiometric = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print("Error getting available biometrics: $e");
    }

    setState(() {
      _availableBiometric = availableBiometric;
    });
  }

  @override
  void initState() {
    _checkBiometric();
    _getAvailableBiometric();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3C3E52),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 50.0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/fingerprint.png",
                    width: 120.0,
                  ),
                  Text(
                    "Fingerprint Auth",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      "Authenticate using your fingerprint instead of your password",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, height: 1.5),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 15.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _authenticate,
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF04A5ED),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 14.0),
                        child: Text(
                          "Authenticate",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
