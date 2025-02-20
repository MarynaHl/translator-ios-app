import SwiftUI
import AVFoundation

struct ClickerView: View {
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        NavigationStack {
            VStack {
                Text("Settings")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.top, 20)

                VStack(spacing: 16) {
                    settingsButton(title: "Rate Us", action: rateApp)
                    settingsButton(title: "Share App", action: shareApp)
                    settingsButton(title: "Contact Us", action: contactUs)
                    settingsButton(title: "Restore Purchases", action: restorePurchases)
                    settingsButton(title: "Privacy Policy", action: openPrivacyPolicy)
                    settingsButton(title: "Terms of Use", action: openTermsOfUse)
                }
                .padding(.horizontal, 16)
                .padding(.top, 20)

                Spacer()

                bottomPanel()
                    .padding(.bottom, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [Color(hex: "F3F5F6"), Color(hex: "C9FFE0")]), startPoint: .top, endPoint: .bottom))
        }
    }

    func settingsButton(title: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .foregroundColor(Color(hex: "393736"))
                    .font(.system(size: 16, weight: .medium))
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(Color.white)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(hex: "D6DCFF"), lineWidth: 2)
            )
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(hex: "D6DCFF").opacity(0.4))
            )
        }
    }

    func bottomPanel() -> some View {
        HStack {
            VStack {
                Image(systemName: "bubble.left.and.bubble.right")
                    .foregroundColor(.gray)
                Text("Translator")
                    .foregroundColor(.gray)
            }
            .padding()
            .frame(maxWidth: .infinity)

            VStack {
                Image(systemName: "gearshape.fill")
                    .foregroundColor(.black)
                Text("Clicker")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
        .frame(width: 216, height: 82)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.2), radius: 12, x: 0, y: 6)
    }

    func rateApp() {
        print("Rate app tapped")
    }

    func shareApp() {
        let textToShare = "Check out this awesome Pet Translator app!"
        let activityVC = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)

        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootVC = scene.windows.first?.rootViewController {
            rootVC.present(activityVC, animated: true, completion: nil)
        }
    }

    func contactUs() {
        print("Contact us tapped")
    }

    func restorePurchases() {
        print("Restore purchases tapped")
    }

    func openPrivacyPolicy() {
        if let url = URL(string: "https://yourPrivacyPolicyLink.com") {
            UIApplication.shared.open(url)
        }
    }

    func openTermsOfUse() {
        if let url = URL(string: "https://yourTermsOfUseLink.com") {
            UIApplication.shared.open(url)
        }
    }

    func playClickerSound() {
        guard let soundURL = Bundle.main.url(forResource: "clickerSound", withExtension: "mp3") else {
            print("Clicker sound file not found")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        } catch {
            print("Error playing clicker sound: \(error.localizedDescription)")
        }
    }
}

struct ClickerView_Previews: PreviewProvider {
    static var previews: some View {
        ClickerView()
    }
}

extension Color {
    init(hex: String) {
        let hexSanitized = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}
