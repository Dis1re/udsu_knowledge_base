window.onload = function () {

    const funcs = [
        {
        f:(x) => x*x,
        color: 'cyan',
        width:3
        }
    ];

    const wheel = (event) => {
        const delta = (event.wheelDelta >0)? -zoomStep: zoomStep;
        win.height += delta;
        win.width += delta;
        win.left -= delta/2;
        win.bottom -= delta/2;
        render();
    }

    const mousedown = () => {
        canMove = true;
    }

    const mouseup = () => {
        canMove = false;
    }

    const mouseout = () => {
        canMove = false;
    }

    const mousemove = (event) => {
        if (canMove) {
            win.left -= graph.sx(event.movementX);
            win.bottom -= graph.sy(event.movementY);
            // shiftX += event.movementX/100;
            // shiftY -= event.movementY/100;
            render();
        }
    }

    const graph = new Graph({
            id:'canvas',
            width: 500,
            height: 500,
            win: win,
            callbacks: {
                wheel,
                mousemove,
                mousedown,
                mouseup,
                mouseout
            }
        }
    )

    const clickButton = () => {
        let f =  function (x) { return eval(document.getElementById('inputText').value)};
        let color = document.getElementById('inputFuncColor').value;
        let size = document.getElementById('inputFuncSize').value*1;
        let name = getFuncName(f);

        document.getElementById('funcList').innerHTML += template;

        render();
    }

    const resize = () => {
        let size = Math.min(window.innerHeight, window.innerWidth) * 0.8;
        canvas.width = size;
        canvas.height = size;
        render();
    }

    let canMove = false;

    const button = document.getElementById('inputButton');

    button.addEventListener('click', clickButton);
    window.addEventListener('resize', resize);

    const printAxes = () => {
        //рисование основных линий осей
        graph.line(0, win.bottom, 0, win.height + win.bottom, 'black', 3);
        graph.line(win.width + win.left, 0, win.left, 0, 'black', 3);

        //цикл для сетки и разметки по положительной оси х
        for (i = scale; i < win.width + win.left; i += scale) {
            graph.line(i, win.bottom, i, win.height + win.bottom, 'grey', 1);
            graph.line(i, win.height/100, i, -win.height/100);
            graph.text(i + '', i + win.width/100, -win.height/34);
        }

        //цикл для сетки и разметки по отрицательной оси х
        for (i = -scale; i > win.left; i -= scale) {
            graph.line(i,  win.bottom, i, win.height + win.bottom, 'grey', 1);
            graph.line(i, win.height/100, i, -win.height/100);
            graph.text(i + '', i - win.width/40, win.height/50)
        }

        //цикл для сетки и разметки по положительной оси у
        for (i = scale; i < win.height + win.bottom; i += scale) {
            graph.line(win.left, i, win.width + win.left, i, 'grey', 1);
            graph.line(win.width/100, i, -win.width/100, i);
            graph.text(i + '', win.width/50, i + win.height/100);
        }

        //цикл для сетки и разметки по отрицательной оси у
        for (i = -scale; i > win.bottom; i -= scale) {
            graph.line(win.left, i, win.width + win.left, i, 'grey', 1);
            graph.line(win.width/100, i, -win.width/100, i);
            graph.text(i + '', -win.width/29, i - win.height/50);
        }

        //написание нуля отдельно в центре
        graph.point(0, 0, 'black', 2)
        graph.text('0', -win.width/50, -win.height/40);

        //рисование стрелок осей
        //рисование стрелки x
        graph.line(win.width + win.left, 0, win.width + win.left - win.width/100, win.height/100);
        graph.line(win.width + win.left - win.width/100, win.height/100, win.width + win.left - win.width/100, -win.height/100);
        graph.line(win.width + win.left - win.width/100, -win.height/100, win.width + win.left, 0);
        //рисование стрелки y
        graph.line(0, win.height + win.bottom, win.width/100, win.height + win.bottom - win.height/100);
        graph.line(win.width/100, win.height + win.bottom - win.height/100, -win.width/100, win.height + win.bottom - win.height/100);
        graph.line(-win.width/100, win.height + win.bottom - win.height/100, 0, win.height + win.bottom);

        //подпись осей
        graph.text('X', win.width + win.left - win.width/50, -win.height/25);
        graph.text('Y', win.width/34, win.height + win.bottom - win.height/34);
        graph.text('O', win.width/100, win.height/100);
    }

    const getFuncName = (f) => {
        let str = f.toString();

        if (str.includes('eval')) {
            return document.getElementById('inputText').value
                .replaceAll('Math.', '');
        }
        else {
            return str.substr(str.lastIndexOf('return') + 6, str.length)
                .replaceAll('Math.', '')
                .replaceAll(';', '')
                .replaceAll('}', '')
        }
    }

    function getZero(f, a, b, eps = 0.01) {
        if (f(a)*f(b) > 0) return null;
        if (Math.abs(f(a)-f(b)) <= eps) {console.log((a+b)/2);
            graph.point(f((a+b)/2), 0, 'red', 2);
            return}
        const half = (a+b)/2;
        if (f(a) * f(half) <= 0) {return getZero(f, a, half, eps)}
        else if (f(half)*f(b) <= 0) return getZero(f, half, b ,eps);
    }

    const printFunction = (f, color, size, shiftX, shiftY) => {
        shiftX = shiftX || 0
        shiftY = shiftY || 0
        let x = win.left - shiftX;
        const dx = win.width / discret;
        let isDash;
        const nullsList = [];

        while (x <= win.width + win.left - shiftX) {

            isDash = Math.abs(f(x) - f(x + dx)) > win.height;
            graph.line(x+shiftX, f(x)+shiftY, x + dx +shiftX, f(x + dx)+shiftY, color, size, isDash);

            //запоминание координат с нулями функции
            // if (Math.abs(f(x)+shiftY) < dx*1.5) {
            //     nullsList.push(x+shiftX)
            // }
            //getZero(f, win.left, win.width+win.left, 0.01);
            x += dx;
        }
        // //вывод нулей по массиву с собранными нулями
        // for (let elem of nullsList) {
        //     graph.point(elem, 0, 'red', size/3)
        // }

        graph.text(getFuncName(f), 1, f(1)-win.height/50, color);
    }

    const render = () => {
        graph.clear();
        printAxes();
        funcs.forEach(func => func && printFunction(func.f, func.color, func.width))
    }
    render();
}


//улучшить нахождение нулей функции
// менять цвет графика и толщину линии в момент исполнения программы
// на ноутах сделать, чтобы от тачскина всегда менялся скейл окна канваса а не браузера
//нарисовать произвадную(k = (f(x+dx) + f(x))/dx)
// y = k*x + b