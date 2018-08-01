import QtQuick 2.10
import QtQuick.Controls 2.3

Item {
    id: dockWindowTest
    visible: true
    width: 220
    height: 70
    
    Rectangle {
        id: tile
        width: 200
        height: 50
        color: "green"

        TextField {
            id: textField
            x: 0
            y: 0
            text: qsTr("Text Field")
        } 
    }
}
