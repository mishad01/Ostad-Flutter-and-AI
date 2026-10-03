import 'package:firebase_project/part%205/service/notification_service.dart';
import 'package:flutter/material.dart';

class NotificationLabScreen extends StatelessWidget {
  const NotificationLabScreen({super.key});

  static const int reminderId = 10;

  void _message(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notification Lab',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [colorScheme.primary, colorScheme.primaryContainer],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.notifications_active_rounded,
                      size: 42,
                      color: colorScheme.onPrimary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Notification Center',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Test, schedule, and manage your notifications.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onPrimary.withValues(alpha: 0.85),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              Text(
                'Send Notification',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              // Hello notification
              _NotificationCard(
                icon: Icons.waving_hand_rounded,
                iconColor: Colors.orange,
                title: 'Say Hello',
                subtitle: 'Send a simple notification right now',
                buttonText: 'Send Now',
                onPressed: () => NotificationService.showNow(
                  id: 1,
                  title: 'Hello!',
                  body: 'Tap me to open a screen',
                  payload: 'hello',
                ),
              ),

              const SizedBox(height: 12),

              // Water notification
              _NotificationCard(
                icon: Icons.water_drop_rounded,
                iconColor: Colors.blue,
                title: 'Drink Water',
                subtitle: 'Send a hydration reminder',
                buttonText: 'Send Now',
                onPressed: () => NotificationService.showNow(
                  id: 2,
                  title: 'Time to drink water',
                  body: 'Tap me to open a screen',
                  payload: 'water',
                ),
              ),

              const SizedBox(height: 28),

              Text(
                'Reminder',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              // Schedule reminder
              _NotificationCard(
                icon: Icons.schedule_rounded,
                iconColor: Colors.deepPurple,
                title: 'Schedule Reminder',
                subtitle: 'Send a notification after 10 seconds',
                buttonText: 'Schedule',
                onPressed: () {
                  NotificationService.scheduleIn(
                    id: reminderId,
                    title: 'Reminder',
                    body: 'Ten seconds have passed',
                    payload: 'reminder',
                    delay: const Duration(seconds: 10),
                  );

                  _message('Reminder scheduled in 10 seconds', context);
                },
              ),

              const SizedBox(height: 28),

              Text(
                'Manage Notifications',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: _ActionButton(
                      icon: Icons.notifications_off_rounded,
                      label: 'Cancel Reminder',
                      color: Colors.orange,
                      onPressed: () {
                        NotificationService.cancel(reminderId);
                        _message('Reminder cancelled', context);
                      },
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _ActionButton(
                      icon: Icons.clear_all_rounded,
                      label: 'Cancel All',
                      color: Colors.red,
                      onPressed: () {
                        NotificationService.cancelAll();
                        _message('All notifications cancelled', context);
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Notification Card
// -----------------------------------------------------------------------------

class _NotificationCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onPressed;

  const _NotificationCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: colorScheme.outlineVariant),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: iconColor, size: 26),
          ),

          const SizedBox(width: 16),

          // Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Button
          FilledButton(
            onPressed: onPressed,
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Small Action Button
// -----------------------------------------------------------------------------

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: color),
      label: Text(label, textAlign: TextAlign.center),
      style: OutlinedButton.styleFrom(
        foregroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        side: BorderSide(color: color.withValues(alpha: 0.35)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
