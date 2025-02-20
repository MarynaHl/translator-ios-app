import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TranslatorView()
                .tabItem {
                    Image(systemName: "bubble.left.and.bubble.right")
                    Text("Translator")
                }
            
            ClickerView()
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
