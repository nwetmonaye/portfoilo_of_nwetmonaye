import 'package:flutter/material.dart';
import '../constants/style.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

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
                'MY ',
                style: KStyle.titleTextStyle.copyWith(
                  color: Colors.white,
                  fontSize: 48,
                ),
              ),
              Text(
                'PORTFOLIO',
                style: KStyle.titleTextStyle.copyWith(
                  color: KStyle.cPinkOrgColor,
                  fontSize: 48,
                ),
              ),
            ],
          ),

          const SizedBox(height: 80),

          // Portfolio Grid
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 40,
            mainAxisSpacing: 40,
            childAspectRatio: 1.2,
            children: [
              _buildPortfolioCard(
                context,
                'Tun Commercial Bank',
                'assets/images/tunbank.png',
                'The mobile banking app provides a variety of convenient functionalitiees. These include the opotion to transfer funds between your own accounts, send money to other accounts, add funds to your account, access detailed account information, and review your account transactions.',
                isHighlighted: false,
              ),
              _buildPortfolioCard(
                context,
                'YadanarBon Bank',
                'assets/images/yadanarbon.png',
                'The mobile banking app provides a variety of convenient functionalitiees. These include the opotion to transfer funds between your own accounts, send money to other accounts, add funds to your account, access detailed account information, and review your account transactions.',
                isHighlighted: false,
              ),
              _buildPortfolioCard(
                context,
                'SEDONA',
                'assets/images/sedona.png',
                'In Sedona Hotel Yangon Loyalty Program, where your loyalty is rewarded with exclusive benefits and personalized services. As a member, you will enjoy a host of privileges designed to enhance your stay with us, including: Special room rates and upgrades, Early check-in and late check-out, Access to members-only promotions and events and Complimentary services',
                isHighlighted: false,
              ),
              _buildPortfolioCard(
                context,
                'VITELLE',
                'assets/images/vitelle.png',
                'Vitelle empowers women to take control of their well-being through personalized health plans, crafted to meet the unique needs of the female body at every stage of life. Combining sports science, biometrics, and expert insights, Vitelle helps you uncover your body\'s specific requirements and equips you with the tools to address them effectively.',
                isHighlighted: false,
              ),
              _buildPortfolioCard(
                context,
                'UNDP',
                'assets/images/eLearning.png',
                'This eLearning Portal is a training platform created by UNDP Myanmar in collaboration with experts and supporters, with a focus on enhancing the capacity development of Micro, Small, and Medium Enterprises (MSMEs) in Myanmar.',
                isHighlighted: false,
              ),
              _buildPortfolioCard(
                context,
                'Form',
                'assets/images/formflow.png',
                'FormFlow is designed for organizations, educators, and businesses that need a robust solution for form creation, data collection, and workflow management across multiple platforms.',
                isHighlighted: false,
              ),
              _buildPortfolioCard(
                context,
                'SEAD',
                'assets/images/sead.png',
                "The app aims to modernize Myanmar's agricultural sector by providing digital tools for better decision-making, market access, and knowledge sharing within the farming community.Comming soon!",
                isHighlighted: true,
              ),
            ],
          ),

          const SizedBox(height: 60),

          // View More Button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            decoration: BoxDecoration(
              color: KStyle.c25BlackColor,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.grey[700]!, width: 1),
            ),
            child: Text(
              'VIEW MORE',
              style: KStyle.paraTitleTextStyle.copyWith(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPortfolioCard(
    BuildContext context,
    String title,
    String imagePath,
    String description, {
    required bool isHighlighted,
  }) {
    return GestureDetector(
      onTap: () => _showPortfolioDetail(context, title, imagePath, description),
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
            // Portfolio Image Section (Top 60%)
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
                    // Gradient overlay for better text readability
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

            // Portfolio Content Section (Bottom 40%)
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      title,
                      style: KStyle.paraTitleTextStyle.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Description
                    Expanded(
                      child: Text(
                        description,
                        style: KStyle.paragraphTextStyle.copyWith(
                          color: Colors.grey[400],
                          fontSize: 14,
                          height: 1.4,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    // Click indicator
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
                          AnimatedRotation(
                            duration: const Duration(milliseconds: 200),
                            turns: 0,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: KStyle.cPinkOrgColor,
                              size: 10,
                            ),
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
    String description,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
              color: KStyle.c26BlackColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: KStyle.cPinkOrgColor, width: 2),
            ),
            child: Column(
              children: [
                // Header with close button
                Container(
                  padding: const EdgeInsets.all(20),
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
                            fontSize: 24,
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
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image
                        Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(imagePath),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // Description
                        Text(
                          'Project Description',
                          style: KStyle.paraTitleTextStyle.copyWith(
                            color: KStyle.cPinkOrgColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Text(
                          description,
                          style: KStyle.paragraphTextStyle.copyWith(
                            color: Colors.grey[300],
                            fontSize: 16,
                            height: 1.6,
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
      },
    );
  }
}
