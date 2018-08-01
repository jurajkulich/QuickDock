import QtQuick 2.11
import QtQuick.Controls 2.4

Item {
    id: dockWindow
    visible: true
    width: 320
    height: 640
    
    MouseArea {
        id: dockWindowMouseArea
        width: 320
        height: 640
        anchors.fill: parent
        
        drag.target: tile
        
        onReleased: parent = tile.Drag.target !== null ? tile.Drag.target : dockWindow
        
        Rectangle {
            width: 320
            height: 640
            id: tile
            
            Drag.active: dockWindowMouseArea.drag.active
            
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
}
