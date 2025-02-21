import SwiftUI
import AVFoundation

struct TranslatorView: View {
    @State private var isHumanToPet = true
    @State private var isRecording = false
    @State private var selectedAnimal = "dogExample"
    
    @State private var showTranslationProcess = false
    @State private var showResult = false
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Translator")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.black)
                .padding(.top, 80)
            
            VStack(spacing: 24) {
                HStack(spacing: 40) {
                    Text("HUMAN")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.black)
                    Image("iconWaveform1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    Text("PET")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.black)
                }
                .padding(.top, 40)
                
                HStack(spacing: 35) {
                    if isRecording {
                        recordingCard
                    } else {
                        speakCard
                    }
                    animalPicker
                }
                .frame(width: 320, height: 176)
                .padding(.top, 40)
            }
            
            Image(selectedAnimal)
                .resizable()
                .scaledToFit()
                .frame(width: 184, height: 184)
                .padding(.top, 40)
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .sheet(isPresented: $showTranslationProcess) {
            TranslationProcessView(
                isHumanToPet: isHumanToPet,
                selectedAnimal: selectedAnimal,
                showTranslationProcess: $showTranslationProcess,
                showResult: $showResult
            )
        }
        .fullScreenCover(isPresented: $showResult) {
            ResultView(selectedAnimal: selectedAnimal, isHumanToPet: isHumanToPet)
        }
    }
    
    private var recordingCard: some View {
        VStack {
            Image("iconWaveform")
                .resizable()
                .scaledToFit()
                .frame(width: 163, height: 95)
                .foregroundColor(.purple)
                .padding(.bottom, 5)
            Text("Recording...")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
        }
        .frame(width: 160, height: 160)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
    
    private var speakCard: some View {
        Button {
            startRecording()
        } label: {
            VStack {
                Image("iconMic")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                    .foregroundColor(.black)
                    .padding(.bottom, 5)
                Text("Start Speak")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black)
            }
            .frame(width: 160, height: 160)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 5)
        }
    }
    
    private var animalPicker: some View {
        VStack(spacing: 16) {
            Button {
                selectedAnimal = "catExample"
            } label: {
                ZStack {
                    Color(hex: "#D1E7FC")
                    Image("catExample")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .opacity(selectedAnimal == "catExample" ? 1.0 : 0.5)
                }
                .cornerRadius(10)
            }
            .frame(width: 60, height: 60)
            
            Button {
                selectedAnimal = "dogExample"
            } label: {
                ZStack {
                    Color(hex: "#ECFBC7")
                    Image("dogExample")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .opacity(selectedAnimal == "dogExample" ? 1.0 : 0.5)
                }
                .cornerRadius(10)
            }
            .frame(width: 60, height: 60)
        }
        .frame(width: 80, height: 160)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
    
    private func startRecording() {
        AVAudioSession.sharedInstance().requestRecordPermission { granted in
            DispatchQueue.main.async {
                if granted {
                    isRecording = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        isRecording = false
                        showTranslationProcess = true
                    }
                } else {
                    print("Microphone permission denied")
                }
            }
        }
    }
}
