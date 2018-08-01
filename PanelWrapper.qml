import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Item {
    id: rootPanelWrapper
    
    // obsahuje Item ktory sa priradi pri vytvarani delegate
    default property Item contentItem
    // obsahuje parenta contentu pri dragu
    property Item draggedItemParent
    // obsahuje meno panelu ktory obsahuje
    property string contentItemName
    
    // signal volame pri pohybe panelu v docku
    signal changePanelDockPosition(int from, int to)
    signal undockPanel(int undockIndex,int undockX, int undockY, string undockItem)
    
    // velkost je prisposobena obsahujucemu Itemu
    width: contentItem.width
    height: contentItem.height
    
    // priradeny item vlozime pod contentItemWrapper
    onContentItemChanged: {
        contentItem.parent = contentItemWrapper;
    }
        
    // sluzi ako wrapper pre panel + pridava mouseArea pre drag preto samotny panelHolder ho neobsahuje
    Rectangle {
        id: contentItemWrapper
        anchors.fill: parent
        
        Drag.active: dragArea.drag.active
        Drag.hotSpot {
                   x: contentItem.width / 2
                   y: contentItem.height / 2
        }
    
        MouseArea {
            id: dragArea
            anchors.fill: parent
            
            drag.target: parent     
            onReleased: {
                if(drag.active) {
                    console.debug("emitchangePanelDockPosition()");
                    console.debug("onRelased: " + mouseX + ":" + mouseY)
                    // po dragovani spustime signal
                    emitchangePanelDockPosition();
                }
            }
        }
    }
    
    // ak drag zacne tak:
    states: State {
        when: dragArea.drag.active
        
        // zmenime parenta na cely dock
        ParentChange {
            target: contentItemWrapper
            parent: draggedItemParent
        }
        // znizime priehladnost a rozmery prisposobime tahanemu objektu
        PropertyChanges {
            target: contentItemWrapper
            opacity: 0.9
            anchors.fill: undefined
            width: contentItem.width
            height: contentItem.height
        }
        // wrapper nechame zmiznut
        PropertyChanges {
            target: rootPanelWrapper
            height: 0
        }                                                                   
    }  
    
    // sluzi na dynamicke pridavanie komponentov
    Loader {
           id: topDropAreaLoader
           active: model.index === 0
           anchors {
               left: parent.left
               right: parent.right
               bottom: rootPanelWrapper.verticalCenter
           }
           height: contentItem.height
           sourceComponent: Component {
               DraggableItemDropArea {
                   dropIndex: 0
               }
           }
    }
   
   DraggableItemDropArea {
       anchors {
           left: parent.left
           right: parent.right
           top: rootPanelWrapper.verticalCenter
       }
       height: contentItem.height
       dropIndex: model.index + 1
   }
   
   function emitchangePanelDockPosition() {
       var dropArea = contentItemWrapper.Drag.target;
       if (!dropArea) {    
           return;
       }
       
       // ak panel potiahneme na plochu pre volny pohyb volame signal na oddokovanie
       if( dropArea === rootWindowDropArea) {
           rootPanelWrapper.undockPanel(model.index, dragArea.mouseX, dragArea.mouseY, contentItemName);
           contentItemWrapper.parent = rootWindowDropArea;
           return;
       }

       var dropIndex = dropArea.dropIndex;

       // If the target item is below us, then decrement dropIndex because the target item is going to move up when
       // our item leaves its place
       if (model.index < dropIndex) {
           dropIndex--;
       }
       if (model.index === dropIndex) {
           console.debug("Model index( " + model.index + ")" + " == drop index");
           return;
       }
       console.debug("Model index: " + model.index);
       rootPanelWrapper.changePanelDockPosition(model.index, dropIndex);
    }          
}
