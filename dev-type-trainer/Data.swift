//
//  Data.swift
//  dev-type-trainer
//
//  Created by Denise Nepraunig on 05.04.21.
//

import Foundation
import SwiftUI

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

let plainColorMatcher: [Int: Color] = [
    0: .purple,
    1: .purple,
    2: .purple,
    3: .purple,
    4: .purple,
    5: .purple,
    6: .purple,
    7: .purple
]

let fingerMatcher: [Int: String] = [
    0: "P",
    1: "R",
    2: "M",
    3: "I",
    4: "I",
    5: "M",
    6: "R",
    7: "P"
]

// https://www.prepressure.com/fonts/basics/character-names

// if the shift key or another key is pressed can be different in differnt keyboard layouts
// needs to be refactored in the future

// current US Layout QWERTY
let fingerCharactersShift: [FingerNames: [(Character, Bool, String)]] = [
    .rightPinky: [
        ("`", false, "backtick"),
        ("~", true, "tilde"),
        ("1", false, "one"),
        ("!", true, "exclamation mark"),
        ("2", false, "two"),
        ("@", true, "at")],
    .rightRingFinger: [
        ("3", false, "three"),
        ("#", true, "hash")],
    .rightMiddleFinger: [
        ("4", false, "four"),
        ("$", true, "dollar"),],
    .rightIndexFinger: [
        ("5", false, "five"),
        ("%", true, "percent"),
        ("6", false, "six"),
        ("^", true, "caret"), /* circumflex */],
    .leftIndexFinger: [
        ("7", false, "seven"),
        ("&", true, "ampersand")],
    .leftMiddleFinger: [
        ("8", false, "eight"),
        ("*", true, "multiplication"),
        (",", false, "comma"),
        ("<", true, "smaller than")],
    .leftRingFinger: [
        ("9", false, "nine"),
        ("(", true, "left parenthesis"),
        (".", false, "dot"),
        (">", true, "greater than")],
    .leftPinky: [
        ("0", false, "zero"),
        (")", true, "right parenthesis"),
        ("-", false, "minus"),
        ("_", true, "underscore"),
        ("=", false, "equal"),
        ("+", true, "plus"),
        ("[", false, "left bracket"),
        ("{", true, "left curly bracket"),
        ("]", false, "right bracket"),
        ("}", true, "right curly bracket"),
        ("\\", false, "backslash"),
        ("|", true, "pipe"),
        (";", false, "semicolon"),
        (":", true, "colon"),
        ("'", false, "single quote"),
        ("\"", true, "double quote"),
        ("/", false, "slash"),
        ("?", true, "question mark")]
]
