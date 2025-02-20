import SwiftUI

struct ResultView: View {
    let isHumanToPet: Bool

    var body: some View {
        VStack(spacing: 20) {
            Text("Result")
                .font(.system(size: 28, weight: .bold))

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
                .frame(width: 150, height: 150)


            Button("Repeat") {
            }
            .font(.title3)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)

            Spacer()
        }
        .padding()
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(isHumanToPet: true)
    }
}
