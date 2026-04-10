import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/style.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 768;
        final bool isTablet = constraints.maxWidth < 1100 && !isMobile;
        final int crossAxisCount = isMobile
            ? 1
            : isTablet
            ? 2
            : 3;

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
                    'MY ',
                    style: KStyle.titleTextStyle.copyWith(
                      color: Colors.white,
                      fontSize: isMobile ? 28 : 48,
                    ),
                  ),
                  Text(
                    'PORTFOLIO',
                    style: KStyle.titleTextStyle.copyWith(
                      color: KStyle.cPinkOrgColor,
                      fontSize: isMobile ? 28 : 48,
                    ),
                  ),
                ],
              ),

              SizedBox(height: isMobile ? 28 : 80),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _projects.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: isMobile ? 16 : 32,
                  mainAxisSpacing: isMobile ? 16 : 32,
                  childAspectRatio: isMobile ? 0.95 : 1.2,
                ),
                itemBuilder: (context, index) {
                  final project = _projects[index];
                  return _buildPortfolioCard(
                    context,
                    project['title']!,
                    project['image']!,
                    project['desc']!,
                    appStoreUrl: project['app'] ?? '',
                    playStoreUrl: project['play'] ?? '',
                    isHighlighted: project['highlight'] == 'true',
                    isMobile: isMobile,
                  );
                },
              ),

              SizedBox(height: isMobile ? 28 : 60),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 26 : 40,
                  vertical: isMobile ? 12 : 15,
                ),
                decoration: BoxDecoration(
                  color: KStyle.c25BlackColor,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey[700]!, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 18,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Text(
                  'VIEW MORE',
                  style: KStyle.paraTitleTextStyle.copyWith(
                    color: Colors.white,
                    fontSize: isMobile ? 14 : 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPortfolioCard(
    BuildContext context,
    String title,
    String imagePath,
    String description, {
    required String appStoreUrl,
    required String playStoreUrl,
    required bool isHighlighted,
    bool isMobile = false,
  }) {
    return GestureDetector(
      onTap: () => _showPortfolioDetail(
        context,
        title,
        imagePath,
        description,
        appStoreUrl: appStoreUrl,
        playStoreUrl: playStoreUrl,
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: KStyle.cWhiteColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: isHighlighted
              ? Border.all(color: KStyle.cPinkOrgColor, width: 2)
              : Border.all(color: Colors.transparent, width: 2),
          boxShadow: isHighlighted
              ? [
                  BoxShadow(
                    color: KStyle.cPinkOrgColor.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.3),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 14 : 20,
                  vertical: isMobile ? 6 : 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: KStyle.paraTitleTextStyle.copyWith(
                        color: Colors.white,
                        fontSize: isMobile ? 16 : 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Text(
                        description,
                        style: KStyle.paragraphTextStyle.copyWith(
                          color: Colors.grey[400],
                          fontSize: isMobile ? 12.5 : 14,
                          height: 1.4,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 12),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: KStyle.cPinkOrgColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: KStyle.cPinkOrgColor.withOpacity(0.3),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: KStyle.cPinkOrgColor.withOpacity(0.1),
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.visibility_outlined,
                            color: KStyle.cPinkOrgColor,
                            size: 14,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'View Details',
                            style: KStyle.paragraphTextStyle.copyWith(
                              color: KStyle.cPinkOrgColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: KStyle.cPinkOrgColor,
                            size: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPortfolioDetail(
    BuildContext context,
    String title,
    String imagePath,
    String description, {
    required String appStoreUrl,
    required String playStoreUrl,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final bool isMobile = MediaQuery.of(context).size.width < 768;
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * (isMobile ? 0.95 : 0.8),
            height:
                MediaQuery.of(context).size.height * (isMobile ? 0.75 : 0.7),
            decoration: BoxDecoration(
              color: KStyle.c26BlackColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: KStyle.cPinkOrgColor, width: 2),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(isMobile ? 14 : 20),
                  decoration: BoxDecoration(
                    color: KStyle.cPinkOrgColor.withOpacity(0.1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: KStyle.paraTitleTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: isMobile ? 18 : 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: KStyle.cPinkOrgColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: isMobile ? 18 : 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(isMobile ? 18 : 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: isMobile ? 180 : 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(imagePath),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: isMobile ? 20 : 30),
                        Text(
                          'Project Description',
                          style: KStyle.paraTitleTextStyle.copyWith(
                            color: KStyle.cPinkOrgColor,
                            fontSize: isMobile ? 18 : 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          description,
                          style: KStyle.paragraphTextStyle.copyWith(
                            color: Colors.grey[300],
                            fontSize: isMobile ? 14 : 16,
                            height: 1.6,
                          ),
                        ),

                        SizedBox(height: isMobile ? 18 : 26),

                        Row(
                          children: [
                            if (appStoreUrl.isNotEmpty)
                              _buildStoreButton(
                                label: 'App Store',
                                icon: Icons.apple,
                                url: appStoreUrl,
                                isMobile: isMobile,
                              ),
                            if (appStoreUrl.isNotEmpty &&
                                playStoreUrl.isNotEmpty)
                              const SizedBox(width: 12),
                            if (playStoreUrl.isNotEmpty)
                              _buildStoreButton(
                                label: 'Play Store',
                                icon: Icons.android_rounded,
                                url: playStoreUrl,
                                isMobile: isMobile,
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStoreButton({
    required String label,
    required IconData icon,
    required String url,
    required bool isMobile,
  }) {
    return GestureDetector(
      onTap: () => _launchStore(url),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 12 : 16,
          vertical: isMobile ? 8 : 10,
        ),
        decoration: BoxDecoration(
          color: KStyle.c25BlackColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: isMobile ? 18 : 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: KStyle.paragraphTextStyle.copyWith(
                color: Colors.white,
                fontSize: isMobile ? 13 : 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchStore(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  static const List<Map<String, String>> _projects = [
    {
      'title': 'Tun Commercial Bank',
      'image': 'assets/images/tunbank.png',
      'desc':
          'Transfer funds, check balances, and review transactions effortlessly through a refined mobile banking journey.',
      'app': 'https://apps.apple.com/vn/app/tcb-mbanking/id6450492816?l=vi',
      'play':
          'https://play.google.com/store/apps/details?id=com.tcb.app001&hl=en',
      'highlight': 'false',
    },
    {
      'title': 'YadanarBon Bank',
      'image': 'assets/images/yadanarbon.png',
      'desc':
          'Mobile banking with streamlined payments, beneficiary management, and clear transaction history.',
      'app': 'https://apps.apple.com/vn/app/ydnb-mbanking/id6608976031?l=vi',
      'play':
          'https://play.google.com/store/apps/details?id=com.ydnb.mbanking&hl=en',
      'highlight': 'false',
    },
    {
      'title': 'SEDONA',
      'image': 'assets/images/sedona.png',
      'desc':
          'Loyalty program with special rates, upgrades, and members-only perks for Sedona Hotel Yangon guests.',
      'app':
          'https://apps.apple.com/vn/app/sedona-yangon-loyalty-program/id6502490113?l=vi',
      'play':
          'https://play.google.com/store/apps/details?id=com.sedona.keyloyalty&hl=en',
      'highlight': 'false',
    },
    {
      'title': 'VITELLE',
      'image': 'assets/images/vitelle.png',
      'desc':
          'Personalized wellness companion blending sports science and biometrics to guide daily health.',
      'app': '',
      'play': '',
      'highlight': 'false',
    },
    {
      'title': 'UNDP',
      'image': 'assets/images/eLearning.png',
      'desc':
          'MSME-focused eLearning portal built with UNDP Myanmar to scale capacity development programs.',
      'app':
          'https://apps.apple.com/vn/app/elearning-portal-for-msmes/id6742404634?l=vi',
      'play':
          'https://play.google.com/store/search?q=elearning+portal+for+msmes&c=apps&hl=en',
      'highlight': 'false',
    },
    {
      'title': 'Form',
      'image': 'assets/images/formflow.png',
      'desc':
          'FormFlow powers creation, data collection, and workflow automation across platforms.',
      'app': 'https://formflow-b0484.web.app/',
      'play': 'https://formflow-b0484.web.app/',
      'highlight': 'false',
    },
    {
      'title': 'Smart Taung Thu',
      'image': 'assets/images/sead.png',
      'desc':
          'Digital tools for Myanmar farmers: better decisions, market access, and knowledge sharing.',
      'app': 'https://apps.apple.com/vn/app/smart-taung-thu/id6744342459?l=vi',
      'play':
          'https://play.google.com/store/apps/details?id=org.undp.mm.sead&hl=en',
      'highlight': 'false',
    },
    {
      'title': 'Gem Map',
      'image': 'assets/images/gemmap.png',
      'desc':
          'Premium marketplace connecting collectors with verified jewelers through immersive product storytelling.',
      'app': '',
      'play': '',
      'highlight': 'true',
    },
  ];
}
