//
//  ContentView.swift
//  dev-type-trainer
//
//  Created by Denise Nepraunig on 05.04.21.
//

import SwiftUI

struct ContentView: View {
    @State private var fingerIndex = 0
    @State private var character: Character = " "
    @State var shiftKey = false
    @State var characterHint = " "

    @State var previousCharacter: Character = " "
    @State var previousFinger: Int?

    private func generateRandomCharacter() {
        // .0, .1 and .2 could be a better data structure
        // but it was faster when prototyping :-)

        let fingerAndValues = fingerCharactersShift.randomElement()
        let finger = fingerAndValues!.key
        let characterEntry = fingerAndValues!.value.randomElement()!
        let newCharacter = characterEntry.0

        // not the same finger again
        if previousFinger == finger.rawValue {
            generateRandomCharacter()
            return
        }

        character = newCharacter
        fingerIndex = finger.rawValue
        shiftKey = characterEntry.1
        characterHint = characterEntry.2

        previousCharacter = character
        previousFinger = fingerIndex
    }

    var body: some View {
        VStack {
            VStack {
                Text("Dev Touch Type Trainer")
                    .font(.title)

                Text("QWERTY US Layout")
                    .font(.footnote)
                    .padding(.top)
            }
            .padding()

            Text(String(character))
                .font(.largeTitle)
                .scaleEffect(1.5)
                .padding()
                .foregroundColor(.purple)
                .frame(minWidth: 75, minHeight: 75)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.purple, lineWidth: 2)
                )

            Text(characterHint)
                .font(.title3)
                .padding()

            HStack {
                HandView(from: 0, to: 4, text: "Left Hand", fingerIndex: $fingerIndex)
                // maybe a geometry reader here for the height?!
                Rectangle()
                    .frame(width: 1, height: 50)
                    .foregroundColor(.gray)
                    .padding()
                HandView(from: 4, to: 8, text: "Right Hand", fingerIndex: $fingerIndex)

            }
            .padding()

            shiftKeyView

            Button(String(character), action: {
                generateRandomCharacter()
            })
            // we don't want to see that button, we just want it's modifier keys
            .opacity(0)
            .keyboardShortcut(KeyEquivalent(character), modifiers: [])
        }
        .frame(minWidth: 400, idealWidth: 400, maxWidth: 400, minHeight: 500, idealHeight: 500, maxHeight: 500, alignment: .center)
        .onAppear {
            generateRandomCharacter()
        }
    }

    struct HandView: View {
        var from: Int
        var to: Int
        var text: String
        @Binding var fingerIndex: Int

        var body: some View {
            VStack {
                HStack {
                    ForEach(from..<to) { index in
                        FingerCircleView(index: index, fingerIndex: $fingerIndex)
                    }
                }
                Text(text)
            }
        }
    }

    struct FingerCircleView: View {
        var index: Int
        @Binding var fingerIndex: Int

        func colorForCircle(index: Int) -> Color {
            if index == fingerIndex {
                return plainColorMatcher[index] ?? Color.clear
//                return colorMatcher[index] ?? Color.clear
            } else {
                return Color.clear
            }
        }

        func colorForText(index: Int) -> Color {
            return index == fingerIndex ? Color.black : Color.gray
        }

        func textForCircle(index: Int) -> String {
            return fingerMatcher[index] ?? ""
        }

        func strokeColorForCircle(index: Int) -> Color {
            return index == fingerIndex ? Color.clear : Color.gray
        }

        var body: some View {
            Circle()
                .strokeBorder(strokeColorForCircle(index: index), lineWidth: 1)
                .background(Circle().foregroundColor(colorForCircle(index: index)))
                .frame(width: 25, height: 25)
                .overlay(
                    Text(textForCircle(index: index))
                        .foregroundColor(colorForText(index: index))
                )
        }
    }
    private var shiftKeyView: some View {

        func colorForRectangle() -> Color {
            if shiftKey {
                return plainColorMatcher[fingerIndex] ?? Color.clear
//                return colorMatcher[fingerIndex] ?? Color.clear
            } else {
                return Color.clear
            }
        }

        return RoundedRectangle(cornerRadius: 4)
            .strokeBorder(shiftKey ? Color.clear : Color.gray, lineWidth: 1)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(colorForRectangle())
            )
            .overlay(
                Text("SHIFT")
                    .font(.footnote)
                    .foregroundColor(shiftKey ? .black : .gray)
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
