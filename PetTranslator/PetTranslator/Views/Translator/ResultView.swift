import SwiftUI

struct ResultView: View {
    let isHumanToPet: Bool

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

            VStack(spacing: 20) {
                HStack {
                    Button {
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding()

                Text("Result")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 20)

                if isHumanToPet {
                    Text("I'm hungry, feed me!")
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                } else {
                    Text("What are you doing, human?")
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                }

                Image(isHumanToPet ? "catExample" : "dogExample")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 184, height: 184)

                Button {
                } label: {
                    HStack {
                        Image(systemName: "arrow.clockwise")
                        Text("Repeat")
                    }
                    .font(.system(size: 16, weight: .bold))
                    .padding()
                    .background(Color(hex: "D6DCFF"))
                    .cornerRadius(12)
                }
                Spacer()
            }
        }
    }
}
