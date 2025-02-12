import Foundation

/*
 // Build docs with:
 
 swift package --allow-writing-to-directory docs/ \
     generate-documentation --target Swift-Concurrency-Tutorial \
     --disable-indexing \
     --transform-for-static-hosting \
     --hosting-base-path /Swift-Concurrency-Tutorial \
     --output-path docs/
 */

struct Reminder: CustomStringConvertible {
    let text: String
    /// Time before the Reminder should fire, in seconds.
    let duration: Double
    let tags: Set<String>
    
    var description: String {
        """
        \(text)
           \(tags)
        """
    }
}

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


let manager = ReminderManager()
let reminders = [
    Reminder(text: "Do the dishes",
             duration: 6,
             tags: ["chore"]),
    Reminder(text: "Clean the litter",
             duration: 12,
             tags: ["chore", "cats"]),
    Reminder(text: "Dance like no one is watching",
             duration: 3,
             tags: ["fun"])
]

for reminder in reminders {
    manager.add(reminder)
}

await manager.run()
