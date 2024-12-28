import Foundation

func getBotResponse(message: String) -> String {
    let response = message.lowercased()
    
    if response.contains( "hello" ) {
        return "Hey, Omar!"
    } else if response.contains("how are you") {
        return "I'm Fine, What About You?"
    } else if response.contains("can you help me") {
        return "Of course!, How can I assist you? 😊"
    } else if response.contains("how can i improve myself?") {
        return "By learning new skills and practicing regularly."
    } else if response.contains("a7a") {
        return "fe3lan"
    } else if response.contains("fuck") {
        return "you"
    } else if response.contains("3ayez atgawez") {
        return "sorry, me4 hena"
    } else if response.contains("") {
        return ""
    } else {
        return "I'm sorry, I don't understand your Message."
    }
    
}
