import QtQuick 2.10
import QtQuick.Controls 2.3

import "AddComponentToQml.js" as AddingScript

Item  {
    id: dockWindow
    visible: true
    width: 320
    height: 320
    
    Rectangle {
        id: tile
        width: 300
        height: 300
        color: "green"
        
        radius: 20
        
        Slider {
            id: slider
            x: 60
            y: 50
            value: 0.5
        }
        
        Dial {
            id: dial
            x: 132
            y: 108
            width: 56
            height: 53
        }
        
        TextField {
            id: textField
            x: 60
            y: 209
            text: qsTr("Text Field")
        }
    }
}
