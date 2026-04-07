import 'package:dartz/dartz.dart';
import 'package:flutter_base/core/error/failures.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = Future<Either<Failure, void>>;
