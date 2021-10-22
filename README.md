# CustomSegmentSwiftUI <WIP>
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/sbertix/CollectionUI)
[![GitHub](https://img.shields.io/github/license/sbertix/CollectionUI)](https://github.com/sbertix/CollectionUI/blob/master/LICENSE)
<img src="https://img.shields.io/badge/supports-Swift%20Package%20Manager-ff69b4.svg">  

**CustomSegmentSwiftUI** is a simple **SwiftUI** _wrapper_ for (simple) `SegmentUI`s.

## Installation
### Swift Package Manager (Xcode 13 and above)
1. Select `File`/`Swift Packages`/`Add Package Dependency…` from the menu.
1. Paste `https://github.com/smartAkash/CustomSegmentSwiftUI.git`.
1. Follow the steps.

## Usage
```swift
import SwiftUI

/// A `View`.
struct ContentView : View {

    var body: some View {
            let arrayOfSegment = [ButtonSegmentDataModel.init(title: "Jobs"),
                                  ButtonSegmentDataModel.init(title: "Search", deafultIcon: "chincoteague", activeIcon: "searchAtLandingPage", iconPosition: .left, isSelected: true),
                                  ButtonSegmentDataModel.init(title: "Connect", deafultIcon: "umbagog",activeIcon: "stmarylake", iconPosition: .right),

            ]
        CustomSegmentedView(buttonTitlesArray: arrayOfSegment,tabHeight: 50, buttonTapActionClouser: { dataModel in
                debugPrint(dataModel.title)
        }).colorMultiply(.orange)
    }
}
```
<img width="227" alt="Screenshot 2021-10-22 at 4 14 25 PM" src="https://user-images.githubusercontent.com/18400249/138441213-4c7dd7ea-45d5-4e83-a129-08971f0a70f0.png">
<img width="238" alt="Screenshot 2021-10-22 at 4 14 32 PM" src="https://user-images.githubusercontent.com/18400249/138441219-8a22375f-d77e-44a8-84a2-feb2b4f3f0a1.png">
<img width="229" alt="Screenshot 2021-10-22 at 4 14 38 PM" src="https://user-images.githubusercontent.com/18400249/138441221-11293311-a40d-41b1-b452-9a0b9369bede.png">
