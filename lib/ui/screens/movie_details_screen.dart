import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String routeName = "movieDetailsScreen";

class MovieDetailsScreen extends StatelessWidget {
  static const routeName = '/passArguments';

  final String movieID;

  MovieDetailsScreen({
    Key? key,
    required this.movieID,
  }) : super(key: key);

  Widget build(BuildContext context) {
    // This is used in the platform side to register the view.
    const String viewType = '<platform-view-type>';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{};
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        // return widget on Android.
        return Scaffold(
            body: Scaffold(
                body: Center(
                    child: Text("Andriod Platform is Not Avaliable yet"))));
      case TargetPlatform.iOS:
        // This is used in the platform side to register the view.
        const String viewType = '<platform-view-type>';
        // Pass parameters to the platform side.
        final Map<String, dynamic> creationParams = <String, dynamic>{};
        creationParams["movieID"] = movieID;
        return UiKitView(
          viewType: viewType,
          layoutDirection: TextDirection.ltr,
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec(),
        );
      default:
        throw UnsupportedError('Unsupported platform view');
    }
  }
}
