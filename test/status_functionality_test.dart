import 'package:flutter_test/flutter_test.dart';
import 'package:timirama/services/status/model/status_model.dart';
import 'package:timirama/services/status/bloc/status_state.dart';

void main() {
  group('Status Functionality Tests', () {
    group('StatusModel Tests', () {
      test('should create StatusModel correctly', () {
        // Arrange & Act
        final status = StatusModel(state: true, lastChanged: 1234567890);

        // Assert
        expect(status.state, true);
        expect(status.lastChanged, 1234567890);
      });

      test('should convert StatusModel to/from Map correctly', () {
        // Arrange
        final originalStatus = StatusModel(state: true, lastChanged: 1234567890);
        
        // Act
        final map = originalStatus.toMap();
        final recreatedStatus = StatusModel.fromMap(map);

        // Assert
        expect(recreatedStatus.state, originalStatus.state);
        expect(recreatedStatus.lastChanged, originalStatus.lastChanged);
      });

      test('should handle empty StatusModel correctly', () {
        // Act
        final emptyStatus = StatusModel.empty;

        // Assert
        expect(emptyStatus.state, false);
        expect(emptyStatus.lastChanged, 0);
      });

      test('should compare StatusModel instances correctly', () {
        // Arrange
        final status1 = StatusModel(state: true, lastChanged: 1234567890);
        final status2 = StatusModel(state: true, lastChanged: 1234567890);
        final status3 = StatusModel(state: false, lastChanged: 1234567890);

        // Assert
        expect(status1 == status2, true);
        expect(status1 == status3, false);
        expect(status1.hashCode == status2.hashCode, true);
      });

      test('should convert StatusModel to JSON correctly', () {
        // Arrange
        final status = StatusModel(state: true, lastChanged: 1234567890);
        
        // Act
        final json = status.toJson();
        final recreatedStatus = StatusModel.fromJson(json);

        // Assert
        expect(recreatedStatus.state, status.state);
        expect(recreatedStatus.lastChanged, status.lastChanged);
      });
    });

    group('StatusState Tests', () {
      test('should get status for user correctly', () {
        // Arrange
        final user1Status = StatusModel(state: true, lastChanged: 1234567890);
        final user2Status = StatusModel(state: false, lastChanged: 1234567891);
        final userStatuses = {
          'user1': user1Status,
          'user2': user2Status,
        };
        
        final state = StatusState(
          status: user1Status,
          userStatuses: userStatuses,
          currentUserId: 'user1',
        );

        // Act & Assert
        expect(state.getStatusForUser('user1')?.state, true);
        expect(state.getStatusForUser('user2')?.state, false);
        expect(state.getStatusForUser('user3'), null);
      });

      test('should copy state correctly', () {
        // Arrange
        final originalStatus = StatusModel(state: true, lastChanged: 1234567890);
        final newStatus = StatusModel(state: false, lastChanged: 1234567891);
        final originalState = StatusState(
          status: originalStatus,
          currentUserId: 'user1',
        );

        // Act
        final newState = originalState.copyWith(
          status: newStatus,
          currentUserId: 'user2',
        );

        // Assert
        expect(newState.status.state, false);
        expect(newState.currentUserId, 'user2');
        expect(originalState.status.state, true); // Original unchanged
        expect(originalState.currentUserId, 'user1'); // Original unchanged
      });

      test('should handle initial state correctly', () {
        // Act
        final initialState = StatusState.initial();

        // Assert
        expect(initialState.status.state, false);
        expect(initialState.status.lastChanged, 0);
        expect(initialState.userStatuses.isEmpty, true);
        expect(initialState.currentUserId, null);
      });

      test('should maintain userStatuses when copying', () {
        // Arrange
        final userStatuses = {
          'user1': StatusModel(state: true, lastChanged: 1234567890),
          'user2': StatusModel(state: false, lastChanged: 1234567891),
        };
        final originalState = StatusState(
          status: StatusModel.empty,
          userStatuses: userStatuses,
        );

        // Act
        final newState = originalState.copyWith(
          currentUserId: 'user1',
        );

        // Assert
        expect(newState.userStatuses.length, 2);
        expect(newState.userStatuses['user1']?.state, true);
        expect(newState.userStatuses['user2']?.state, false);
        expect(newState.currentUserId, 'user1');
      });
    });

    group('Integration Tests', () {
      test('should handle multiple user status updates', () {
        // Arrange
        final initialState = StatusState.initial();
        final user1Status = StatusModel(state: true, lastChanged: 1234567890);
        final user2Status = StatusModel(state: false, lastChanged: 1234567891);

        // Act - Simulate adding user1 status
        final state1 = initialState.copyWith(
          status: user1Status,
          userStatuses: {'user1': user1Status},
          currentUserId: 'user1',
        );

        // Act - Simulate adding user2 status
        final updatedUserStatuses = Map<String, StatusModel>.from(state1.userStatuses);
        updatedUserStatuses['user2'] = user2Status;
        
        final state2 = state1.copyWith(
          status: user2Status,
          userStatuses: updatedUserStatuses,
          currentUserId: 'user2',
        );

        // Assert
        expect(state2.userStatuses.length, 2);
        expect(state2.getStatusForUser('user1')?.state, true);
        expect(state2.getStatusForUser('user2')?.state, false);
        expect(state2.currentUserId, 'user2');
      });

      test('should handle status updates for existing users', () {
        // Arrange
        final initialUserStatuses = {
          'user1': StatusModel(state: false, lastChanged: 1234567890),
        };
        final initialState = StatusState(
          status: StatusModel.empty,
          userStatuses: initialUserStatuses,
        );

        // Act - Update user1 status to online
        final updatedStatus = StatusModel(state: true, lastChanged: 1234567891);
        final updatedUserStatuses = Map<String, StatusModel>.from(initialState.userStatuses);
        updatedUserStatuses['user1'] = updatedStatus;

        final updatedState = initialState.copyWith(
          status: updatedStatus,
          userStatuses: updatedUserStatuses,
          currentUserId: 'user1',
        );

        // Assert
        expect(updatedState.getStatusForUser('user1')?.state, true);
        expect(updatedState.getStatusForUser('user1')?.lastChanged, 1234567891);
      });
    });
  });
}