//
//  CustomSegmentSwiftUIApp.swift
//  CustomSegmentSwiftUI
//
//  Created by Akash on 13/10/21.
//

import SwiftUI

@main
struct CustomSegmentSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            let arrayOfSegment = [ButtonSegmentDataModel.init(title: "Jobs"),
                                  ButtonSegmentDataModel.init(title: "Search", deafultIcon: "chincoteague", activeIcon: "searchAtLandingPage", iconPosition: .left, isSelected: true),
                                  ButtonSegmentDataModel.init(title: "Connect", deafultIcon: "umbagog",activeIcon: "stmarylake", iconPosition: .right),

            ]
        CustomSegmentedView(buttonTitlesArray: arrayOfSegment,tabHeight: 50, buttonTapActionClouser: { dataModel in
                debugPrint(dataModel.title)
        }).colorMultiply(.orange)
        }
    }
}
