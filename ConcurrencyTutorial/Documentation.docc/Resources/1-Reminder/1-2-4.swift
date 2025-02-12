struct Reminder {
    let text: String
    /// Time before the Reminder should fire, in seconds.
    let duration: Double
    let tags: Set<String>
}
