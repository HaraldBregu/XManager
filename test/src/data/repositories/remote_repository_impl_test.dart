import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/shared/data/datasources/local/network_datasource.dart';
import 'package:xmanager/src/shared/data/datasources/remote/remote_datasource.dart';
import 'package:xmanager/src/shared/data/models/dinamo_model.dart';
import 'package:xmanager/src/shared/data/models/profile_model.dart';
import 'package:xmanager/src/shared/data/repository/profile_repository_impl.dart';

import 'remote_repository_impl_test.mocks.dart';

@GenerateMocks([RemoteDataSource])
@GenerateMocks([NetworkDataSource])
void main() {
  late ProfileRepositoryImpl profileRepositoryImpl;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockNetworkDataSource mockNetworkDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkDataSource = MockNetworkDataSource();
    profileRepositoryImpl = ProfileRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkDataSource: mockNetworkDataSource,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkDataSource.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkDataSource.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('get current profile', () {
    const tCurrentProfile = ProfileModel(
      fullname: "fullname",
      dinamo: DinamoModel(leftBleMac: "", rightBleMac: ""),
    );

    test(
      'should check if the device is online',
      () async {
        when(mockNetworkDataSource.isConnected).thenAnswer((_) async => true);
        profileRepositoryImpl.getCurrentProfile();
        verify(mockNetworkDataSource.isConnected);
      },
    );

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          when(mockRemoteDataSource.getCurrentProfile())
              .thenAnswer((_) async => tCurrentProfile);

          final result = await profileRepositoryImpl.getCurrentProfile();

          verify(mockRemoteDataSource.getCurrentProfile());
          expect(result, equals(const Right(tCurrentProfile)));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          when(mockRemoteDataSource.getCurrentProfile())
              .thenThrow(NoCurrentProfile());
          final result = await profileRepositoryImpl.getCurrentProfile();
          verify(mockRemoteDataSource.getCurrentProfile());
          expect(result, equals(Left(NoCurrentProfile())));
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          when(mockRemoteDataSource.getCurrentProfile())
              .thenAnswer((_) async => tCurrentProfile);

          final result = await profileRepositoryImpl.getCurrentProfile();

          verify(mockRemoteDataSource.getCurrentProfile());
          expect(result, equals(const Right(tCurrentProfile)));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          when(mockRemoteDataSource.getCurrentProfile())
              .thenThrow(NoCurrentProfile());
          final result = await profileRepositoryImpl.getCurrentProfile();
          verify(mockRemoteDataSource.getCurrentProfile());
          expect(result, equals(Left(NoCurrentProfile())));
        },
      );
    });
  });
}
