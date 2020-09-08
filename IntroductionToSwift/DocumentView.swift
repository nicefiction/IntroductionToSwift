//
//  DocumentView.swift
//  IntroductionToSwift
//
//  Created by Olivier Van hamme on 08/09/2020.
//  Copyright © 2020 nicefiction. All rights reserved.
//

import SwiftUI

struct DocumentView: View {
    var document: UIDocument
    var dismiss: () -> Void

    var body: some View {
        VStack {
            HStack {
                Text("File Name")
                    .foregroundColor(.secondary)

                Text(document.fileURL.lastPathComponent)
            }

            Button("Done", action: dismiss)
        }
    }
}
