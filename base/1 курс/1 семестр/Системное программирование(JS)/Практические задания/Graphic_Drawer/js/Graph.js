
function Graph({id='canvas', win, width = 500, height = 500, callbacks}) {
    let canvas;
    if (id) {
        canvas = document.getElementById(id);
    } else {
        canvas = document.createElement('canvas');
        document.querySelector('body').appendChild(canvas);
    }

    canvas.width = width;
    canvas.height = height;

    const ctx = canvas.getContext('2d');

    const PI2 = Math.PI * 2;

    canvas.addEventListener('wheel', callbacks.wheel);
    canvas.addEventListener('mousemove', callbacks.mousemove);
    canvas.addEventListener('mousedown', callbacks.mousedown);
    canvas.addEventListener('mouseup', callbacks.mouseup);
    canvas.addEventListener('mouseout', callbacks.mouseout);

    const xs = (x) => {
        return (canvas.width * (x - win.left) / win.width);
    }

    const ys = (y) => {
        return (canvas.height - (canvas.height * (y - win.bottom) / win.height));
    }

    this.sx = function (x) {
        return x/(canvas.width/win.width);
    }

    this.sy = function (y) {
        return -y/(canvas.height/win.height);
    }

    this.clear = function () {
        ctx.fillStyle = 'white';
        ctx.fillRect(0,0, canvas.width, canvas.height);
    }

    this.line = function (x1, y1, x2, y2, color, width=3, isDash=false) {
        ctx.beginPath();
        ctx.strokeStyle = color || 'black';
        ctx.lineWidth = width || 3;
        if (isDash) {
            ctx.setLineDash([10, 10]);
        }
        else{
            ctx.setLineDash([0,0]);
        }
        ctx.moveTo(xs(x1), ys(y1));
        ctx.lineTo(xs(x2), ys(y2));
        ctx.stroke();
        ctx.closePath();
    }

    this.text = function (text, x, y, color, size, font) {
        ctx.beginPath();
        font = font || 'Arial';
        size = size || "12";
        ctx.font = size+"px " + font;
        ctx.fillStyle = color || 'black';
        ctx.fillText(text, xs(x), ys(y));
        ctx.closePath();
    }

    this.point = function (x, y, color, size) {
        ctx.beginPath();
        ctx.strokeStyle = color || 'black';
        ctx.arc(xs(x), ys(y), size||2, 0, PI2);
        ctx.stroke();
        ctx.closePath();
    }
}