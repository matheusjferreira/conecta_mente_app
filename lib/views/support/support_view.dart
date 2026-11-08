import 'package:flutter/material.dart';
import '../../viewmodels/support_viewmodel.dart';

class SupportView extends StatelessWidget {
  final SupportViewModel viewModel;
  const SupportView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(title: const Text('Mapeamento de Apoio')),
          body: Column(
            children: [
              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  children: viewModel.filters.map((f) {
                    final selected = viewModel.filter == f;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(f),
                        selected: selected,
                        onSelected: (_) => viewModel.setFilter(f),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: viewModel.resources.length,
                  itemBuilder: (context, i) {
                    final r = viewModel.resources[i];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        leading: const Icon(Icons.local_hospital_outlined),
                        title: Text(r.name),
                        subtitle: Text('${r.type} • ${r.address}\n${r.hours}'),
                        isThreeLine: true,
                        trailing: r.phone != '—'
                            ? Chip(
                                label: Text(r.phone),
                                backgroundColor: Colors.green.shade100,
                              )
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
