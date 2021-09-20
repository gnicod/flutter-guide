
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:walkguide/models/route.dart';
import 'package:walkguide/services/route_service.dart';

class RouteProvider  with ChangeNotifier  {
  late GuidedRoute route; //an instance of a route
  late String errorMessage; //error message
  bool loading = false; //loading the page

  Future<bool> fetchRoute(routename) async {
    setLoading(true);
    // fetch route from the input supplied in the form
    await WalkGuide().fetchRoutes().then((data) {
      setLoading(false);
      if (data.statusCode == 200) {
        //incase of success
        setRoute(GuidedRoute.fromJson(json.decode(data.body)));
      } else {
        Map<String, dynamic> result = json.decode(data.body);
        setMessage(result['message']); // error message
      }
    });
    return isRoute(); //returns the fetched route
  }

  bool isLoading() {
    return loading; //return true if the app is loading the data
  }

  void setLoading(value) {
    loading = value;
    notifyListeners(); //This method is called when the objects is changed
  }

  void setRoute(value) {
    route = value;
    notifyListeners(); //alert listeners that route's value changed
  }

  GuidedRoute getRoute() {
    return route; //returns the fetched route
  }

  void setMessage(value) {
    errorMessage = value;
    notifyListeners(); // alert listeners that the error message changed
  }

  String getMessage() {
    return errorMessage; // get the error message
  }

  bool isRoute() {
    return route != null ? true : false; // returns true if route is not null, anf false otherwise
  }
}
