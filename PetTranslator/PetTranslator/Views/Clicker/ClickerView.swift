import SwiftUI
import AVFoundation

struct ClickerTrainerView: View {
    @State private var player: AVAudioPlayer?

    init() {
        configureAudioSession()
    }

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
        guard let url = Bundle.main.url(forResource: "clickerSound", withExtension: "mp3") else {
            print("⚠️ Clicker sound file not found in Bundle!")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("⚠️ Error playing clicker sound: \(error.localizedDescription)")
        }
    }
    
    func configureAudioSession() {
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.playback, mode: .default)
            try session.setActive(true)
        } catch {
            print("⚠️ Error configuring audio session: \(error.localizedDescription)")
        }
    }
}
