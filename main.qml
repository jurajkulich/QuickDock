import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQml.Models 2.3

import "AddComponentToQml.js" as AddingScript

Window {
    id: rootWindow
    visible: true
    width: 860 //640
    height: 640 //480
    title: qsTr("Hello World")
    
    // RowLayout sluzi na rozdelenie obrazovky na dock a plochu pre volny pohyb panelu
    RowLayout {
        id: rootRowLayout
        anchors.fill: parent
        
        Rectangle {
            id: rootWindowItem
            Layout.fillWidth: true 
            color: "black"
            width: rootWindow.width - rootItem.width
            height: rootWindow.height
            
            DropArea {
                id: rootWindowDropArea
                anchors.fill: parent
                
                onEntered: console.debug("onEntered: rootWindowItem")
                
                states: State {
                    when: rootWindowDropArea.containsDrag
                    PropertyChanges {
                        target: rootWindowItem
                        color: "orange"
                    }
                }
            }
        }
        
        // dock
        Item {
            id: rootItem
            width: 400
            height: 640
            Layout.fillWidth: true
            Layout.minimumWidth: 100
            Layout.preferredWidth: 200
            // scaleuje itemy pri resize okna
            transform: [
                Scale {
                    id: scale
                    xScale: yScale
                    yScale: Math.min(rootWindow.width/rootItem.width,
                                     rootWindow.height/rootItem.height)},
                Translate {
    //                x: (rootWindow.width-rootItem.width*scale.xScale) /2;
                    y: (rootWindow.height-rootItem.height*scale.yScale) /2;
                }
    
            ]
    
            ListView {
                id: dockListView
                width: 200
                height: parent.height  
           
                //  v modeli zadefinujeme nazvy panelov
                model: 
                ListModel {
                        id: myModel
                        ListElement {
                            text: "DockWindow"
                        }
                        ListElement {
                            text: "DropTile"
                        }
                        ListElement {
                            text: "DockWindowTest"
                        }
    
                        ListElement {
                            text: "DropTile"
                        }
                }
                // delegate sluzi na zobrazovanie prvkov modelu
                delegate: PanelWrapper {
                    id: listViewItemWrapper
                    // pri pohybe panelu v docku sa zmeni parent z wrappera na item docku
                    draggedItemParent: rootItem 
                    // tu priradime wrapperu do propery nazov modelu - ten urci ktory panel sa dynamicky vytvori
                    contentItemName: model.text
                    
                    // vytvorime panel holder s argumentom type v ktorom sa dynamicky vytvori dany panel
                    PanelHolder { type: model.text }
                    
                    // signal ktory posuva itemy v docku
                    onChangePanelDockPosition: {
                        console.debug("onChangePanelDockPosition")
                        myModel.move(from, to, 1);
                    }
                    
                    // tuto by bolo dobre dokoncit nejako normalne undock :(
                    onUndockPanel: { 
//                        myModel.remove(undockIndex)
//                        AddingScript.createPanel("PanelHolderUndocked", rootWindowItem, undockX, undockY, undockItem)
                        console.debug("onUndockPanel: " + undockItem)
                    }
                }                      
            }     
        }
        
    }
}
