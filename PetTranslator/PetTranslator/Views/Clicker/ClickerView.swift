import SwiftUI

struct ClickerView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("Settings")
                .font(.system(size: 32, weight: .bold))
                .padding(.top, 40)

            Button("Rate Us") {}
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(Color(hex: "D6DCFF"))
                .cornerRadius(20)

            Button("Share App") {}
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(Color(hex: "D6DCFF"))
                .cornerRadius(20)

            Button("Contact Us") {}
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(Color(hex: "D6DCFF"))
                .cornerRadius(20)

            Button("Restore Purchases") {}
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(Color(hex: "D6DCFF"))
                .cornerRadius(20)

            Button("Privacy Policy") {}
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(Color(hex: "D6DCFF"))
                .cornerRadius(20)

            Button("Terms of Use") {}
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(Color(hex: "D6DCFF"))
                .cornerRadius(20)

            Spacer()
        }
        .padding(.horizontal, 35)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(hex: "F3F5F6"),
                    Color(hex: "C9FFE0")
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
    }
}
