function deathScreen() {
    roomId = 'backrooms';
    gotoRoom();
    return;
}

function doMagic() {
    if (math.random() >= 0.5) {
        roomId = 'doMagic';
        gotoRoom();
    } else {
        roomId = 'backrooms';
        gotoRoom();
    }
}

function buyFoodSuc() {
    if (Student.cash >= foodCost) {
        Student.cash -= foodCost;
        roomId = 'buyFoodSuc';
        gotoRoom();
    } else {
        roomId = 'buyFoodBad';
        gotoRoom();
    }
}

function gotoRoom() {
    var room = Rooms[roomId];
    if (roomId === 'backrooms') {
        Student.hp = 100;
    }
    if (room === 'doMagic') {
        doMagic();
        return;
    }
    if (room === 'buyFood') {
        buyFoodSuc();
        return;
    }
    //console.log(room, roomId);
    document.getElementById('roomTitle').innerHTML = room.title;
    document.getElementById('roomImage').src = room.image;
    document.getElementById('roomDescription').innerHTML = room.description;
    document.getElementById('hp').innerHTML = "ХП: " + Student.hp;
    document.getElementById('cash').innerHTML = "шекели: " + Student.cash;
    document.getElementById('actions').innerHTML = '';
    var roomNum = room.actions.length;
    if (roomNum === 0) {
        deathScreen(Student.hp);
        return;
    }
    for (var i = 0; i < roomNum; i++) {
        var button = document.createElement('button');
        button.innerHTML = room.actions[i].title;
        (function (index) {
            button.addEventListener('click', function () {
                if ((Student.hp - room.actions[index].cost) <= 0) {
                    deathScreen();
                    return;
                }
                roomId = room.actions[index].id;
                Student.hp -= room.actions[index].cost;
                gotoRoom();
            });
        })(i);
        button.classList.add('actionButtons')
        document.getElementById('actions').appendChild(button);
    }
}
