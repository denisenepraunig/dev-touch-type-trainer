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

let fingerCharactersShift: [FingerNames: [(Character, Bool)]] = [
    .rightPinky: [
        ("`", false),
        ("~", true),
        ("1", false),
        ("!", true)],
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

// https://www.prepressure.com/fonts/basics/character-names
let charachterHints: [Character: String] = [
    /* small symbols */
    "~": "tilde",
    "^": "circumflex" /* caret ?! */,
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
    ";": "semicolon",

    "1": "one",
    "2": "two",
    "3": "three",
    "4": "four",
    "5": "five",
    "6": "six",
    "7": "seven",
    "8": "eight",
    "9": "nine",
    "0": "zero",

    "!": "exclamation mark",
    "?": "question mark",
    "@": "at",
    "#": "hash" /* or pound ?!*/,
    "$": "dollar",
    "%": "percent",
    "&": "ampersand",

    "*": "multiplication",
    "=": "equal",
    "+": "plus",

    "(": "left parenthesis",
    ")": "right parenthesis",
    "{": "left curly bracket",
    "}": "right curly bracket",
    "[": "left bracket",
    "]": "right bracket",

    "<": "smaller than",
    ">": "greater than"
]
