import SwiftUI

struct TranslationProcessView: View {
    let isHumanToPet: Bool
    let selectedAnimal: String

    @Binding var showTranslationProcess: Bool
    @Binding var showResult: Bool

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
                Text("Process of translation...")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black)

                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                showTranslationProcess = false
            }
        }
        .onChange(of: showTranslationProcess) { newValue in
            if newValue == false {
                showResult = true
            }
        }
    }
}
