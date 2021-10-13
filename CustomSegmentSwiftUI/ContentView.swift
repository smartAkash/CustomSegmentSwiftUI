//
//  ContentView.swift
//  CustomSegmentSwiftUI
//
//  Created by Akash on 13/10/21.
//

import SwiftUI

struct ButtonSegmentDataModel{
    // enum icon support
    enum EnumIconPosition: Int {
        case left, right, none
    }
    var title:String  // button title
    var deafultIcon:String? = nil  // default icon name inActive
    var activeIcon:String? = nil  // active or selected icon name active
    var iconPosition: EnumIconPosition = .none // default value none means not icon support
    var isSelected:Bool? = nil // is selected or not intial when create array
}

// CustomSegmentedView main container
struct CustomSegmentedView: View {
    
    var buttonTitlesArray: [ButtonSegmentDataModel] = [ButtonSegmentDataModel]() // This one for array of buttons to show in segmentview
    var tabHeight: CGFloat = 0 // This one used for set height of main segment container view
    let buttonTapActionClouser: (ButtonSegmentDataModel) -> Void
    
    // To get intial selected button index if we passed from out side
    private var getIndex: Int {
        var selectedRowIndex = 0
        if let index = self.buttonTitlesArray.firstIndex(where: {$0.isSelected == true}){
            selectedRowIndex = index
        }
        return selectedRowIndex
    }
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            ConfigureCustomSegment(buttonTitlesArray: buttonTitlesArray, selectedIndex: getIndex,frames: Array<CGRect>(repeating: .zero, count: buttonTitlesArray.count), buttonTapActionClouser: { selectedDataModel in
                buttonTapActionClouser(selectedDataModel)
            }).padding(.all, 5).background(Color.white)
        }).cornerRadius(tabHeight/2).padding(.leading, 20).padding(.trailing, 20).animation(.easeInOut)
    }
}

// ConfigureCustomSegment SegmentView Outer of buttons
struct ConfigureCustomSegment: View {
    
    var buttonTitlesArray: [ButtonSegmentDataModel] = [ButtonSegmentDataModel]() // This one for array of buttons to show in segmentview
    @State var selectedIndex = 0 // This used for store selected button index
    @State var frames: [CGRect] = [CGRect]()
    @State private var selectedIndexBackgroundColor = Color.blue // This will used for to set background color of button Capsule overlay and title color of button
    var buttonTapActionClouser: (ButtonSegmentDataModel) -> Void // This one used for when child clouser will call clouser to pass parent view to pass currecnt selected array of index
    
    var body: some View {
        ZStack{
            HStack(spacing: 0) {
                ForEach(Array(self.buttonTitlesArray.enumerated()), id: \.offset) { offset, item in
                    let buttonIndex = offset
                    
                    // Here we are prepared button and passing 3 things param
                    //1. button index
                    //2. data model,
                    //3. is selected that button or not
                    PreparedButtonForSegmentView(buttonIndex: buttonIndex, selectedDataModel: item, isSelectedButton: self.selectedIndex == buttonIndex) { (selectedIndex) in
                        self.selectedIndex = selectedIndex
                        self.buttonTapActionClouser(self.buttonTitlesArray[selectedIndex])
                    }
                    .foregroundColor(selectedIndexBackgroundColor)
                    .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 10))
                    .background(
                        // here we have called GeometryReader to set or store frame of current button in array of frames
                        GeometryReader { geo in Color.clear.onAppear { self.setFrame(index: buttonIndex, frame: geo.frame(in: .global)) }}
                    )
                }
            }
        }.background(
            Capsule().fill(
                selectedIndexBackgroundColor)
                .frame(width: self.frames[self.selectedIndex].width,
                       height: self.frames[self.selectedIndex].height, alignment: .topLeading)
                .offset(x: self.frames[self.selectedIndex].minX - self.frames[0].minX)
            , alignment: .leading
        )
    }
    
    // to store current buttons frame in array of frame we are storing becouse when get selected button to help us when we will add Capsule beckground at that this array of frame will needs actully buttons frame height and width
    private func setFrame(index: Int, frame: CGRect) {
        self.frames[index] = frame
    }
}

// Button configure for segmentView
struct PreparedButtonForSegmentView: View {
    
    var buttonIndex = 0 // this array of index
    var selectedDataModel: ButtonSegmentDataModel // this one for selected data model from where we will get info like title, icon, left,right support icon or not
    var isSelectedButton: Bool = false // this one to track current button is selected or not based on that will update color, title color, background color.
    var buttonActionClouser: (Int) -> Void // This one used for when button clicked will call clouser to pass parent view to pass currecnt selected array of index
    private let iconSize: CGFloat = 15 // This one for fix size width and height for icon display left or right
    private let lineLimit: Int = 1 // This one for fix button text limit of line
    
    var body : some View {
        Button(action: {
            self.buttonActionClouser(buttonIndex)
        }){
            // Here we are check icon support possition left, right or none
            let selectedColor = isSelectedButton ? Color.white : Color.blue
            switch selectedDataModel.iconPosition {
            case .none:
                // only title will set here
                Text(selectedDataModel.title).foregroundColor(selectedColor).lineLimit(lineLimit)
            case .left:
                // left icon and title will be set here
                if let iconInActiveName = selectedDataModel.deafultIcon, !iconInActiveName.isEmpty, let activeIcon = selectedDataModel.activeIcon, !activeIcon.isEmpty {
                    Image(isSelectedButton ? activeIcon : iconInActiveName).resizable().frame(width: iconSize, height: iconSize, alignment: .center)
                }
                Text(selectedDataModel.title).foregroundColor(selectedColor).lineLimit(lineLimit)
            case .right:
                // right icon and title will be set here
                Text(selectedDataModel.title).foregroundColor(selectedColor).lineLimit(lineLimit)
                if let iconInActiveName = selectedDataModel.deafultIcon, !iconInActiveName.isEmpty, let activeIcon = selectedDataModel.activeIcon, !activeIcon.isEmpty{
                    Image(isSelectedButton ? activeIcon : iconInActiveName).resizable().frame(width: iconSize, height: iconSize, alignment: .center)
                }
            }
        }
    }
}

struct CustomSegmentedPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.yellow
            let arrayOfSegment = [ButtonSegmentDataModel.init(title: "Jobs"),
                                  ButtonSegmentDataModel.init(title: "Search", deafultIcon: "searchAtLandingPage", iconPosition: .left),
                                  ButtonSegmentDataModel.init(title: "Connect", deafultIcon: "umbagog", iconPosition: .right)
            ]
            CustomSegmentedView(buttonTitlesArray: arrayOfSegment, tabHeight: 50, buttonTapActionClouser: { dataModel in
                debugPrint(dataModel.title)
            })
        }
    }
}
