
import 'package:nat_cv/screens/accueil/accueil2.dart';
import 'package:nat_cv/screens/login/login_screen.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors =
    <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor as Constructor<Object>;
}

class ClassBuilder {
  static void registerClasses() {
    register<Accueil2Page>(() => Accueil2Page());
    register<LoginScreen>(() => LoginScreen());
    register<LoginScreen>(() => LoginScreen());
    register<LoginScreen>(() => LoginScreen());
  }

  static dynamic fromString(String type) {
    return _constructors[type]!();
  }
}
