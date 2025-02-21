# Pet Translator iOS App

This iOS application built with **SwiftUI** that simulates a “pet translator” experience.

## Overview

- The **Translator** screen allows the user to start recording speech (with a microphone button), simulates a recording process, and then shows a mock translation result.  
- The **Clicker** screen displays various settings (Rate Us, Share App, Contact Us, etc.) in a list-like format.
  
![IMG_7708](https://github.com/user-attachments/assets/a2103269-ffa8-404d-aa77-0510a3309c27)
![IMG_7710](https://github.com/user-attachments/assets/82706b72-379e-4399-ad1e-0a7f64a26d02)
![IMG_7711](https://github.com/user-attachments/assets/202a8afa-5317-4045-81a2-6c351165becc)




## Requirements

- **Xcode 14** or later  
- **iOS 14** or later  
- **Swift 5**  
- **SwiftUI**  

## Installation & Setup

1. Clone or download this repository.  
2. Open the project in Xcode (`PetTranslator.xcodeproj`).  
3. Select an iOS simulator or a real device.  
4. Build and run the project (`Cmd + R` in Xcode).

## Project Structure


- **PetTranslatorApp.swift**: The entry point of the app.  
- **ContentView.swift**: Contains a custom bottom navigation bar with two main tabs (Translator & Clicker).  
- **TranslatorView.swift**: The main screen for recording and simulating a pet translation.  
- **ResultView.swift**: Displays the mock translation result after the recording process.  
- **ClickerView.swift**: Shows the settings list (Rate Us, Share, etc.).  

## Usage

1. Launch the app.  
2. Tap on **Translator** to access the main translator screen.  
3. Press **Start Speak** to simulate recording; after a few seconds, it will automatically navigate to a “translating” process and then display a **Result** screen.  
4. Return to the main screen or switch to **Clicker** to view the settings page.  

## Example Code Snippet

```swift
import SwiftUI

struct TranslatorView: View {
    @State private var isRecording = false
    
    var body: some View {
        VStack {
            Text("Translator")
                .font(.largeTitle)
            if isRecording {
                Text("Recording...")
            } else {
                Button("Start Speak") {
                    startRecording()
                }
            }
        }
    }
    
    func startRecording() {
        isRecording = true
        // Simulate a 3-second recording
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isRecording = false
            // Navigate to the Result screen...
        }
    }
}
