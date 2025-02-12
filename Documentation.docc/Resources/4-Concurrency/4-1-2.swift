import Foundation

class ReminderManager {
    
    private var reminders: [Reminder] = []
    
    func add(_ reminder: Reminder) {
        reminders.append(reminder)
    }
    
    func run() async {
        await withTaskGroup(of: Void.self) { group in
            for reminder in reminders {
                sleep(UInt32(reminder.duration))
                print(reminder)
            }
        }
    }
}
