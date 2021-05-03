//
//  ModeoStructs.swift
//  pomodoro_1
//
//  Created by X Y on 5/3/21.
//

import Foundation
import Foundation

/// There are two types of time intervals:
///   1. Pomodoro: working on a task for 25 minutes without interruptions
///   2. Break: 5 minutes
enum IntervalType {
    case pomodoro
    case breakInterval
}

/// Timer Status
enum CycleStatus: String{
    case breakStatus = "Taking a break"
    case active = "Pomodoro in session, do not disturb"
    case restart = "Ready to work"
    case pause = "Timer paused"
}
