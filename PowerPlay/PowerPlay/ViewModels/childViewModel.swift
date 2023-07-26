//
//  childViewModel.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/21/23.
//

import Foundation
import AVFoundation

class ChildViewData: ObservableObject{
    @Published var isToggleOn = false
}

enum TextToSpeechError: Error {
    case invalidURL
}

func convertTextToSpeechStream(text: String, apiKey: String) -> Data? {
    let urlString = "https://api.elevenlabs.io/v1/text-to-speech/EXAVITQu4vr4xnSDxMaL/stream"

    guard let url = URL(string: urlString) else {
        print("Invalid URL")
        exit(1)
    }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"

    let headers: [String: String] = [
        "Accept": "audio/mpeg",
        "Content-Type": "application/json",
        "xi-api-key": apiKey
    ]
    request.allHTTPHeaderFields = headers

    let parameters: [String: Any] = [
        "text": text,
        "model_id": "eleven_monolingual_v1",
        "voice_settings": [
            "stability": 0.5,
            "similarity_boost": 0.5
        ]
    ]

    do {
        request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
    } catch {
        print("Error creating JSON data: \(error)")
        return nil
    }
    
    var audioData: Data?

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error: \(error)")
            return
        }

        guard let httpResponse = response as? HTTPURLResponse else {
            print("Invalid response")
            return
        }

        if httpResponse.statusCode == 200, let data = data {
            print(data)
            audioData = data
        } else {
            print("Unexpected response or empty data")
        }
    }
    
    task.resume()
    
    while task.state == .running {
        sleep(1)
    }
    
    
    return audioData
}

func playAudio(data: Data) {
    do {
        print(data)
        let audioPlayer = try AVAudioPlayer(data: data, fileTypeHint: "mp3")
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    } catch {
        print("Error playing audio: \(error.localizedDescription)")
    }
}

