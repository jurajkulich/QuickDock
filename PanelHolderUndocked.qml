import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Window 2.3

import "AddComponentToQml.js" as AddingScript

Rectangle {
    id: panelHolderUndocked
    visible: true
    width: 320
    height: 320
    
    signal addToListView(string name)
    property string type: "panel"
    
    Component.onCompleted: {
        console.debug("onComplete AddComponent: " + type);
        if(type === "panel") {
            return;
        }
        AddingScript.createPanel(type, panelHolderUndocked);
        console.debug("AddingScript:" + AddingScript.panel);
    }
    
     
    Drag.active: dragAreaUndocked.drag.active
    
    Drag.hotSpot {
               x: contentItem.width / 4
               y: contentItem.height / 4
    }
    
   
    MouseArea {
        id: dragAreaUndocked
        anchors.fill: parent
        drag.target: parent       
        
        drag.onTargetChanged: console.debug("onTargetChanged")
    }
    
}
