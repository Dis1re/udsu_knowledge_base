const win = {
    width: 10,
    height: 10,
    left: -5,
    bottom: -5,
}

const discret =  1000;

const zoomStep = 0.2;

const scale = 1;//размер единичного отрезка

const funcList = [
    {
        f: tg,
        color: 'cyan',
        size: 3
    },
]

let funcTemplate = '';

function sin(x) {
    return Math.sin(x);
}

function tg(x) {
    return Math.tan(x);
}

function f(x) {
    return x*x;
}