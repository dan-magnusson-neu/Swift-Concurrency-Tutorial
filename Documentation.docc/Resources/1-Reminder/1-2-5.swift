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
