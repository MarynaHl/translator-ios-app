import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                TranslatorView()
            }
            .tabItem {
                Image(systemName: "bubble.left.and.bubble.right")
                Text("Translator")
            }
            
            NavigationView {
                ClickerView()
            }
            .tabItem {
                Image(systemName: "gearshape")
                Text("Clicker")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
