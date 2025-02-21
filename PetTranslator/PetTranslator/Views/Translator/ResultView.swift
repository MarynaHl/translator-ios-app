import SwiftUI

struct ResultView: View {
    let selectedAnimal: String
    let isHumanToPet: Bool
    
    @State private var showMessage = true
    @State private var randomMessage: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    private let catMessages = [
        "I'm hungry, feed me!",
        "I want some food!",
        "Meow meow, let's play!"
    ]
    private let dogMessages = [
        "What are you doing, human?",
        "Take me for a walk!",
        "Woof woof, I'm bored!"
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(hex: "F3F5F6"),
                    Color(hex: "C9FFE0")
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 16) {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.top, 80)
                
                Text("Result")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.black)
                
                Spacer()
                
                ZStack {
                    Image(selectedAnimal)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 184, height: 184)
                    
                    if showMessage {
                        SpeechBubbleView(text: randomMessage)
                            .offset(y: -190)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                showMessage = false
                            }
                    } else {
                        Button {
                            if selectedAnimal == "catExample" {
                                randomMessage = catMessages.randomElement()!
                            } else {
                                randomMessage = dogMessages.randomElement()!
                            }
                            showMessage = true
                        } label: {
                            HStack(spacing: 8) {
                                Image(systemName: "arrow.clockwise")
                                    .font(.system(size: 16, weight: .bold))
                                Text("Repeat")
                                    .font(.system(size: 16, weight: .bold))
                            }
                            .foregroundColor(.black)
                            .frame(width: 291, height: 54)
                            .background(Color(hex: "D6DCFF"))
                            .cornerRadius(16)
                        }
                        .offset(y: -190)
                    }
                }
                Spacer()
            }
        }
        .onAppear {
            if selectedAnimal == "catExample" {
                randomMessage = catMessages.randomElement()!
            } else {
                randomMessage = dogMessages.randomElement()!
            }
        }
    }
}

struct SpeechBubbleView: View {
    let text: String
    
    var body: some View {
        ZStack {
            BubbleShape()
                .fill(Color.white)
                .frame(width: 291, height: 142)
            Text(text)
                .font(.system(size: 16))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 8)
        }
    }
}

struct BubbleShape: Shape {
    let cornerRadius: CGFloat = 16
    let tailWidth: CGFloat = 20
    let tailHeight: CGFloat = 12
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let bubbleHeight = rect.height - tailHeight
        let bubbleRect = CGRect(x: 0, y: 0, width: rect.width, height: bubbleHeight)
        path.addRoundedRect(in: bubbleRect, cornerSize: CGSize(width: cornerRadius, height: cornerRadius))
        let tailX = rect.midX - tailWidth / 2
        let tailY = bubbleRect.maxY
        path.move(to: CGPoint(x: tailX, y: tailY))
        path.addLine(to: CGPoint(x: tailX + tailWidth / 2, y: tailY + tailHeight))
        path.addLine(to: CGPoint(x: tailX + tailWidth, y: tailY))
        path.closeSubpath()
        return path
    }
}
