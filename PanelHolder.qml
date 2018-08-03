import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Window 2.3

import "AddComponentToQml.js" as AddingScript

Rectangle {
    id: panelHolder
    visible: true
    width: 320
    height: 320
    
    property string type: "panel"
    
    // pri vytvoreni sa pomocou JS prida panel podla property type ktoru zadavme pri vytvarani
    Component.onCompleted: {
        console.debug("onComplete AddComponent: " + type);
        if(type === "panel") {
            return;
        }
        AddingScript.createPanel(type, panelHolder);
    }
    
}
