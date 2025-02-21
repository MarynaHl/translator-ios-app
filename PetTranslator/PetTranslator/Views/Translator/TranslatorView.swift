import SwiftUI

struct TranslatorView: View {
    @State private var isHumanToPet = true
    @State private var isRecording = false
    @State private var isTranslating = false
    @State private var selectedAnimal = "dogExample"

    var body: some View {
        VStack(spacing: 16) {
            Text("Translator")
                .font(.system(size: 32, weight: .bold))
                .padding(.top, 40)

            HStack(spacing: 20) {
                Button {
                    isHumanToPet = true
                } label: {
                    Text("HUMAN")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(isHumanToPet ? .black : .gray)
                }

                Image(systemName: "arrow.left.arrow.right")
                    .font(.system(size: 18))
                    .foregroundColor(.black)

                Button {
                    isHumanToPet = false
                } label: {
                    Text("PET")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(!isHumanToPet ? .black : .gray)
                }
            }

            HStack(alignment: .top, spacing: 35) {
                if isRecording {
                    recordingCard
                } else if isTranslating {
                    translatingCard
                } else {
                    speakCard
                }

                animalPicker
            }
            .padding(.top, 20)

            Image(selectedAnimal)
                .resizable()
                .scaledToFit()
                .frame(width: 184, height: 184)
                .padding(.top, 30)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.horizontal, 35)
    }

    private var speakCard: some View {
        Button {
            startRecording()
        } label: {
            VStack(spacing: 8) {
                Image(systemName: "mic.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.black)
                Text("Start Speak")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black)
            }
            .frame(width: 320, height: 176)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 4)
        }
    }

    private var recordingCard: some View {
        VStack(spacing: 8) {
            Image(systemName: "waveform")
                .font(.system(size: 40))
                .foregroundColor(.purple)
            Text("Recording...")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
        }
        .frame(width: 320, height: 176)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 4)
    }

    private var translatingCard: some View {
        VStack(spacing: 8) {
            Text("Process of translation...")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
        }
        .frame(width: 320, height: 176)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 4)
    }

    private var animalPicker: some View {
        VStack(spacing: 10) {
            Button {
                selectedAnimal = "catExample"
            } label: {
                Image("catExample")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .background(selectedAnimal == "catExample" ? Color.blue.opacity(0.4) : Color.clear)
                    .cornerRadius(10)
            }

            Button {
                selectedAnimal = "dogExample"
            } label: {
                Image("dogExample")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .background(selectedAnimal == "dogExample" ? Color.green.opacity(0.4) : Color.clear)
                    .cornerRadius(10)
            }
        }
        .frame(width: 100, height: 176)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 4)
    }

    private func startRecording() {
        isRecording = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isRecording = false
            isTranslating = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isTranslating = false
            }
        }
    }
}
