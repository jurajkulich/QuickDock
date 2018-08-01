import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Window 2.10

// zobrazuje maly obldznik ktory naznacuje kam mozeme presunut panel v docku
DropArea {
    id: draggableItemDropArea
    property int dropIndex

    Rectangle {
        id: dropIndicator
        anchors {
            left: parent.left
            right: parent.right
            top: dropIndex === 0 ? parent.verticalCenter : undefined
            bottom: dropIndex === 0 ? undefined : parent.verticalCenter
        }
        height: 2
        opacity: draggableItemDropArea.containsDrag ? 0.8 : 0.0
        color: "black"
    }
}
