import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';

class PriorityDropdown extends StatelessWidget {
  final Priority initialPriority;
  final Function(Priority) onPriorityChanged;

  const PriorityDropdown({
    super.key,
    required this.initialPriority,
    required this.onPriorityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Priority>(
      value: initialPriority,
      decoration: const InputDecoration(
        labelText: 'Priority',
        border: OutlineInputBorder(),
      ),
      items: Priority.values
          .map(
            (priority) => DropdownMenuItem<Priority>(
          value: priority,
          child: Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: priority.color,
                ),
              ),
              const SizedBox(width: 8),
              Text(priority.name),
            ],
          ),
        ),
      )
          .toList(),
      onChanged: (Priority? value) {
        if (value != null) {
          onPriorityChanged(value);
        }
      },
    );
  }
}