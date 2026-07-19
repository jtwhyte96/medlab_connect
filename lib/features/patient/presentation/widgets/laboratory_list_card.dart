import 'package:flutter/material.dart';
import 'package:medlab_connect/core/theme/theme.dart';
import 'service_tag.dart';

/// Interactive, responsive card representing a laboratory search result.
///
/// Faithfully reproduces the visual details from the Stitch mockup:
/// - Left accent stripe (primary color) for open labs.
/// - Top right interactive heart toggle button.
/// - Laboratory logo placeholder (blue/grey avatar or building icon).
/// - Verified / ISO Certification badge overlay.
/// - Star rating, distance away.
/// - List of [ServiceTag]s.
/// - Row of buttons ("View Details" and "Book Test").
/// - Disabled style support for closed labs (e.g., greyed out buttons, "Closed" label, red text).
class LaboratoryListCard extends StatefulWidget {
  const LaboratoryListCard({
    super.key,
    required this.name,
    required this.rating,
    required this.distance,
    this.logoIcon,
    this.logoColor,
    this.certificationText,
    this.isOpen = true,
    required this.services,
    this.onViewDetails,
    this.onBookTest,
  });

  final String name;
  final double rating;
  final String distance;
  final IconData? logoIcon;
  final Color? logoColor;
  final String? certificationText;
  final bool isOpen;
  final List<String> services;
  final VoidCallback? onViewDetails;
  final VoidCallback? onBookTest;

  @override
  State<LaboratoryListCard> createState() => _LaboratoryListCardState();
}

class _LaboratoryListCardState extends State<LaboratoryListCard> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final opacity = widget.isOpen ? 1.0 : 0.6;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.circularBase,
        side: BorderSide(color: AppColors.border),
      ),
      color: AppColors.surface,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: Opacity(
        opacity: opacity,
        child: Stack(
          children: [
            // ── Left Accent Stripe ─────────────────────────────────────────────
            if (widget.isOpen)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                width: 4,
                child: Container(
                  color: AppColors.primary,
                ),
              ),

            // ── Heart Favorite Icon ──────────────────────────────────────────
            Positioned(
              top: AppSpacing.sm,
              right: AppSpacing.sm,
              child: IconButton(
                icon: Icon(
                  _isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                  color: _isFavorite ? Colors.red : AppColors.grey600,
                ),
                onPressed: widget.isOpen
                    ? () => setState(() => _isFavorite = !_isFavorite)
                    : null,
                tooltip: 'Favorite',
              ),
            ),

            // ── Main Content Area ──────────────────────────────────────────────
            Padding(
              padding: EdgeInsets.fromLTRB(
                widget.isOpen ? AppSpacing.base + 4 : AppSpacing.base,
                AppSpacing.base,
                AppSpacing.base,
                AppSpacing.base,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ── Top Row: Logo + Lab Info ───────────────────────────────
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Logo Box Placeholder
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: widget.logoColor ?? const Color(0xFFD2E5F5),
                          borderRadius: AppRadius.circularMd,
                        ),
                        child: widget.logoIcon != null
                            ? Icon(
                                widget.logoIcon,
                                color: AppColors.textSecondary,
                                size: 28,
                              )
                            : null,
                      ),
                      const SizedBox(width: AppSpacing.md),
                      // Details Column
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 48.0), // heart safety
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Name Row
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.name,
                                    style: AppTypography.titleMedium.copyWith(
                                      color: AppColors.textPrimary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  if (!widget.isOpen) ...[
                                    const SizedBox(width: AppSpacing.xs),
                                    Text(
                                      '(Closed)',
                                      style: AppTypography.labelLarge.copyWith(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                              const SizedBox(height: 4),
                              
                              // ISO Certificate Row
                              if (widget.certificationText != null) ...[
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFD0E6F3),
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(
                                      color: const Color(0xFF006684).withValues(alpha: 0.3),
                                    ),
                                  ),
                                  child: Text(
                                    widget.certificationText!.toUpperCase(),
                                    style: AppTypography.labelSmall.copyWith(
                                      fontSize: 9,
                                      color: const Color(0xFF004D64),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                              ],

                              // Rating + Distance Row
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star_rounded,
                                    size: 16,
                                    color: Colors.amber,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    widget.rating.toString(),
                                    style: AppTypography.labelLarge.copyWith(
                                      color: AppColors.textPrimary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: AppSpacing.md),
                                  Text(
                                    '${widget.distance} away',
                                    style: AppTypography.bodyMedium.copyWith(
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),

                  // ── Services Section ────────────────────────────────────────
                  Wrap(
                    spacing: AppSpacing.xs,
                    runSpacing: AppSpacing.xs,
                    children: widget.services
                        .map((service) => ServiceTag(label: service))
                        .toList(),
                  ),
                  const SizedBox(height: AppSpacing.md),

                  // ── Action Buttons ──────────────────────────────────────────
                  Row(
                    children: [
                      // View Details
                      Expanded(
                        child: FilledButton(
                          onPressed: widget.isOpen ? widget.onViewDetails : null,
                          style: FilledButton.styleFrom(
                            backgroundColor: widget.isOpen
                                ? AppColors.primary
                                : AppColors.grey300,
                            disabledBackgroundColor: AppColors.grey200,
                            minimumSize: const Size.fromHeight(40),
                            shape: RoundedRectangleBorder(
                              borderRadius: AppRadius.circularFull,
                            ),
                          ),
                          child: Text(
                            'View Details',
                            style: AppTypography.labelLarge.copyWith(
                              color: widget.isOpen
                                  ? AppColors.textOnPrimary
                                  : AppColors.textDisabled,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      // Book Test
                      Expanded(
                        child: OutlinedButton(
                          onPressed: widget.isOpen ? widget.onBookTest : null,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: widget.isOpen
                                ? AppColors.primary
                                : AppColors.textDisabled,
                            disabledForegroundColor: AppColors.textDisabled,
                            side: BorderSide(
                              color: widget.isOpen
                                  ? AppColors.primary
                                  : AppColors.border,
                            ),
                            minimumSize: const Size.fromHeight(40),
                            shape: RoundedRectangleBorder(
                              borderRadius: AppRadius.circularFull,
                            ),
                          ),
                          child: Text(
                            widget.isOpen ? 'Book Test' : 'Closed',
                            style: AppTypography.labelLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
