import 'package:flutter/cupertino.dart';

/*** Objeto base para construcción de lista de rutas */
class RoutePath {
  const RoutePath(this.pattern, this.builder);

  /*** Ruta */
  final String pattern;
  /*** asocia el "path" de la ruta a un widget. */
  final PathWidgetBuilder builder;

}

typedef PathWidgetBuilder = Widget Function(String, Object);