
function shotToCenter(x, y, params) {
    if ((x - params.x0) === 0 && (y - params.y0) === 0) {
        return params.points;
    }
}

function shotToAstriod(x, y, params) {
    if ((x - params.x0) ** (2 / 3) + (y - params.y0) ** (2 / 3) <= params.par) {
        return params.points;
    }
}

function shotToRhomb(x, y, params) {
    if (Math.abs((x - params.x0)) + Math.abs((y - params.y0)) <= (params.par / 2)) {
        return params.points;
    }
}

function shotToCircle(x, y, params) {
    if ((x - params.x0) ** 2 + (y - params.y0) ** 2 <= params.par) {
        return params.points;
    }
}

function drawSquare(centerX, centerY, sideLength) {
    const canvas = document.getElementById('myCanvas');
    const ctx = canvas.getContext('2d');

    // Вычисляем координаты вершин квадрата
    const halfSide = sideLength / 2;
    const x1 = centerX - halfSide;
    const y1 = centerY - halfSide;
    const x2 = centerX + halfSide;
    const y2 = centerY - halfSide;
    const x3 = centerX + halfSide;
    const y3 = centerY + halfSide;
    const x4 = centerX - halfSide;
    const y4 = centerY + halfSide;

    // Рисуем квадрат
    ctx.beginPath();
    ctx.moveTo(x1, y1);
    ctx.lineTo(x2, y2);
    ctx.lineTo(x3, y3);
    ctx.lineTo(x4, y4);
    ctx.closePath();

    // Задаем стиль и отрисовываем квадрат
    ctx.strokeStyle = 'blue'; // Цвет обводки
    ctx.lineWidth = 2; // Толщина линии
    ctx.fillStyle = 'yellow'; // Цвет заливки
    ctx.fill();
    ctx.stroke();
}

function shotToSquare(x, y, params) {
    drawSquare(params.x0, params.y0, params.par);
    if (Math.abs(x - params.x0) <= 1 && Math.abs(y - params.y0) <= (params.par / 2)) {
        return params.points;
    }
    return 0;
}

function shotToTarget(x, y, targets, params) {
    if (!isNaN(x) && !isNaN(x)) {
        var shotInfo = shotToCenter(x, y, params) ||
            shotToAstriod(x, y, params) ||
            shotToRhomb(x, y, params) ||
            shotToCircle(x, y, params) ||
            shotToSquare(x, y, params);
        if (shotInfo.points) {
            return shotInfo;
        }
    }
    return 0;
}

function shoot(result, targets, customShots, shotParams) {
    const n = customShots.length || customShots.n;
    const k = customShots.k || 2;
    for (let i = 0; i < n; i++) {
        const x = customShots[i].x || (Math.random() - 0.5) * k;
        const y = customShots[i].y || (Math.random() - 0.5) * k;
        const shotInfo = shotToTarget(x, y, targets, shotParams);
        result.score += shotInfo;
        result.accuracy += shotInfo ? 1 / n : 0;
    }
}

/*
shotParams = {
    n: integer - кол-во выстрелов
    k: float - коофициент размера поля
    customShots: arr - массив с объектами координатат выстрелов
    target: arr - массив с выбраными мишенями
    square: obj - объект с параметрами квадрата
    circle: obj - объект с параметрами круга
    rhomb: obj - объект с параметрами ромба
    astroid: obj - объект с параметрами астроиды
    center: obj - объект с параметрами центра
}
*/

function shots(shotParams) {
    const result = {
        score: 0,
        accuracy: 0
    };
    if (shotParams) {
        const n = shotParams.n || -1;
        const customShots = shotParams.customShots || [];
        let points = 0;
        if (!isNaN(n) && n > 0) {
            points = shoot(result, targets);
        }
        if (customShots.length) {
            points = shoot(result, customShots, shotParams);
        }
    }
    return result;
}

function drawCoordinateShape() {
    const canvas = document.getElementById('myCanvas');
    const ctx = canvas.getContext('2d');
    const width = canvas.width;
    const height = canvas.height;

    ctx.beginPath();
    ctx.moveTo(0, height / 2);
    ctx.lineTo(width, height / 2);
    ctx.stroke();

    ctx.beginPath();
    ctx.moveTo(width / 2, 0);
    ctx.lineTo(width / 2, height);
    ctx.stroke();

    for (let x = -width / 2 + 10; x < width / 2; x += 30) {
        ctx.beginPath();
        ctx.moveTo(width / 2 + x, height / 2 - 5);
        ctx.lineTo(width / 2 + x, height / 2 + 5);
        ctx.stroke();
        const label = (x / 100).toFixed(1); // Десятые доли
        ctx.fillText(label, width / 2 + x - 10, height / 2 + 20);
    }

    for (let y = -height / 2 + 10; y < height / 2; y += 30) {
        ctx.beginPath();
        ctx.moveTo(width / 2 - 5, height / 2 + y);
        ctx.lineTo(width / 2 + 5, height / 2 + y);
        ctx.stroke();
        const label = (-y / 100).toFixed(1); // Десятые доли
        ctx.fillText(label, width / 2 + 10, height / 2 + y + 5);
    }
}

function getTargets() {
    const shotsParams = {
        n: 1,
        k: 4,
        customShots: [{x: 0, y: 0}],
        targets: [],
        center: {
            x0: 0,
            y0: 0,
            points: 10,
        },
        astroid: {
            x0: 0,
            y0: 0,
            points: 4,
            par: 1
        },
        rhomb: {
            x0: 0,
            y0: 0,
            points: 3,
            par: 2
        },
        circle: {
            x0: 0,
            y0: 0,
            points: 2,
            par: 1
        },
        square: {
            x0: 0,
            y0: 0,
            points: 1,
            par: 2
        }
    };
    const allTargets = ['center', 'astroid', 'rhomb', 'circle', 'square'];

    allTargets.forEach(target => {
        if (document.getElementById(target).checked) {
            shotsParams.targets.push(target);
            shotsParams[target].x0 = Number(document.getElementById(target + 'X0').value || 0);
            shotsParams[target].y0 = Number(document.getElementById(target + 'Y0').value || 0);
            shotsParams[target].points = Number(document.getElementById(target + 'Points').value
                || shotsParams[target].points);
            shotsParams[target].par = Number(document.getElementById(target + 'Par')
                || shotsParams[target].points);
        }
    })

    return shotsParams;

    // const result = shots(shotsParams);
    // document.getElementById('result').innerHTML = String(result.score) + '||' + String(result.accuracy);
}

function render(shotParams){
    shotParams.targets.forEach(target => {
        draw[target]();
    });
}

function main() {
    drawCoordinateShape();
    // document.getElementById('startButton')
    //     .addEventListener('click', clickHandler());
    const shotParams = getTargets();
    render(shotParams);
}

main();
