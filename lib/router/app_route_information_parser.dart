import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moneymanage/feature/splash/splash.dart';
import 'package:moneymanage/router/router_configuration.dart';

class AppRouteInformationParser
    extends RouteInformationParser<RouteConfiguration> {
  bool isStartUp = true;
  Uri? initialUri;

  @override
  Future<RouteConfiguration> parseRouteInformation(
      RouteInformation routeInformation) {
    Uri? uri;
    if (isStartUp && initialUri != null) {
      uri = initialUri;
      isStartUp = false;
    } else {
      uri = Uri.tryParse(routeInformation.location.toString());
    }
    late Page<dynamic> page;
    if (uri == null) {
      TODO:
      page = Splash.page();
    } else {
      final List<String> uriSegments = uri.pathSegments;
      if (uriSegments.isEmpty) {
        TODO:
        page = Splash.page();
      }
    }

    TODO:
    return SynchronousFuture<RouteConfiguration>(
      RouteConfiguration(page: page),
    );
  }
}
