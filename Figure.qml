import QtQuick 2.0
import "setPosition.js" as Move

Image {
    id: figure

    property int boardX
    property int boardY

    property int newX:boardX
    property int newY:boardY


    property string color: "white"
    property int type: 0

    QtObject {
        id: _
        property var sources:
            [[, "hw.png", "ew.png", "kw.png", "lw.png", "qw.png", "pw.png"],
             [, "hb.png", "eb.png", "kb.png", "lb.png", "qb.png", "pb.png"]]
    }

    x: boardX * 100
    y: boardY * 100
    z: ma.pressed ? 2 : 1

    width: 100
    height: 100
    fillMode: Image.PreserveAspectFit
    source: _.sources[color === "white" ? 0 : 1][type]
    property int oldX:boardX
    property int oldY:boardY






    MouseArea {
        id: ma
        anchors.fill: parent
        drag.target: parent
        drag.axis: Drag.XandYAxis

        onPressed: {

        }

        onReleased: {
            var dx = parent.x % 100   //Расстановка по клеточкам
            var dy = parent.y % 100
            parent.x += (dx >= 50 ? 100 - dx : -dx)
            parent.y += (dy >= 50 ? 100 - dy : -dy)

            newX = (parent.x+(dx >= 50 ? 100 - dx : -dx))/100  //Запись старых и новых позиций
            newY = (parent.y+(dy >= 50 ? 100 - dy : -dy))/100
            console.log(oldX+1,8-oldY," ",newX+1,8-newY)

            Move.move()

            oldX=newX
            oldY=newY

        }
    }

    Behavior on x {
        PropertyAnimation {
            duration: 50
        }
    }

    Behavior on y {
        PropertyAnimation {
            duration: 50
        }
    }
}
