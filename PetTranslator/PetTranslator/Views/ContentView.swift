import SwiftUI

enum Tab {
    case translator
    case clicker
}

struct ContentView: View {
    @State private var selectedTab: Tab = .translator

    var body: some View {
        ZStack(alignment: .bottom) {
            
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(hex: "F3F5F6"),
                    Color(hex: "C9FFE0")
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            Group {
                if selectedTab == .translator {
                    TranslatorView()
                } else {
                    ClickerView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)

            .padding(.bottom, 110)
            
            bottomBar
                .padding(.bottom, 19)
        }
    }

    private var bottomBar: some View {
        HStack(spacing: 0) {
            Button(action: {
                selectedTab = .translator
            }) {
                VStack(spacing: 4) {
                    Image(systemName: "bubble.left.and.bubble.right")
                        .font(.system(size: 20))
                        .foregroundColor(selectedTab == .translator ? .black : .gray)

                    Text("Translator")
                        .font(.system(size: 14, weight: selectedTab == .translator ? .bold : .regular))
                        .foregroundColor(selectedTab == .translator ? .black : .gray)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
            }

            Button(action: {
                selectedTab = .clicker
            }) {
                VStack(spacing: 4) {
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 20))
                        .foregroundColor(selectedTab == .clicker ? .black : .gray)

                    Text("Clicker")
                        .font(.system(size: 14, weight: selectedTab == .clicker ? .bold : .regular))
                        .foregroundColor(selectedTab == .clicker ? .black : .gray)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
            }
        }
        .frame(width: 216, height: 82)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color(hex: "373E7D").opacity(0.3),
                radius: 80, x: 0, y: 0)
    }
}

extension Color {
    init(hex: String) {
        let hexSanitized = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
