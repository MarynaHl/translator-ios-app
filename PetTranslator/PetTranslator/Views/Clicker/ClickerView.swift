import SwiftUI
import AVFoundation

struct ClickerView: View {
    @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        settingsButton(title: "Rate Us", action: rateApp)
                        settingsButton(title: "Share App", action: shareApp)
                        settingsButton(title: "Contact Us", action: contactUs)
                    }
                    
                    Section {
                        settingsButton(title: "Restore Purchases", action: restorePurchases)
                    }
                    
                    Section {
                        settingsButton(title: "Privacy Policy", action: openPrivacyPolicy)
                        settingsButton(title: "Terms of Use", action: openTermsOfUse)
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .background(LinearGradient(gradient: Gradient(colors: [Color(hex: "F3F5F6"), Color(hex: "C9FFE0")]), startPoint: .top, endPoint: .bottom))
                .navigationTitle("Settings")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.black)
                
                Spacer()
                
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
                .background(Color.white.opacity(1))
                .cornerRadius(16)
                .shadow(color: Color(hex: "373E7D").opacity(0.3), radius: 10, x: 0, y: 4)
                .padding(.bottom, 20)
            }
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
            .frame(width: 358, height: 50)
            .background(Color(hex: "D6DCFF"))
            .cornerRadius(20)
        }
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
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.startIndex
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue >> 16) & 0xFF) / 255.0
        let green = Double((rgbValue >> 8) & 0xFF) / 255.0
        let blue = Double(rgbValue & 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
