import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.3
import "setPosition.js" as MyScript



Window {
    id: appWindow
    visible: true
    minimumWidth: 800
    minimumHeight: 800
    maximumHeight: 800
    maximumWidth: 800
    title: qsTr("The Chess")


    Image {
        id: image
        anchors.fill: parent
        source: "qrc:/i.jpeg"
        fillMode: Image.PreserveAspectFit
        z:0
         }

    Component.onCompleted: MyScript.createSpriteObjects()
    }




