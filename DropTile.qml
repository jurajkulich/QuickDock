import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Window 2.10
import QtQuick.Controls 2.3
    
    
Item {
    id: dropArea
    width: 200
    height: 200
    
    Rectangle {
        id: dropRectangle
        anchors.fill: parent
        color: "red"
        /*
        states: State {
            when: dropArea.containsDrag
            PropertyChanges {
                target: dropRectangle
                color: "grey"
                
            }
        }
        */
    }
}

