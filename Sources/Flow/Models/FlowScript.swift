//
//  FlowScript.swift
//
//
//  Created by lmcmz on 23/7/21.
//

import Foundation

extension Flow {
    struct Script: BytesHolder, Equatable {
        var bytes: [UInt8]
        var data: Data {
            return bytes.data
        }

        init(script: String) {
            bytes = script.data(using: .utf8)!.byteArray
        }

        init(data: Data) {
            bytes = data.byteArray
        }

        init(bytes: [UInt8]) {
            self.bytes = bytes
        }
    }

    struct ScriptResponse: BytesHolder, Equatable {
        var bytes: ByteArray
        var fields: Argument?

        init(bytes: ByteArray) {
            self.bytes = bytes
            fields = try? JSONDecoder().decode(Flow.Argument.self, from: bytes.data)
        }
    }
}
