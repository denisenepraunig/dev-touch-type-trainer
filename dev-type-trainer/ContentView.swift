//
//  ContentView.swift
//  dev-type-trainer
//
//  Created by Denise Nepraunig on 05.04.21.
//

import SwiftUI

struct ContentView: View {
    @State private var fingerIndex = 0
    @State private var character: Character = "["
    @State var shiftKey = false

    @State var previousCharacter: Character = " "
    @State var previousFinger: Int?

    enum FingerNames: Int, CaseIterable {
        case rightPinky = 0
        case rightRingFinger
        case rightMiddleFinger
        case rightIndexFinger
        case leftIndexFinger
        case leftMiddleFinger
        case leftRingFinger
        case leftPinky
    }

    let colorMatcher: [Int: Color] = [
        0: .blue,
        1: .green,
        2: .yellow,
        3: .orange,
        4: .orange,
        5: .yellow,
        6: .green,
        7: .blue
    ]

//    let fingerCharacter: [FingerNames: [Character]] = [
//        .rightPinky: ["`", "~", "1", "!"],
//        .rightRingFinger: ["2", "@"],
//        .rightMiddleFinger: ["3", "#"],
//        .rightIndexFinger: ["4", "$", "5", "%"],
//        .leftIndexFinger: ["6", "^", "7", "&"],
//            .leftMiddleFinger: ["8", "*", ",", "<"],
//        .leftRingFinger: ["9", "(", ".", ">"],
//        .leftPinky: ["0", ")", "-", "_", "=", "+", "[", "{", "]", "}", "\\", "|", ";", ":", "'", "\"", "/", "?"]
//    ]

    let fingerCharactersShift: [FingerNames: [(Character, Bool)]] = [
        .rightPinky: [
            ("`", false),
            ("~", true),
            ("1", false),
            ("!", false)],
        .rightRingFinger: [
            ("2", false),
            ("@", true)],
        .rightMiddleFinger: [
            ("3", false),
            ("#", true)],
        .rightIndexFinger: [
            ("4", false),
            ("$", true),
            ("5", false),
            ("%", true)],
        .leftIndexFinger: [
            ("6", false),
            ("^", true),
            ("7", false),
            ("&", true)],
        .leftMiddleFinger: [
            ("8", false),
            ("*", true),
            (",", false),
            ("<", true)],
        .leftRingFinger: [
            ("9", false),
            ("(", true),
            (".", false),
            (">", true)],
        .leftPinky: [
            ("0", false),
            (")", true),
            ("-", false),
            ("_", true),
            ("=", false),
            ("+", true),
            ("[", false),
            ("{", true),
            ("]", false),
            ("}", true),
            ("\\", false),
            ("|", true),
            (";", false),
            (":", true),
            ("'", false),
            ("\"", true),
            ("/", false),
            ("?", true)]
    ]

    private func generateRandomCharacter() {
        let fingerAndValues = fingerCharactersShift.randomElement()
        let finger = fingerAndValues!.key
        let characterAndShift = fingerAndValues!.value.randomElement()!
        let newCharacter = characterAndShift.0

        // not the same finger again
        if previousFinger == finger.rawValue {
            print("same finger!!")
            generateRandomCharacter()
            return
        }

        character = newCharacter
        fingerIndex = finger.rawValue
        shiftKey = characterAndShift.1

        previousCharacter = character
        previousFinger = fingerIndex
    }

//    let symbols: [Character] = ["[", "]", "{", "}", "=", "+", ",", "<", ".", ">", "/", "?", "-", "_", "!", "\\", "|", ";", ":", "\"", "\'", "@", "#", "$", "%", "&", "*", "(", ")", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]

    let hints: [Character: String] = [
        "~": "tilde",
//        "!": "1",
//        "@": "2",
//        "#": "3",
//        "$": "4",
//        "%": "5",
        "^": "circumflex",
//        "&": "7",
//        "*": "8",
//        "(": "9",
//        ")": "0",
        "_": "underscore",
        "-": "minus",
        "`": "backtick",
        "'": "single quote",
        "\"": "double quote",
        ",": "comma",
        ".": "dot",
        "/": "slash",
        "\\": "backslash",
        "|": "pipe",
        ":": "colon",
        ";": "semicolon"
    ]

    var hintText: String {
        hints[character] ?? " "
    }

    func colorForCircle(index: Int) -> Color {
        if index == fingerIndex {
            return colorMatcher[index] ?? Color.clear
        } else {
            return Color.clear
        }
    }

    var body: some View {
        VStack {
            Text("Dev Touch Type Trainer")
                .font(.title    )
                .padding()

            Text(String(character))
                .font(.largeTitle)
                .padding()
                .foregroundColor(.purple )

            Text(hintText)
                .padding()

            Button(String(character), action: {
                generateRandomCharacter()
            })
            // we don't want to see that button, we just want it's modifier keys
            .opacity(0)
            .keyboardShortcut(KeyEquivalent(character), modifiers: [])

            HStack {
                ForEach(0..<8) { index in
                    if index == 4 {
                        shiftKeyView
                    }
                    Circle()
                        .strokeBorder(Color.gray, lineWidth: 1)
                        .background(Circle().foregroundColor(colorForCircle(index: index)))
                        .frame(width: 20, height: 20)
                }
            }
            .padding()
        }
        .frame(minWidth: 400, idealWidth: 400, maxWidth: 400, minHeight: 400, idealHeight: 400, maxHeight: 400, alignment: .center)
        .onAppear {
            generateRandomCharacter()
        }
    }

    private var shiftKeyView: some View {
        RoundedRectangle(cornerRadius: 4)
            .strokeBorder(Color.gray, lineWidth: 1)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(shiftKey ? Color.gray.opacity(0.5) : Color.clear))
            .overlay(
                Text("SHIFT")
                    .font(.footnote)
                    .foregroundColor(shiftKey ? .white : .gray)
            )
            .frame(width: 60, height: 20)
            .padding(.horizontal)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(previousFinger: 0)
    }
}
