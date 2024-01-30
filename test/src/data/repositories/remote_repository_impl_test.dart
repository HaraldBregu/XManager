import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/platform/network_info.dart';
import 'package:xmanager/src/data/datasources/remote/remote_datasource.dart';
import 'package:xmanager/src/data/models/dinamo_model.dart';
import 'package:xmanager/src/data/models/profile_model.dart';
import 'package:xmanager/src/data/repository/profile_repository_impl.dart';

import 'remote_repository_impl_test.mocks.dart';

@GenerateMocks([RemoteDataSource])
@GenerateMocks([NetworkInfo])
void main() {
  late ProfileRepositoryImpl profileRepository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    profileRepository = ProfileRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
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
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        profileRepository.getCurrentProfile();
        verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          when(mockRemoteDataSource.getCurrentProfile())
              .thenAnswer((_) async => tCurrentProfile);

          final result = await profileRepository.getCurrentProfile();

          verify(mockRemoteDataSource.getCurrentProfile());
          expect(result, equals(const Right(tCurrentProfile)));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          when(mockRemoteDataSource.getCurrentProfile())
              .thenThrow(NoCurrentProfile());
          final result = await profileRepository.getCurrentProfile();
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

          final result = await profileRepository.getCurrentProfile();

          verify(mockRemoteDataSource.getCurrentProfile());
          expect(result, equals(const Right(tCurrentProfile)));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          when(mockRemoteDataSource.getCurrentProfile())
              .thenThrow(NoCurrentProfile());
          final result = await profileRepository.getCurrentProfile();
          verify(mockRemoteDataSource.getCurrentProfile());
          expect(result, equals(Left(NoCurrentProfile())));
        },
      );
    });
  });
}
