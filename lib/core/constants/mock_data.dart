class TeamModel {
  final String name;
  final int members;
  final int sessions;

  const TeamModel({
    required this.name,
    required this.members,
    required this.sessions,
  });
}

class SessionModel {
  final String title;
  final DateTime dateTime;
  final DateTime endTime;

  const SessionModel({
    required this.title,
    required this.dateTime,
    required this.endTime,
  });

  String get dayOfWeek {
    final days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    return days[dateTime.weekday - 1];
  }

  String get formattedTime {
    final startHour = dateTime.hour;
    final startMinute = dateTime.minute;
    final endHour = endTime.hour;
    final endMinute = endTime.minute;
    
    final formatTime = (int hour, int minute) {
      final period = hour >= 12 ? 'pm' : 'am';
      final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
      return '$displayHour:${minute.toString().padLeft(2, '0')}$period';
    };
    
    return '${formatTime(startHour, startMinute)} - ${formatTime(endHour, endMinute)}';
  }

  String get displayBadge => '$dayOfWeek: $formattedTime';
}

class NotificationItem {
  final String title;
  final String subtitle;

  const NotificationItem({required this.title, required this.subtitle});
}

class MockData {
  static const List<TeamModel> teams = [
    TeamModel(name: 'Morning Movers', members: 8, sessions: 4),
    TeamModel(name: 'Focus Circle', members: 5, sessions: 2),
    TeamModel(name: 'Weekend Warriors', members: 12, sessions: 6),
  ];

  static final List<SessionModel> upcomingSessions = [
    SessionModel(
      title: 'Hydration Check',
      dateTime: DateTime.now().add(const Duration(days: 0)).copyWith(hour: 17, minute: 30),
      endTime: DateTime.now().add(const Duration(days: 0)).copyWith(hour: 18, minute: 0),
    ),
    SessionModel(
      title: '5-Min Stretch',
      dateTime: DateTime.now().add(const Duration(days: 1)).copyWith(hour: 7, minute: 0),
      endTime: DateTime.now().add(const Duration(days: 1)).copyWith(hour: 7, minute: 5),
    ),
    SessionModel(
      title: 'Night Wind Down',
      dateTime: DateTime.now().add(const Duration(days: 1)).copyWith(hour: 21, minute: 15),
      endTime: DateTime.now().add(const Duration(days: 1)).copyWith(hour: 21, minute: 45),
    ),
  ];

  static const List<NotificationItem> notifications = [
    NotificationItem(
      title: 'Nudge from Alex',
      subtitle: '"Let us hit 10k steps today!"',
    ),
    NotificationItem(
      title: 'Reminder Sent',
      subtitle: 'You nudged Morning Movers.',
    ),
    NotificationItem(
      title: 'New Team Invite',
      subtitle: 'You were invited to Focus Circle.',
    ),
  ];
}
