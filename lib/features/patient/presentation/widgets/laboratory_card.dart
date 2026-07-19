import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medlab_connect/core/theme/theme.dart';

/// Reusable Laboratory card representing nearby clinics.
///
/// Features a header cover image with an "Open/Closed" badge, clinic details,
/// distance info, ratings, and GoRouter navigation on click.
class LaboratoryCard extends StatelessWidget {
  const LaboratoryCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.distance,
    required this.rating,
    this.isOpen = true,
    required this.route,
  });

  final String name;
  final String imageUrl;
  final String distance;
  final String rating;
  final bool isOpen;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.circularBase,
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: AppRadius.circularBase,
        child: InkWell(
          onTap: () => context.push(route),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── Header Cover Image + Status Badge ──────────────────────────
              Stack(
                children: [
                  Image.network(
                    imageUrl,
                    height: 96,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 96,
                      color: AppColors.grey200,
                      child: Icon(
                        Icons.image_rounded,
                        color: AppColors.grey400,
                        size: 32,
                      ),
                    ),
                  ),
                  Positioned(
                    top: AppSpacing.sm,
                    left: AppSpacing.sm,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm,
                        vertical: AppSpacing.xs,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.9),
                        borderRadius: AppRadius.circularFull,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.08),
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Text(
                        isOpen ? 'Open' : 'Closed',
                        style: AppTypography.labelSmall.copyWith(
                          fontSize: 10,
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // ── Clinic Details ──────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.all(AppSpacing.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTypography.titleMedium.copyWith(
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSpacing.xs2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_rounded,
                              size: 14,
                              color: AppColors.textSecondary,
                            ),
                            const SizedBox(width: AppSpacing.xs),
                            Text(distance, style: AppTypography.bodySmall),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              size: 14,
                              color: Colors.amber,
                            ),
                            const SizedBox(width: AppSpacing.xs),
                            Text(rating, style: AppTypography.labelSmall),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
