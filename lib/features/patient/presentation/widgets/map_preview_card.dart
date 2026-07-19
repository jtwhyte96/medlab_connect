import 'package:flutter/material.dart';
import 'package:medlab_connect/core/theme/theme.dart';

/// A modern, illustrated interactive-looking map preview card.
///
/// Replaces the placeholder card with an custom painted map illustration:
/// - Light grey/blue terrain background with intersecting streets, water bodies, and parks.
/// - Centered pulsing location pin and scattered floating laboratory markers.
/// - Dark gradient bottom-overlay to protect readability of text labels.
/// - Action overlays:
///   - Top Left: Nearby Laboratories badge.
///   - Bottom Left: Instruction label.
///   - Bottom Right: M3 Open Map button with map icon.
class MapPreviewCard extends StatelessWidget {
  const MapPreviewCard({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xFFF1F3F4), // Base map background (light grey)
        borderRadius: AppRadius.circularBase,
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: AppRadius.circularBase,
        child: InkWell(
          onTap: onTap,
          child: Stack(
            children: [
              // ── 1. Map Illustration Background ─────────────────────────────
              const Positioned.fill(
                child: CustomPaint(
                  painter: _MapIllustrationPainter(),
                ),
              ),

              // ── 2. Floating Lab Markers (Scattered Pins) ───────────────────
              Positioned(
                left: 60,
                top: 40,
                child: _buildMiniLabMarker(AppColors.secondary),
              ),
              Positioned(
                right: 80,
                top: 50,
                child: _buildMiniLabMarker(AppColors.secondary),
              ),
              Positioned(
                right: 120,
                bottom: 80,
                child: _buildMiniLabMarker(AppColors.secondary),
              ),

              // ── 3. Centered Location Pin with Pulse ────────────────────────
              Align(
                alignment: const Alignment(0, -0.1),
                child: _buildCenteredUserMarker(),
              ),

              // ── 4. Bottom Readability Gradient Overlay ─────────────────────
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: 100,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.65),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),

              // ── 5. Overlay: Top Left Badge ─────────────────────────────────
              Positioned(
                top: AppSpacing.sm,
                left: AppSpacing.sm,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: AppRadius.circularFull,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: AppColors.error,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Nearby Laboratories',
                        style: AppTypography.labelSmall.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ── 6. Overlay: Bottom Left Text ───────────────────────────────
              Positioned(
                left: AppSpacing.base,
                bottom: AppSpacing.base,
                right: 160, // Ensure no overlap with the button
                child: Text(
                  'Find accredited laboratories around you',
                  style: AppTypography.titleSmall.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // ── 7. Overlay: Bottom Right Button ──────────────────────────────
              Positioned(
                right: AppSpacing.base,
                bottom: AppSpacing.base,
                child: FilledButton.icon(
                  onPressed: onTap,
                  icon: const Icon(
                    Icons.map_outlined,
                    size: 18,
                  ),
                  label: Text(
                    'Open Map',
                    style: AppTypography.labelLarge.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.textOnPrimary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.base,
                      vertical: AppSpacing.sm,
                    ),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    elevation: 4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Helper builders ────────────────────────────────────────────────────────

  Widget _buildMiniLabMarker(Color color) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Icon(
        Icons.science_rounded,
        color: color,
        size: 12,
      ),
    );
  }

  Widget _buildCenteredUserMarker() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Pulse ring
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary.withValues(alpha: 0.25),
          ),
        ),
        // Pulse core ring
        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary.withValues(alpha: 0.4),
          ),
        ),
        // Pin icon
        Icon(
          Icons.my_location_rounded,
          color: AppColors.primary,
          size: 20,
        ),
      ],
    );
  }
}

// ── Vector Map Illustration Painter ──────────────────────────────────────────

class _MapIllustrationPainter extends CustomPainter {
  const _MapIllustrationPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Draw some green zone blocks (parks/terrain)
    paint.color = const Color(0xFFE8F5E9); // Soft light green
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(-20, 20, size.width * 0.35, 60),
        const Radius.circular(12),
      ),
      paint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.55, -10, size.width * 0.5, 70),
        const Radius.circular(12),
      ),
      paint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.15, size.height * 0.65, size.width * 0.4, 60),
        const Radius.circular(12),
      ),
      paint,
    );

    // Draw some water zones (lakes/rivers)
    paint.color = const Color(0xFFE3F2FD); // Soft light blue
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.7, size.height * 0.45, size.width * 0.4, 50),
        const Radius.circular(12),
      ),
      paint,
    );

    // Draw roads (lines)
    final roadPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Horizontal main avenues
    roadPaint.strokeWidth = 10;
    canvas.drawLine(
      Offset(-10, size.height * 0.35),
      Offset(size.width + 10, size.height * 0.35),
      roadPaint,
    );
    roadPaint.strokeWidth = 7;
    canvas.drawLine(
      Offset(-10, size.height * 0.7),
      Offset(size.width + 10, size.height * 0.7),
      roadPaint,
    );

    // Vertical streets
    roadPaint.strokeWidth = 10;
    canvas.drawLine(
      Offset(size.width * 0.35, -10),
      Offset(size.width * 0.35, size.height + 10),
      roadPaint,
    );
    roadPaint.strokeWidth = 6;
    canvas.drawLine(
      Offset(size.width * 0.75, -10),
      Offset(size.width * 0.75, size.height + 10),
      roadPaint,
    );
    
    // Slanted street linking main avenues
    roadPaint.strokeWidth = 5;
    canvas.drawLine(
      Offset(size.width * 0.35, size.height * 0.35),
      Offset(size.width * 0.75, size.height * 0.7),
      roadPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
