import SwiftUI

struct ClickerView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("Settings")
                .font(.system(size: 32, weight: .bold))
                .padding(.top, 20)

            settingsButton(title: "Rate Us") { print("Rate Us tapped") }
            settingsButton(title: "Share App") { print("Share App tapped") }
            settingsButton(title: "Contact Us") { print("Contact tapped") }
            settingsButton(title: "Restore Purchases") { print("Restore tapped") }
            settingsButton(title: "Privacy Policy") { print("Privacy tapped") }
            settingsButton(title: "Terms of Use") { print("Terms tapped") }

            Spacer()
        }
        .padding(.horizontal, 20)
    }

    private func settingsButton(title: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.black)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 16)
            .frame(height: 50)
            .background(Color(hex: "D6DCFF"))
            .cornerRadius(20)
        }
    }
}

struct ClickerView_Previews: PreviewProvider {
    static var previews: some View {
        ClickerView()
    }
}
