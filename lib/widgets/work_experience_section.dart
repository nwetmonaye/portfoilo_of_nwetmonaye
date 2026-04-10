import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../constants/style.dart';

class WorkExperienceSection extends StatelessWidget {
  const WorkExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color textPrimary = isDark ? Colors.white : Colors.black87;
    final Color cardColor =
        isDark ? KStyle.cWhiteColor.withOpacity(0.1) : Colors.white;
    final Color lineColor = isDark ? Colors.grey[700]! : Colors.grey[300]!;

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 768;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 18 : 40,
            vertical: isMobile ? 30 : 40,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WORK ',
                    style: KStyle.titleTextStyle.copyWith(
                      color: textPrimary,
                      fontSize: isMobile ? 28 : 48,
                    ),
                  ),
                  Text(
                    'EXPERIENCE',
                    style: KStyle.titleTextStyle.copyWith(
                      color: KStyle.cPinkOrgColor,
                      fontSize: isMobile ? 28 : 48,
                    ),
                  ),
                ],
              ),

              SizedBox(height: isMobile ? 32 : 80),

              if (isMobile)
                Column(
                  children: List.generate(
                    _experiences.length,
                    (index) {
                      final exp = _experiences[index];
                      final bool highlighted = index == 0;
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: index == _experiences.length - 1 ? 0 : 18,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 14,
                                  height: 14,
                                  decoration: BoxDecoration(
                                    color: highlighted
                                        ? KStyle.cPinkOrgColor
                                        : Colors.grey[700],
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                if (index != _experiences.length - 1)
                                  Container(
                                    width: 2,
                                    height: 80,
                                    color: Colors.grey[700],
                                  ),
                              ],
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: _buildExperienceCard(
                                exp['title']!,
                                exp['company']!,
                                exp['dates']!,
                                isHighlighted: highlighted,
                                cardColor: cardColor,
                                textPrimary: textPrimary,
                                isMobile: true,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              else
                Column(
                  children: [
                    _buildDesktopTile(
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildExperienceCard(
                              'MOBILE APPLICATION DEVELOPER',
                              'BIM GROUPS OF COMPANY',
                              'March 2024 - Present',
                              isHighlighted: true,
                              cardColor: cardColor,
                              textPrimary: textPrimary,
                            ),
                          ),
                          Container(
                            height: 2,
                            width: 40,
                            color: lineColor,
                          ),
                        ],
                      ),
                      isFirst: true,
                      highlight: true,
                      startChild: true,
                      lineColor: lineColor,
                    ),
                    _buildDesktopTile(
                      child: Row(
                        children: [
                          Container(
                            height: 2,
                            width: 40,
                            color: lineColor,
                          ),
                          Expanded(
                            child: _buildExperienceCard(
                              'JUNIOR FULL STACK DEVELOPER',
                              'MYANMAR INFORMATION TECHNOLOGY',
                              'November 2022 - February 2024',
                              isHighlighted: false,
                              cardColor: cardColor,
                              textPrimary: textPrimary,
                            ),
                          ),
                        ],
                      ),
                      startChild: false,
                      lineColor: lineColor,
                    ),
                    _buildDesktopTile(
                      child: Row(
                        children: [
                          Expanded(
                            child: _buildExperienceCard(
                              'NOC & OPERATION ENGINEER',
                              'MAHAR NET ISP COMPANY LIMITED',
                              'August 2021 - October 2022',
                              isHighlighted: false,
                              cardColor: cardColor,
                              textPrimary: textPrimary,
                            ),
                          ),
                          Container(
                            height: 2,
                            width: 40,
                            color: lineColor,
                          ),
                        ],
                      ),
                      startChild: true,
                      lineColor: lineColor,
                    ),
                    _buildDesktopTile(
                      child: Row(
                        children: [
                          Container(
                            height: 2,
                            width: 40,
                            color: lineColor,
                          ),
                          Expanded(
                            child: _buildExperienceCard(
                              'INTERNSHIP',
                              'TRUST CORE ICT COMPANY LIMITED',
                              'April 2020 - July 2020',
                              isHighlighted: false,
                              cardColor: cardColor,
                              textPrimary: textPrimary,
                            ),
                          ),
                        ],
                      ),
                      startChild: false,
                      isLast: true,
                      lineColor: lineColor,
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildExperienceCard(
    String jobTitle,
    String company,
    String dates, {
    required bool isHighlighted,
    required Color cardColor,
    required Color textPrimary,
    bool isMobile = false,
  }) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 18 : 25),
      decoration: BoxDecoration(
        color: isHighlighted ? KStyle.cPinkOrgColor : cardColor,
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
          Text(
            jobTitle,
            style: KStyle.paraTitleTextStyle.copyWith(
              color: Colors.white,
              fontSize: isMobile ? 16 : 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            company,
            style: KStyle.paragraphTextStyle.copyWith(
              color: isHighlighted ? Colors.white : textPrimary,
              fontSize: isMobile ? 15 : 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            dates,
            style: KStyle.paragraphTextStyle.copyWith(
              color: isHighlighted ? Colors.white : Colors.grey[400],
              fontSize: isMobile ? 13 : 14,
            ),
          ),
        ],
      ),
    );
  }

  TimelineTile _buildDesktopTile({
    required Widget child,
    required Color lineColor,
    bool isFirst = false,
    bool isLast = false,
    bool highlight = false,
    required bool startChild,
  }) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.5,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        width: 20,
        height: 20,
        indicator: Container(
          decoration: BoxDecoration(
            color: highlight ? KStyle.cPinkOrgColor : Colors.grey[800],
            shape: BoxShape.circle,
            border: highlight
                ? null
                : Border.all(color: Colors.grey[600]!, width: 1),
            boxShadow: highlight
                ? [
                    BoxShadow(
                      color: KStyle.cPinkOrgColor.withOpacity(0.6),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ]
                : null,
          ),
        ),
      ),
      beforeLineStyle: LineStyle(
        color: lineColor,
        thickness: 3,
      ),
      afterLineStyle: LineStyle(
        color: lineColor,
        thickness: 3,
      ),
      startChild: startChild ? child : const SizedBox.shrink(),
      endChild: startChild ? const SizedBox.shrink() : child,
    );
  }

  static const List<Map<String, String>> _experiences = [
    {
      'title': 'MOBILE APPLICATION DEVELOPER',
      'company': 'BIM GROUPS OF COMPANY',
      'dates': 'March 2024 - Present',
    },
    {
      'title': 'JUNIOR FULL STACK DEVELOPER',
      'company': 'MYANMAR INFORMATION TECHNOLOGY',
      'dates': 'November 2022 - February 2024',
    },
    {
      'title': 'NOC & OPERATION ENGINEER',
      'company': 'MAHAR NET ISP COMPANY LIMITED',
      'dates': 'August 2021 - October 2022',
    },
    {
      'title': 'INTERNSHIP',
      'company': 'TRUST CORE ICT COMPANY LIMITED',
      'dates': 'April 2020 - July 2020',
    },
  ];
}
