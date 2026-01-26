function sin(x) {
    return Math.sin(x)
}

function cos(x) {
    return Math.cos(x)
}

function tg(x) {
    return Math.tan(x)
}

function ctg(x) {
    return 1 / Math.tan(x)
}

function pow(x, n) {
    return Math.pow(x, n)
}

function UI(options) {
    var num = 0
    document.getElementById('addFunction').addEventListener('click', addFunction)

    function addFunction() {
        var input = document.createElement('input')
        input.setAttribute('placeholder', `function№${num}`)
        input.dataset.num = num
        input.setAttribute('id', 'input' + num)
        input.addEventListener('keyup', keyup)

        var button = document.createElement('button')
        button.innerHTML = 'Удалить'
        button.setAttribute('id', 'button' + num)
        button.addEventListener('click', function () {
            options.callbacks.delFunction(input.dataset.num)
            funcInputs.removeChild(input)
            funcInputs.removeChild(checkbox)
            funcInputs.removeChild(button)
            funcInputs.removeChild(a)
            funcInputs.removeChild(b)
            funcInputs.removeChild(width)
            funcInputs.removeChild(color)
            funcInputs.removeChild(x)
            funcInputs.removeChild(y)
        })

        var a = document.createElement('input')
        a.setAttribute('placeholder', 'a =')
        a.dataset.num = num
        a.setAttribute('id', 'a' + num)
        a.addEventListener('keyup', clickAInput)

        var b = document.createElement('input')
        b.setAttribute('placeholder', 'b =')
        b.dataset.num = num
        b.setAttribute('id', 'b' + num)
        b.addEventListener('keyup', clickBInput)

        var width = document.createElement('input')
        width.setAttribute('placeholder', 'width')
        width.dataset.num = num
        width.setAttribute('id', 'width' + num)
        width.addEventListener('keyup', clickWidthInput)

        var color = document.createElement('input')
        color.setAttribute('placeholder', 'color')
        color.dataset.num = num
        color.setAttribute('id', 'color' + num)
        color.addEventListener('keyup', clickColorInput)

        var x = document.createElement('input')
        x.setAttribute('placeholder', 'x =')
        x.dataset.num = num
        x.setAttribute('id', 'x' + num)
        x.addEventListener('keyup', clickXInput)

        var y = document.createElement('input')
        y.setAttribute('placeholder', 'y =')
        y.dataset.num = num
        y.setAttribute('id', 'y' + num)
        y.addEventListener('keyup', clickYInput)

        const checkbox = document.createElement('input')
        checkbox.setAttribute('type', 'checkbox')
        checkbox.dataset.num = num
        checkbox.addEventListener('click', clickCheckbox)

        var funcInputs = document.getElementById('funcInputs')
        funcInputs.appendChild(input)
        funcInputs.appendChild(checkbox)
        funcInputs.appendChild(button)
        funcInputs.appendChild(a)
        funcInputs.appendChild(b)
        funcInputs.appendChild(width)
        funcInputs.appendChild(color)
        funcInputs.appendChild(x)
        funcInputs.appendChild(y)
        num++
    }

    function keyup() {
        try {
            var f
            eval(`f = function(x){return ${this.value};}`)
            options.callbacks.addFunction(f, this.dataset.num)
        } catch (e) {
            console.log(e)
        }
    }

    function clickCheckbox() {
        options.callbacks.setDerivative(this.checked, this.dataset.num)
    }

    function clickAInput() {
        options.callbacks.setA(this.value - 0, this.dataset.num)
    }

    function clickBInput() {
        options.callbacks.setB(this.value - 0, this.dataset.num)
    }

    function clickWidthInput() {
        options.callbacks.setWidth(this.value - 0, this.dataset.num)
    }

    function clickColorInput() {
        options.callbacks.setColor(this.value, this.dataset.num)
    }

    function clickXInput() {
        options.callbacks.setX(this.value - 0, this.dataset.num)
    }

    function clickYInput() {
        options.callbacks.setY(this.value - 0, this.dataset.num)
    }
}
