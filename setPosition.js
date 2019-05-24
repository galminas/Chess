var component;
var sprite;
var figures=[];

var board=[[-4, -1, -2, -5, -3, -2, -1, -4],
           [-6, -6, -6, -6, -6, -6, -6, -6],
           [ 0,  0,  0,  0,  0,  0,  0,  0],
           [ 0,  0,  0,  0,  0,  0,  0,  0],
           [ 0,  0,  0,  0,  0,  0,  0,  0],
           [ 0,  0,  0,  0,  0,  0,  0,  0],
           [ 6,  6,  6,  6,  6,  6,  6,  6],
           [ 4,  1,  2,  5,  3,  2,  1,  4]]


function move(){


board[oldY][oldX]="0"
board[newY][newX]=type  //Динамический массив

console.log(board[0])
console.log(board[1])
console.log(board[2])
console.log(board[3])
console.log(board[4])
console.log(board[5])
console.log(board[6])
console.log(board[7])

}


function createSpriteObjects() {
    component = Qt.createComponent("main.qml");
    if (component.status === Component.Ready)
        finishCreation();
    else
        component.statusChanged.connect(finishCreation);
}

function finishCreation() {

    for(var i=0; i<8; i++)
        for(var j=0; j<8; j++)
        {

            var n = board[i][j]
            var type = Math.abs(n)
            var color = n>0?"white":"black"
            if (n===0) break

            console.log(n,type,color)


    if (component.status === Component.Ready) {
        sprite = component.createObject(appWindow, {"boardX": j, "boardY": i, "type":type, "color":color,});
        if (sprite === null) {
            // Error Handling
            console.log("Error creating object");
        }
        else figures.push(sprite)
    } else if (component.status === Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }
        }
}
