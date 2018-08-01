import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

import "AddComponentToQml.js" as AddingScript


Item {
    id: rootPanelWrapperUndocked
    
    // obsahuje Item ktory sa priradi pri vytvarani delegate
    default property Item contentItem
    property Item draggedItemParent
    property string contentItemName
    
    Component.onCompleted: {
        AddingScript.createPanel(contentItemName, rootPanelWrapperUndocked, 0, 0)
    }
 
    // velkost je prisposobena obsahujucemu Itemu
    width: contentItem.width
    height: contentItem.height
    
    // priradeny item vlozime pod contentItemWrapper
    onContentItemChanged: {
        contentItem.parent = contentItemWrapperUndocked;
    }
    
    Rectangle {
        id: contentItemWrapperUndocked
        anchors.fill: parent
        
        Drag.active: dragAreaUndocked.drag.active
        Drag.hotSpot {
                   x: contentItem.width / 2
                   y: contentItem.height / 2
        }
    
        MouseArea {
            id: dragAreaUndocked
            anchors.fill: parent
            
            drag.target: parent     
            
            onReleased: {
                if(drag.active) {
                    console.debug("emitchangePanelDockPosition()");
                    console.debug("onRelased: " + mouseX + ":" + mouseY)
                    emitchangePanelDockPosition();
                }
            }
//            onPositionChanged: console.debug("onPositionChanged: " + mouseX + ":" + mouseY)
        }
    }
    
    states: State {
        when: dragAreaUndocked.drag.active
        
        ParentChange {
            target: contentItemWrapperUndocked
            parent: draggedItemParent
        }
        PropertyChanges {
            target: contentItemWrapperUndocked
            opacity: 0.9
            anchors.fill: undefined
            width: contentItem.width
            height: contentItem.height
        }
        PropertyChanges {
            target: rootPanelWrapperUndocked
            height: 0
        }                                                                   
    }  
    
//    Loader {
//           id: topDropAreaLoaderUndocked
//           active: model.index === 0
//           anchors {
//               left: parent.left
//               right: parent.right
//               bottom: rootPanelWrapper.verticalCenter
//           }
//           height: contentItem.height
//           sourceComponent: Component {
//               DraggableItemDropArea {
//                   dropIndex: 0
//               }
//           }
//    }
   
//   DraggableItemDropArea {
//       anchors {
//           left: parent.left
//           right: parent.right
//           top: rootPanelWrapper.verticalCenter
//       }
//       height: contentItem.height
//       dropIndex: model.index + 1
//   }          
}
