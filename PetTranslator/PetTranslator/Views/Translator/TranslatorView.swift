import SwiftUI

struct TranslatorView: View {
    @State private var isHumanToPet = true
    @State private var isRecording = false
    @State private var selectedAnimal: String = "dogExample"

    var body: some View {
        VStack(spacing: 16) {
            Text("Translator")
                .font(.system(size: 32, weight: .bold))
                .padding(.top, 20)

            HStack(spacing: 12) {
                Button(action: { isHumanToPet = true }) {
                    Text("HUMAN")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(isHumanToPet ? .black : .gray)
                }

                Image(systemName: "arrow.left.arrow.right")
                    .font(.system(size: 18))
                    .foregroundColor(.black)

                Button(action: { isHumanToPet = false }) {
                    Text("PET")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(!isHumanToPet ? .black : .gray)
                }
            }

            HStack(spacing: 16) {
                if isRecording {
                    recordingCard
                } else {
                    speakCard
                }
                animalPicker
            }

            Image(selectedAnimal)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding(.top, 16)

            Spacer()
        }
        .padding(.horizontal, 20)
    }

    private var recordingCard: some View {
        VStack {
            Image(systemName: "waveform")
                .font(.system(size: 40))
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
                Image(systemName: "mic.fill")
                    .font(.system(size: 40))
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
        VStack {
            Button {
                selectedAnimal = "catExample"
            } label: {
                Image("catExample")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .background(
                        selectedAnimal == "catExample"
                        ? Color.blue.opacity(0.4)
                        : Color.clear
                    )
                    .cornerRadius(10)
            }

            Button {
                selectedAnimal = "dogExample"
            } label: {
                Image("dogExample")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .background(
                        selectedAnimal == "dogExample"
                        ? Color.green.opacity(0.4)
                        : Color.clear
                    )
                    .cornerRadius(10)
            }
        }
        .frame(width: 100, height: 160)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }

    private func startRecording() {
        isRecording = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isRecording = false
        }
    }
}

struct TranslatorView_Previews: PreviewProvider {
    static var previews: some View {
        TranslatorView()
    }
}
