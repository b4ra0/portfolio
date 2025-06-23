import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portfolio_barao/components/section_base.dart';
import 'package:portfolio_barao/models/user.dart';

class ProfessionalExperiences extends StatelessWidget {
  const ProfessionalExperiences({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final professionalExperiences = user.professionalExperiences;
    if (professionalExperiences == null || professionalExperiences.isEmpty) {
      return const SizedBox.shrink();
    }
    return SectionBase(
      widgets: [
        for (final professionalExperience in professionalExperiences)
          Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://scontent.ffln1-1.fna.fbcdn.net/v/t39.30808-6/331885235_1249181735679088_8027008180452709461_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=MkuKV9J9iTAQ7kNvwEEqslA&_nc_oc=AdkA54OmIP_pWgecX2hqbAguwLvWpHOycivhRNxAz_qDwHxn4U1fBGHCTGnyyo_4qRQ&_nc_zt=23&_nc_ht=scontent.ffln1-1.fna&_nc_gid=pQ4JWUOG1Q3-yZXL1pYSyA&oh=00_AfPeyFroAzPLbFCVNiTQylRbEnvvq6xTKDxu50aqGnQ29Q&oe=685EA45A',
              height: 50,
              width: 50,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      professionalExperience.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "${professionalExperience.position} | ${DateFormat('MM/yyyy').format(professionalExperience.startDate)} - ${DateFormat('MM/yyyy').format(professionalExperience.endDate!)}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      professionalExperience.description,
                      maxLines: 99,
                      textAlign: TextAlign.justify,
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white60,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
      title: 'Experiência Profissional',
    );
  }
}
