// WHY: part of app_bottom_nav_bar.dart — private widget used only by that file.

part of 'app_bottom_nav_bar.dart';

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.accent : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            Icon(icon, size: 22, color: isSelected ? AppColors.cardDark : AppColors.textOnPrimary),
            if (isSelected) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.cardDark,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
