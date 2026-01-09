import 'package:elvira/src/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:elvira/src/ui/theme/elvira_colors.dart';

class MedicinesScreen extends StatelessWidget {
  const MedicinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: elviraColorMap[ElviraColor.background],
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, size: 36),
                    color: elviraColorMap[ElviraColor.primary],
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Medicamentos',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: elviraColorMap[ElviraColor.onBackground],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView(
                  children: [
                    _buildMedicineCard(
                      name: 'Dipirona',
                      dosage: '500mg',
                      frequency: '8 em 8 horas',
                      time: '08:00, 16:00, 00:00',
                    ),
                    _buildMedicineCard(
                      name: 'Losartana',
                      dosage: '50mg',
                      frequency: 'Uma vez ao dia',
                      time: '08:00',
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

  Widget _buildMedicineCard({
    required String name,
    required String dosage,
    required String frequency,
    required String time,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: elviraColorMap[ElviraColor.surface],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: elviraColorMap[ElviraColor.primary] ?? Colors.blue,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: elviraColorMap[ElviraColor.onBackground],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Dosagem: $dosage',
            style: TextStyle(
              fontSize: 18,
              color: elviraColorMap[ElviraColor.onSurface],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Frequência: $frequency',
            style: TextStyle(
              fontSize: 18,
              color: elviraColorMap[ElviraColor.onSurface],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Horários: $time',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: elviraColorMap[ElviraColor.primary],
            ),
          ),
        ],
      ),
    );
  }
}
