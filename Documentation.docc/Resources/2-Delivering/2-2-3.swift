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
