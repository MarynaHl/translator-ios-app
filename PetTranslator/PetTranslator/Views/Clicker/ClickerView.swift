import SwiftUI

struct ClickerView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: {
                        rateApp()
                    }) {
                        Text("Rate Us")
                    }
                    
                    Button(action: {
                        shareApp()
                    }) {
                        Text("Share App")
                    }
                    
                    Button(action: {
                        contactUs()
                    }) {
                        Text("Contact Us")
                    }
                }
                
                Section {
                    Button(action: {
                        restorePurchases()
                    }) {
                        Text("Restore Purchases")
                    }
                }
                
                Section {
                    Button(action: {
                        openPrivacyPolicy()
                    }) {
                        Text("Privacy Policy")
                    }
                    
                    Button(action: {
                        openTermsOfUse()
                    }) {
                        Text("Terms of Use")
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
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
}

struct ClickerView_Previews: PreviewProvider {
    static var previews: some View {
        ClickerView()
    }
}
