//
//  FileManager.swift
//  IMKitSample
//
//  Created by 강우현 on 11/27/25.
//

import Foundation

class KeyboardFileManager {
    static let shared = KeyboardFileManager()
    private let fileManager = FileManager.default
    private let appGroupName = "group.com.WoohyunKang.HangulInput"
    
    private func sharedContainerURL() -> URL? {
        return fileManager.containerURL(forSecurityApplicationGroupIdentifier: appGroupName)
    }
    
    private func userKeyboardsDirectoryURL() -> URL? {
        guard let sharedURL = sharedContainerURL() else {
            NSLog("Could not find user keyboard data directory.")
            return nil
        }
        return sharedURL.appendingPathComponent("UserKeyboards")
    }
    
    func save(keyboard: Keyboard) throws {
        guard let directoryURL = userKeyboardsDirectoryURL() else { return }
        
        if !fileManager.fileExists(atPath: directoryURL.path) {
            do {
                print("Trying to create directory...")
                try fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true, attributes: nil)
                print("done")
            } catch {
                NSLog("Failed: \(error.localizedDescription)")
            }
        }
        
        let fileURL = directoryURL.appendingPathComponent("\(keyboard.id).json")
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted // 읽기 편하게 저장
        let data = try encoder.encode(keyboard)
        
        try data.write(to: fileURL)
    }
    
    func loadUserKeyboardsList() -> [String] {
        guard let directoryURL = userKeyboardsDirectoryURL(),
              let fileURLs = try? fileManager.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil) else {
            return []
        }
        
        var names: [String] = []
        let decoder = JSONDecoder()
        
        for fileURL in fileURLs where fileURL.pathExtension == "json" {
//            print(fileURL)
            if let data = try? Data(contentsOf: fileURL),
               let keyboard = try? decoder.decode(Keyboard.self, from: data) {
                guard keyboard.id == fileURL.lastPathComponent.split(separator: ".").first! else {
                    NSLog("Warning: File \"\(fileURL.lastPathComponent)\" has a different keyboard ID \"\(keyboard.id)\" than its filename (ignoring)")
                    continue
                }
                names.append(keyboard.id)
            }
        }
        return names
    }
    
    func loadUserKeyboard(from fileName: String) -> Keyboard? {
        guard let directoryURL = userKeyboardsDirectoryURL() else {
            NSLog("Error: Could not access keyboard data directory.")
            return nil
        }
        
        let fileURL = directoryURL.appendingPathComponent(fileName + ".json")
        
        guard fileManager.fileExists(atPath: fileURL.path) else {
            NSLog("Error: File \"\(fileName).json\" not found.")
            return nil
        }
        
        let decoder = JSONDecoder()
        if let data = try? Data(contentsOf: fileURL),
           let keyboard = try? decoder.decode(Keyboard.self, from: data) {
            return keyboard
        } else {
            NSLog("Error: File \"\(fileName)\" could not be parsed.")
            return nil
        }
    }
}

extension UserDefaults {
    static var shared: UserDefaults? {
        return UserDefaults(suiteName: "group.com.WoohuynKang.HangulInput") // App Group ID로 변경
    }
}
