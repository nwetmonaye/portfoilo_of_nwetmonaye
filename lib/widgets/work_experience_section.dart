import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../constants/style.dart';

class WorkExperienceSection extends StatelessWidget {
  const WorkExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          // Section Title
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'WORK ',
                style: KStyle.titleTextStyle.copyWith(
                  color: Colors.white,
                  fontSize: 48,
                ),
              ),
              Text(
                'EXPERIENCE',
                style: KStyle.titleTextStyle.copyWith(
                  color: KStyle.cPinkOrgColor,
                  fontSize: 48,
                ),
              ),
            ],
          ),

          const SizedBox(height: 80),

          // Timeline
          Column(
            children: [
              // First Experience - Top Left (Highlighted)
              TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0.5,
                isFirst: true,
                indicatorStyle: IndicatorStyle(
                  width: 20,
                  height: 20,
                  indicator: Container(
                    decoration: BoxDecoration(
                      color: KStyle.cPinkOrgColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                beforeLineStyle: LineStyle(
                  color: Colors.grey[700]!,
                  thickness: 3,
                ),
                afterLineStyle: LineStyle(
                  color: Colors.grey[700]!,
                  thickness: 3,
                ),
                startChild: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildExperienceCard(
                          'MOBILE APPLICATION DEVELOPER',
                          'BIM GROUPS OF COMPANY',
                          'March 2024 - Present',
                          isHighlighted: true,
                        ),
                      ),
                      // Horizontal Divider
                      Container(height: 2, width: 40, color: Colors.grey[700]),
                    ],
                  ),
                ),
                endChild: const SizedBox.shrink(),
              ),

              // Second Experience - Right
              TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0.5,
                indicatorStyle: IndicatorStyle(
                  width: 20,
                  height: 20,
                  indicator: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                beforeLineStyle: LineStyle(
                  color: Colors.grey[700]!,
                  thickness: 3,
                ),
                afterLineStyle: LineStyle(
                  color: Colors.grey[700]!,
                  thickness: 3,
                ),
                startChild: const SizedBox.shrink(),
                endChild: Container(
                  // padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      // Horizontal Divider
                      Container(height: 2, width: 40, color: Colors.grey[700]),
                      Expanded(
                        child: _buildExperienceCard(
                          'JUNIOR FULL STACK DEVELOPER',
                          'MYANMAR INFORMATION TECHNOLOGY',
                          'November 2022 - February 2024',
                          isHighlighted: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Third Experience - Left
              TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0.5,
                indicatorStyle: IndicatorStyle(
                  width: 20,
                  height: 20,
                  indicator: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                beforeLineStyle: LineStyle(
                  color: Colors.grey[700]!,
                  thickness: 3,
                ),
                afterLineStyle: LineStyle(
                  color: Colors.grey[700]!,
                  thickness: 3,
                ),
                startChild: Container(
                  // padding: const EdgeInsets.only(right: 40),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildExperienceCard(
                          'NOC & OPERATION ENGINEER',
                          'MAHAR NET ISP COMPANY LIMITED',
                          'August 2021 - October 2022',
                          isHighlighted: false,
                        ),
                      ),
                      // Horizontal Divider
                      Container(height: 2, width: 40, color: Colors.grey[700]),
                    ],
                  ),
                ),
                endChild: const SizedBox.shrink(),
              ),

              // Fourth Experience - Right
              TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0.5,
                isLast: true,
                indicatorStyle: IndicatorStyle(
                  width: 20,
                  height: 20,
                  indicator: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                beforeLineStyle: LineStyle(
                  color: Colors.grey[700]!,
                  thickness: 3,
                ),
                startChild: const SizedBox.shrink(),
                endChild: Container(
                  // padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: [
                      // Horizontal Divider
                      Container(height: 2, width: 40, color: Colors.grey[700]),
                      Expanded(
                        child: _buildExperienceCard(
                          'INTERNSHIP',
                          'TRUST CORE ICT COMPANY LIMITED',
                          'April 2020 - July 2020',
                          isHighlighted: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(
    String jobTitle,
    String company,
    String dates, {
    required bool isHighlighted,
  }) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: isHighlighted
            ? KStyle.cPinkOrgColor
            : KStyle.cWhiteColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        boxShadow: isHighlighted
            ? [
                BoxShadow(
                  color: KStyle.cPinkOrgColor.withOpacity(0.4),
                  offset: const Offset(0, 10),
                  blurRadius: 25,
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  offset: const Offset(0, 5),
                  blurRadius: 10,
                  spreadRadius: 0,
                ),
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Job Title
          Text(
            jobTitle,
            style: KStyle.paraTitleTextStyle.copyWith(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 10),

          // Company Name
          Text(
            company,
            style: KStyle.paragraphTextStyle.copyWith(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 8),

          // Dates
          Text(
            dates,
            style: KStyle.paragraphTextStyle.copyWith(
              color: isHighlighted ? Colors.white : Colors.grey[400],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
