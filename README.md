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
<img width="260" alt="Screenshot 2021-10-22 at 4 11 53 PM" src="https://user-images.githubusercontent.com/18400249/138440888-9dbb6429-0af5-4c30-afaa-0bb562e04bfc.png">
<img width="248" alt="Screenshot 2021-10-22 at 4 12 39 PM" src="https://user-images.githubusercontent.com/18400249/138440974-640afd8b-a20f-4d24-996e-fdc88676370f.png">
<img width="242" alt="Screenshot 2021-10-22 at 4 12 45 PM" src="https://user-images.githubusercontent.com/18400249/138440988-2610b8e5-ffd5-4c76-8283-32cef0d2fe39.png">
