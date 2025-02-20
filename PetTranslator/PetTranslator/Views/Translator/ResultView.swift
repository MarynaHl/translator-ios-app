// ResultView.swift
import SwiftUI

struct ResultView: View {
    var isHumanToPet: Bool
    
    @State private var showBubbleText: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text(showBubbleText)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            if isHumanToPet {
                Image("dogExample")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
            } else {
                Image("catExample")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
            }
            
            Button(action: {
                playTranslation()
            }) {
                Text("Repeat")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            
            Spacer()
        }
        .navigationTitle("Result")
        .onAppear {
            playTranslation()
        }
    }
    
    func playTranslation() {

        if isHumanToPet {
            showBubbleText = "Гав-гав! Feed me!"
        } else {
            showBubbleText = "What are you doing, human?"
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ResultView(isHumanToPet: true)
        }
    }
}
