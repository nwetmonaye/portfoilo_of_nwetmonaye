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
                'Tun Commercial Bank',
                'assets/images/tunbank.png',
                'The mobile banking app provides a variety of convenient functionalitiees. These include the opotion to transfer funds between your own accounts, send money to other accounts, add funds to your account, access detailed account information, and review your account transactions.',
                isHighlighted: false,
              ),
              _buildPortfolioCard(
                'YadanarBon Bank',
                'assets/images/yadanarbon.png',
                'The mobile banking app provides a variety of convenient functionalitiees. These include the opotion to transfer funds between your own accounts, send money to other accounts, add funds to your account, access detailed account information, and review your account transactions.',
                isHighlighted: false,
              ),
              _buildPortfolioCard(
                'SEDONA',
                'assets/images/sedona.png',
                'In Sedona Hotel Yangon Loyalty Program, where your loyalty is rewarded with exclusive benefits and personalized services. As a member, you will enjoy a host of privileges designed to enhance your stay with us, including: Special room rates and upgrades, Early check-in and late check-out, Access to members-only promotions and events and Complimentary services',
                isHighlighted: false,
              ),
              _buildPortfolioCard(
                'VITELLE',
                'assets/images/vitelle.png',
                'Lorem ipsum dolor sit amet consectetur. Magna vitae convallis ligula convallis felis faucibus augue interdum. At congue pulvinar varius duis odio ultrices.',
                isHighlighted: false,
              ),
              _buildPortfolioCard(
                'UNDP',
                'assets/images/eLearning.png',
                'Lorem ipsum dolor sit amet consectetur. Fames odio ante sagittis suspendisse venenatis. Accumsan pharetra sagittis tincidunt sit varius.',
                isHighlighted: false,
              ),
              _buildPortfolioCard(
                'Form',
                'assets/images/formflow.png',
                'Lorem ipsum dolor sit amet consectetur. Feugiat amet faucibus senectus at. Enim pellentesque a pellentesque felis nec nunc.',
                isHighlighted: false,
              ),
              _buildPortfolioCard(
                'SEAD',
                'assets/images/sead.png',
                'Lorem ipsum dolor sit amet consectetur. Feugiat amet faucibus senectus at. Enim pellentesque a pellentesque felis nec nunc.',
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
    String title,
    String imagePath,
    String description, {
    required bool isHighlighted,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: KStyle.cWhiteColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: isHighlighted
            ? Border.all(color: KStyle.cPinkOrgColor, width: 2)
            : null,
        boxShadow: isHighlighted
            ? [
                BoxShadow(
                  color: KStyle.cPinkOrgColor.withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Portfolio Image Section (Top 60%)
          Expanded(
            flex: 7,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
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
            ),
          ),

          // Portfolio Content Section (Bottom 40%)
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
