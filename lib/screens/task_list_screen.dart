import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/screens/task_detail_screen.dart';

import '../models/task.dart';
import '../provider/task_provider.dart';
import '../provider/theme_provider.dart';
import '../widgets/task_item.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  int _selectedFilterIndex = 0;
  final List<String> _filterOptions = ['All', 'Pending', 'Completed'];

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    List<Task> tasksToDisplay;
    switch (_selectedFilterIndex) {
      case 1:
        tasksToDisplay = taskProvider.getPendingTasks();
        break;
      case 2:
        tasksToDisplay = taskProvider.getCompletedTasks();
        break;
      default:
        tasksToDisplay = taskProvider.tasks;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(themeProvider.themeMode == ThemeMode.dark
                ? Icons.light_mode
                : Icons.dark_mode),
            onPressed: () {
              themeProvider.toggleTheme(
                  themeProvider.themeMode != ThemeMode.dark);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: SegmentedButton<int>(
              segments: _filterOptions
                  .asMap()
                  .entries
                  .map((entry) => ButtonSegment(
                value: entry.key,
                label: Text(entry.value),
              ))
                  .toList(),
              selected: {_selectedFilterIndex},
              onSelectionChanged: (Set<int> newSelection) {
                setState(() {
                  _selectedFilterIndex = newSelection.first;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasksToDisplay.length,
              itemBuilder: (ctx, index) => TaskItem(
                task: tasksToDisplay[index],
              ),
            ),
          ),
          // Added footer text here
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Made by Charan Dusary',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.6),
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => const TaskDetailScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}