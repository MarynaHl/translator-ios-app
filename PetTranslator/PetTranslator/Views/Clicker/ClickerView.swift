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
                    
                    Section {
                        settingsButton(title: "Play Clicker Sound", action: playClickerSound)
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.green.opacity(0.2)]), startPoint: .top, endPoint: .bottom))
                .navigationTitle("Settings")
                .font(.system(size: 28, weight: .bold))
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
                .frame(maxWidth: .infinity)
                .background(Color.white.opacity(0.9))
                .cornerRadius(20)
                .shadow(radius: 5)
                .padding()
            }
        }
    }
    
    func settingsButton(title: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .medium))
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color.blue.opacity(0.2))
            .cornerRadius(12)
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
