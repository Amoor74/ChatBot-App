import SwiftUI

struct ContentView: View {
    @State var messageText: String = ""
    @State var messages: [String] = ["Talk To Chat Bot"]
    
    var body: some View {
        VStack {
            HStack {
                Text("ChatBot")
                    .bold()
                Image(systemName: "message.fill")
            }.foregroundStyle(.blue)
                .font(.title)
            
            ScrollView {
                ForEach(messages, id: \.self) { message in
                    if message.contains("[USER]") {
                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                        HStack {
                            Spacer()
                            Text(newMessage)
                                .padding()
                                .foregroundStyle(.white)
                                .background(.blue, in: .rect(cornerRadius: 15))
                                .padding(.horizontal, 15)
                                .padding(.bottom, 10)
                        }
                    } else {
                        HStack {
                            Text(message)
                                .padding()
                                .background(.gray.opacity(0.2), in: .rect(cornerRadius: 20))
                                .padding(.horizontal, 15)
                                .padding(.bottom, 10)
                            Spacer()
                        }
                    }
                    
                }.rotationEffect(.degrees(180))
            }.rotationEffect(.degrees(180))
            
            HStack {
                TextField("Type Something...", text: $messageText)
                    .padding()
                    .background(Color.gray.opacity(0.3), in: .rect(cornerRadius: 15))
                    .onSubmit {
                        sendMessage(message: messageText)
                    }
                
                Button {
                    sendMessage(message: messageText)
                } label: {
                    Image(systemName: "paperplane.fill")
                        .font(.system(size: 30))
                }

            }.padding(.horizontal)
            
        }
    }
    
    func sendMessage(message: String) {
        withAnimation {
            messages.append("[USER]" + message)
            self.messageText = ""
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation {
                messages.append(getBotResponse(message: message))
            }
        }
        
    }
    
}

#Preview {
    ContentView()
}
