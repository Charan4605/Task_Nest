 # 📝 TaskNest - Cross-Platform To-Do App

TaskNest is a clean and minimalistic To-Do application built using **Flutter**. It supports **light/dark mode**, local storage using **Hive**, and state management with **Provider**. This project is designed as part of an intermediate-level Flutter assignment.

---

## 🚀 Features

- 📋 Task List & Detailed View
- ➕ Add / ✏️ Edit / 🗑️ Delete Tasks
- 🌙 Light & Dark Mode Toggle
- 💾 Local Storage with Hive
- ⚙️ State Management using Provider

---

## 🎯 Stretch Goals (Optional Enhancements)

- 🔔 Deadline Notifications (via `flutter_local_notifications`)
- 📅 Calendar View (via `table_calendar`)


---

## 🛠️ Tech Stack

- **Framework:** Flutter (Dart)
- **State Management:** Provider
- **Local Storage:** Hive
- **UI:** Material Design

---

## 📁 Project Structure

```bash
/lib
  ├── models/          # Task model (Hive adapter)
  ├── providers/       # Provider classes
  ├── screens/         # Task List and Task Details UI
  ├── widgets/         # Reusable widgets (e.g., TaskTile)
  └── main.dart        # App entry point
