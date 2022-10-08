abstract class Usecase<Type, Params> {
  Type? call(Params params);
}

class NoParams {}
