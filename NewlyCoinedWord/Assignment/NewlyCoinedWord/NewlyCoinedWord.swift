//
//  NewlyCoinedWord.swift
//  NewlyCoinedWord
//
//  Created by 박태현 on 2023/07/25.
//

import Foundation

enum NewlyCoinedWord: String, CaseIterable {
    case 반모
    case 세최미
    case 사바사
    case 오운완
    case 햄최몇
    case 알잘딱깔센
}

extension NewlyCoinedWord {
    var description: String {
        switch self {
        case .반모: return "반역모의"
        case .세최미: return "세계 최고 미드라이너"
        case .사바사: return "사람 바이 사람"
        case .오운완: return "오늘 운동 완료"
        case .햄최몇: return "햄버거 최대 몇개"
        case .알잘딱깔센: return "알아서 잘 딱 깔끔하게 센스있게"
        }
    }
}
