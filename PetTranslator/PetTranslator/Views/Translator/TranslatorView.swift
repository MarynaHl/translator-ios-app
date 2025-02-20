// TranslatorView.swift
import SwiftUI
import AVFoundation

struct TranslatorView: View {
    @State private var isRecording: Bool = false
    @State private var translationInProgress: Bool = false
    @State private var showResult: Bool = false
    
    @State private var isHumanToPet: Bool = true // true: Human->Pet, false: Pet->Human
    
    var body: some View {
        VStack(spacing: 20) {
            
            HStack(spacing: 20) {
                Button(action: {
                    isHumanToPet = true
                }) {
                    Text("HUMAN")
                        .foregroundColor(isHumanToPet ? .white : .blue)
                        .padding()
                        .background(isHumanToPet ? Color.blue : Color.clear)
                        .cornerRadius(10)
                }
                
                Text("→")
                
                Button(action: {
                    isHumanToPet = false
                }) {
                    Text("PET")
                        .foregroundColor(!isHumanToPet ? .white : .blue)
                        .padding()
                        .background(!isHumanToPet ? Color.blue : Color.clear)
                        .cornerRadius(10)
                }
            }
            
            Image("dogExample") //Figma Assets
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            if !isRecording && !translationInProgress {
                Button(action: {
                    startRecording()
                }) {
                    Label("Start Speak", systemImage: "mic.fill")
                        .font(.title3)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(12)
                }
            }
            
            if isRecording {
                Text("Recording...")
                    .font(.headline)
                    .foregroundColor(.red)
            }
            
            if translationInProgress {
                Text("Process of translation...")
                    .font(.headline)
            }
            
            Spacer()
            

            NavigationLink(
                destination: ResultView(isHumanToPet: isHumanToPet),
                isActive: $showResult,
                label: { EmptyView() }
            )
        }
        .padding()
        .onAppear {
            
        }
        .navigationTitle("Translator")
    }
    
    // MARK: - Функції
    
    func startRecording() {

        AVAudioSession.sharedInstance().requestRecordPermission { granted in
            if granted {

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
            } else {
                print("Microphone permission denied")
            }
        }
    }
}

struct TranslatorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TranslatorView()
        }
    }
}

struct ResultView: View {
    var isHumanToPet: Bool
    
    var body: some View {
        VStack {
            if isHumanToPet {
                Text("Перекладено: “Гав-гав!”")
                    .padding()
            } else {
                Text("Перекладено: “What are you doing, human?”")
                    .padding()
            }
        }
        .navigationTitle("Result")
    }
}
