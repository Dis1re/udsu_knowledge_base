class Graph2DComponent extends Component {
    constructor(options) {
        super(options);
        this.WIN = {
            LEFT: -10,
            BOTTOM: -10,
            WIDTH: 20,
            HEIGHT: 20
        };

        this.canvas = new Canvas({
            WIN: this.WIN,
            id: 'canvas',
            width: 600,
            height: 600,
            callbacks: {
                wheel: (event) => this.wheel(event),
                mouseMove: (event) => this.mouseMove(event),
                mouseUp: () => this.mouseUp(),
                mouseDown: () => this.mouseDown()
            }
        });

        new UI({
            callbacks: {
                addFunction: (f, num) => this.addFunction(f, num),
                delFunction: (num) => this.delFunction(num),
                setDerivative: (setDer, num) => this.setDerivative(setDer, num),
                setA: (value, num) => this.setA(value, num),
                setB: (value, num) => this.setB(value, num),
                setWidth: (value, num) => this.setWidth(value, num),
                setColor: (value, num) => this.setColor(value, num)
            }
        });

        this.funcs = [];
        this.canMove = false;
        this.derivativeX = 0;

        this.render();
    }

    addFunction(f, num) {
        this.funcs[num] = {
            f,
            setDer: false,
            a,
            b,
            width: 3,
            color: '#000'
        }
        this.render();
    }

    delFunction(num) {
        this.funcs[num] = null;
        this.render();
    }

    setDerivative(setDer, num) {
        if (this.funcs[num]) {
            this.funcs[num].setDer = setDer;
            this.render();
        }
    }

    setA(value, num) {
        if (this.funcs[num]) {
            this.funcs[num].a = value;
            this.render();
        }
    }
    setB(value, num) {
        if (this.funcs[num]) {
            this.funcs[num].b = value;
            this.render();
        }
    }

    setWidth(value, num) {
        if (this.funcs[num]) {
            this.funcs[num].width = value;
            this.render();
        }
    }

    setColor(value, num) {
        if (this.funcs[num]) {
            this.funcs[num].color = value;
            this.render();
        }
    }

    //движения мышкой
    mouseMove(event) {
        if (this.canMove) {
            this.WIN.LEFT -= this.canvas.sx(event.movementX);
            this.WIN.BOTTOM += this.canvas.sy(event.movementY);
        }
        this.derivativeX = this.WIN.LEFT +
            this.canvas.sx(event.offsetX);
        this.render();
    }
    mouseUp() {
        this.canMove = false;
    }
    mouseDown() {
        this.canMove = true;
    }

    //зум
    wheel(event) {
        var delta = (event.wheelDelta > 0) ? -0.4 : 0.4;
        if (this.WIN.WIDTH + delta > 0) {
            this.WIN.WIDTH += delta,
                this.WIN.HEIGHT += delta,
                this.WIN.LEFT -= delta / 2,
                this.WIN.BOTTOM -= delta / 2
        }
        this.render();
    }

    printOXY() {
        const { LEFT, BOTTOM, HEIGHT, WIDTH } = this.WIN;
        //разметка 
        for (var i = 0; i < LEFT + WIDTH; i += 1) {
            this.canvas.line(i, BOTTOM, i, BOTTOM + HEIGHT, '#ddd');
            this.canvas.line(i, -0.1, i, 0.1, 'black');
        }
        for (var i = 0; i > LEFT; i -= 1) {
            this.canvas.line(i, BOTTOM, i, BOTTOM + HEIGHT, '#ddd');
            this.canvas.line(i, -0.1, i, 0.1, 'black');
        }
        for (var i = 0; i < BOTTOM + HEIGHT; i += 1) {
            this.canvas.line(LEFT, i, LEFT + WIDTH, i, '#ddd');
            this.canvas.line(-0.1, i, 0.1, i, 'black');
        }
        for (var i = 0; i > BOTTOM; i -= 1) {
            this.canvas.line(LEFT, i, LEFT + WIDTH, i, '#ddd');
            this.canvas.line(-0.1, i, 0.1, i, 'black');
        }
        //стрелки
        this.canvas.line(LEFT + WIDTH, 0, LEFT + WIDTH - 0.7, 0.3, 'black', 1);
        this.canvas.line(LEFT + WIDTH, 0, LEFT + WIDTH - 0.7, -0.3, 'black', 1);
        this.canvas.line(0, BOTTOM + HEIGHT, 0.3, BOTTOM + HEIGHT - 0.7, 'black', 1);
        this.canvas.line(0, BOTTOM + HEIGHT, -0.3, BOTTOM + HEIGHT - 0.7, 'black', 1);
        // 0X
        this.canvas.line(LEFT, 0, LEFT + WIDTH, 0, 'black', 2);
        // 0Y
        this.canvas.line(0, BOTTOM, 0, BOTTOM + HEIGHT, 'black', 2);
        //точка
        this.canvas.arc(0, 0, 3);
        //текст
        this.canvas.text('0', 0.2, -0.8);
        this.canvas.text('1', 0.2, 0.8);
        this.canvas.text('-1', -0.9, -1.2);
        this.canvas.text('x', this.WIN.WIDTH + this.WIN.LEFT - 0.45, -0.8);
        this.canvas.text('y', 0.4, this.WIN.HEIGHT + this.WIN.BOTTOM - 0.5);
    }

    printFunction(f, color, width) {
        var x = this.WIN.LEFT;
        var dx = this.WIN.WIDTH / 1000;
        while (x < this.WIN.WIDTH + this.WIN.LEFT) {
            if (f(x) - f(x + dx) < this.WIN.HEIGHT && f(x + dx) - f(x) < this.WIN.HEIGHT) {
                this.canvas.line(x, f(x), x + dx, f(x + dx), color, width);
                //нули функции
                if (this.getZero(f, x, x + dx, 0.001) != null) {
                    this.canvas.arc(this.getZero(f, x, x + dx, 0.001), 0, 2, 'red');
                }
            }
            x += dx;
        }
    }

    printDerivative(f, x0) {
        const k = this.getDerivative(f, x0);
        //пересечение касательной с функцией
        this.canvas.arc(x0, f(x0), 2, 'green');
        //угол касательной к оси Ox
        if (Math.atan(k) <= 0) {
            this.canvas.duga((k * x0 - f(x0)) / k, 0, 15, 0, Math.PI - Math.atan(k));
        } else this.canvas.duga((k * x0 - f(x0)) / k, 0, 15, 0, Math.PI * 2 - Math.atan(k));
        //console.log(Math.atan(k));
        const b = f(x0) - k * x0;
        const x1 = this.WIN.LEFT;
        const x2 = this.WIN.LEFT + this.WIN.WIDTH;
        this.canvas.line(x1, k * x1 + b, x2, k * x2 + b, 'blue', 1, true);
    }

    printIntegral(f, a, b) {
        const dx = (b - a) / 100;
        let x = a;
        const points = [];
        points.push({ x, y: 0 });
        while (x <= b) {
            points.push({ x, y: f(x) });
            x += dx;
        }
        points.push({ x: b, y: 0 });
        this.canvas.polygon(points);
    }

    //нули функций
    getZero(f, a, b, eps) {
        if (f(a) * f(b) > 0) {
            return null;
        }
        if (Math.abs(f(a) - f(b)) <= eps) {
            return (a + b) / 2;
        }
        var half = (a + b) / 2;
        if (f(a) * f(half) <= 0) {
            return this.getZero(f, a, half, eps);
        }
        if (f(b) * f(half) <= 0) {
            return this.getZero(f, half, b, eps);
        }
    }

    //производная
    getDerivative(f, x0, dx = 0.0001) {
        return (f(x0 + dx) - f(x0)) / dx;
    }

    //пересечения функций
    getCross(f, g, a, b, eps) {
        if ((f(a) - g(a)) * (f(b) - g(b)) > 0) {
            return null;
        }
        if (Math.abs(f(a) - g(a)) <= eps) {
            return (a + b) / 2;
        }
        var half = (a + b) / 2;
        if ((f(a) - g(a)) * (f(half) - g(half)) <= 0) {
            return this.getCross(f, g, a, half, eps);
        }
        if ((f(half) - g(half)) * (f(b) - g(b)) <= 0) {
            return this.getCross(f, g, half, b, eps);
        }
    }

    //интеграл
    getIntegral(f, a, b, n = 100) {
        const dx = (b - a) / n;
        let x = a;
        let s = 0;
        while (x <= b) {
            s += (f(x) + f(x = dx)) / 2 * dx;
        }
        return s;
    }

    //вывод
    render() {
        this.canvas.clear();
        this.printOXY();
        for (var i = 0; i < this.funcs.length; i++) {
            const func = this.funcs[i];

            console.log(func);

            if (func) {
                this.printFunction(
                    func.f,
                    func.color,
                    func.width
                );
                if (func.setDer) {
                    this.printDerivative(
                        func.f,
                        this.derivativeX
                    );
                }
                if (!isNaN(func.a) && !isNaN(func.b)) {
                    this.printIntegral(func.f, func.a, func.b);
                }
            }
        }
    }

}