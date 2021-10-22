# CustomSegmentSwiftUI <WIP>
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/sbertix/CollectionUI)
[![GitHub](https://img.shields.io/github/license/sbertix/CollectionUI)](https://github.com/sbertix/CollectionUI/blob/master/LICENSE)
<img src="https://img.shields.io/badge/supports-Swift%20Package%20Manager-ff69b4.svg">  

**CollectionUI** is a simple **SwiftUI** _wrapper_ for (simple) `UICollectionView`s.

## Installation
### Swift Package Manager (Xcode 11 and above)
1. Select `File`/`Swift Packages`/`Add Package Dependency…` from the menu.
1. Paste `https://github.com/sbertix/CollectionUI.git`.
1. Follow the steps.

## Usage
```swift
import SwiftUI
import CollectionUI

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
