import SwiftUI
import AVFoundation

struct ClickerTrainerView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Clicker for pet training")
                .font(.title)
            
            Button("Click!") {
                playClickSound()
            }
            .font(.title2)
            .padding()
            .background(Color.orange)
            .cornerRadius(12)
            .foregroundColor(.white)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Clicker")
    }
    
    func playClickSound() {
        guard let url = Bundle.main.url(forResource: "clickerSound", withExtension: "mp3") else { return }
        var player: AVAudioPlayer?
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error playing sound", error)
        }
    }
}
