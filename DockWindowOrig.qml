import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4

ColumnLayout {
    width: 320
    height: 300
    visible: true

    RowLayout {
        visible: true
        
        Slider {
            maximumValue: 255
            stepSize: 1
        }
        
        Button {
            text: Button
        }
    }
    
    RowLayout {
        visible: true
        
        MouseArea {
            anchors.fill: parent
            
            onClicked :console.debug("clicked")
            
        }
        
        Slider {
            maximumValue: 255
            stepSize: 1
        }
        
        Button {
            text: Button
            width: 30
            height: 30
        }
    }
    
}
