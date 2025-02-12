import Foundation

class ReminderManager {
    
    private var reminders: [Reminder] = []
    
    func add(_ reminder: Reminder) {
        reminders.append(reminder)
    }
    
    func run() async {
        await withTaskGroup(of: Void.self) { group in
            for reminder in reminders {
                group.addTask {
                    try? await Task.sleep(for: .seconds(reminder.duration))
                    print(reminder)
                }
            }
        }
    }
}
