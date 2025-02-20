import SwiftUI
import AVFoundation

struct TranslatorView: View {
    @State private var isRecording: Bool = false
    @State private var translationInProgress: Bool = false
    @State private var showResult: Bool = false
    @State private var isHumanToPet: Bool = true

    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Button(action: { isHumanToPet = true }) {
                    Text("HUMAN")
                        .foregroundColor(isHumanToPet ? .white : .blue)
                        .padding()
                        .background(isHumanToPet ? Color.blue : Color.clear)
                        .cornerRadius(10)
                }
                
                Text("→")
                
                Button(action: { isHumanToPet = false }) {
                    Text("PET")
                        .foregroundColor(!isHumanToPet ? .white : .blue)
                        .padding()
                        .background(!isHumanToPet ? Color.blue : Color.clear)
                        .cornerRadius(10)
                }
            }
            
            Image("dogExample")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            if !isRecording && !translationInProgress {
                Button(action: { startRecording() }) {
                    Label("Start Speak", systemImage: "mic.fill")
                        .font(.title3)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(12)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            }
            
            if isRecording {
                Text("Recording...")
                    .font(.headline)
                    .foregroundColor(.red)
                    .transition(.opacity)
                    .animation(.easeInOut, value: isRecording)
            }
            
            if translationInProgress {
                Text("Processing translation...")
                    .font(.headline)
                    .transition(.opacity)
                    .animation(.easeInOut, value: translationInProgress)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Translator")
        .onAppear { requestMicrophonePermission() }
        .navigationDestination(isPresented: $showResult) {
            ResultView(isHumanToPet: isHumanToPet)
        }
    }
    
    func requestMicrophonePermission() {
        if #available(iOS 17.0, *) {
            AVAudioApplication.requestRecordPermission { granted in
                if !granted {
                    print("Microphone permission denied")
                }
            }
        } else {
            AVAudioSession.sharedInstance().requestRecordPermission { granted in
                if !granted {
                    print("Microphone permission denied")
                }
            }
        }
    }

    func startRecording() {
        let audioSession = AVAudioSession.sharedInstance()
        
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default, options: [])
            try audioSession.setActive(true)
            requestMicrophonePermission()

            DispatchQueue.main.async {
                isRecording = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isRecording = false
                translationInProgress = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    translationInProgress = false
                    showResult = true
                }
            }
        } catch {
            print("Error setting up audio session: \(error.localizedDescription)")
        }
    }
}

#Preview {
    NavigationStack {
        TranslatorView()
    }
}
