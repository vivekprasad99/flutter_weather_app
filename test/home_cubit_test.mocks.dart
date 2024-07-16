// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_weather_app/test/home_cubit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:flutter_weather_app/core/error/failure.dart' as _i6;
import 'package:flutter_weather_app/weather/home/data/models/weather_model.dart'
    as _i7;
import 'package:flutter_weather_app/weather/home/domain/repositories/home_repositories.dart'
    as _i2;
import 'package:flutter_weather_app/weather/home/domain/usecases/home_usecase.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeHomeRepositories_0 extends _i1.SmartFake
    implements _i2.HomeRepositories {
  _FakeHomeRepositories_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HomeUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeUsecase extends _i1.Mock implements _i4.HomeUsecase {
  MockHomeUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.HomeRepositories get homeRepositories => (super.noSuchMethod(
        Invocation.getter(#homeRepositories),
        returnValue: _FakeHomeRepositories_0(
          this,
          Invocation.getter(#homeRepositories),
        ),
      ) as _i2.HomeRepositories);

  @override
  _i5.Future<_i3.Either<_i6.Failure, _i7.WeatherModel>> call(
          String? cityName) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [cityName],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, _i7.WeatherModel>>.value(
                _FakeEither_1<_i6.Failure, _i7.WeatherModel>(
          this,
          Invocation.method(
            #call,
            [cityName],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i7.WeatherModel>>);
}
