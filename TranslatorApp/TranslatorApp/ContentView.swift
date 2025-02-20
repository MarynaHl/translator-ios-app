import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Translator")
                    .font(.largeTitle)
                    .bold()
                
                Spacer()
                
                NavigationLink(destination: TranslatorView()) {
                    Text("Start Speak")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct TranslatorView: View {
    var body: some View {
        VStack {
            Text("Recording...")
                .font(.title)
            Spacer()
        }
        .navigationTitle("Translator")
    }
}
