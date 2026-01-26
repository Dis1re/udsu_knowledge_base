function checkHitAstroid(x, y){
    return (x**(2/3) + y**(2/3) <= 1)? 4: 0;
}

function checkHitRhomb(x, y){
    return (Math.abs(y) <= 1 - Math.abs(x))? 3: 0;
}

function checkHitCircle(x, y){
    return (y**2 + x**2 <= 1)? 2: 0;
}

function checkHitSquare(x, y){
    return (Math.abs(y) <= 1 && Math.abs(x) <= 1)? 1: 0;
}

function checkHitCenter(x, y){
    return (x**2  + y**2 <= 0.001)? 10: 0;
}

function chooseTargets(targetsOrder){
    var arr= [], input, exit;
    console.log('Выберите мишени(1 - квадрат, 2 - круг, 3 - ромб, 4 - астроида, 5 - конец выбора): ');
    while (true){
        input = prompt();
        switch (input){
            case '5':
                exit = true;
                break;
            case '1':
                arr.push('square')
                break;
            case '2':
                arr.push('circle')
                break;
            case '3':
                arr.push('rhomb')
                break;
            case '4':
                arr.push('astroid')
                break;
            default:
                console.log('Введена неправильная цифра');
                break;
        }
        if (exit){
            break;
        }
    }
    var newArr = [...new Set(arr)];
    return newArr.sort(function (a, b){
        const aInd = targetsOrder.indexOf(a);
        const bInd = targetsOrder.indexOf(b);
        return aInd - bInd;
    })
}
function main(){
    var x, y, n, hitsCounter = 0, pointsSum = 0, result;
    var targetsOrder = ['center', 'astroid', 'rhomb', 'circle', 'square'];
    var obj = {'center': checkHitCenter, 'astroid' :checkHitAstroid, 'rhomb':checkHitRhomb,
                    'circle':checkHitCircle, 'square':checkHitSquare}
    var targets = chooseTargets(targetsOrder);

    console.log('Введите количество выстрелов: ')
    n = Number(prompt());
    for (var i = 0; i < n; i++){
        x = (Math.random() - 0.5) * 2;
        y = (Math.random() - 0.5) * 2;
        //x = Number(prompt());
        //y = Number(prompt());
        for (var elem of targets){
            result = obj[elem](x,y);
            if (result){
                hitsCounter += 1;
                pointsSum += result;
                break;
            }
        }
    }
    console.log('процент попадания:',(hitsCounter/n)*100,'%');
    console.log('всего очков:',pointsSum);
}

main();


/*
function chooseTargets(){
    var arr= [], input, exit;
    var targetsOrder = [shotToCenter, shotToAstriod, shotToRhomb, shotToCircle, shotToSquare];
    console.log('Выберите мишени(1 - квадрат, 2 - круг, 3 - ромб,' +
                ' 4 - астроида, 5 - центр(точка), 6 - конец выбора): ');
    while (true){
        input = prompt();
        switch (input) {
            case '6':
                exit = true;
                break;
            case '1':
                arr.push(shotToSquare)
                break;
            case '2':
                arr.push(shotToCircle)
                break;
            case '3':
                arr.push(shotToRhomb)
                break;
            case '4':
                arr.push(shotToAstriod)
                break;
            case '5':
                arr.push(shotToCenter)
                break;
            default:
                console.log('Введена неправильная команда');
                break;
        }
        if (exit){
            break;
        }
    }
    arr = [...new Set(arr)];
    return arr.sort(function (a, b){
        const aInd = targetsOrder.indexOf(a);
        const bInd = targetsOrder.indexOf(b);
        return aInd - bInd;
    })
}
*/
/*
function inputParams() {
    var params = {'square': '', 'circle': '', 'rhomb': '', 'astroid': '', 'center': ''};
    console.log('Выберите мишень для ввода параметров(1 - квадрат, 2 - круг, 3 - ромб,' +
                '4 - астроида, 5 - центр, 6 - не вводить параметры)');
    var input = prompt();
    switch (input) {
        case '1':
            params.square = inputFigureParams('square');
            break;
        case '2':
            params.circle = inputFigureParams('circle');
            break;
        case '3':
            params.rhomb = inputFigureParams('rhomb');
            break;
        case '4':
            params.astroid = inputFigureParams('astroid');
            break;
        case '5':
            params.center = inputFigureParams('center');
            break;
        case '6':
            return params;
        default:
            console.log('Введена неправильная команда');
            break;
    }
    return params;
}
*/
/*
function inputFigureParams(figure) {
    var figureParams = {};
    var order = ['x0', 'y0', 'points']
    for (elem of order) {
        console.log(elem + ' =')
        figureParams[elem] = Number(prompt());
    }
    switch (figure) {
        case 'square':
            console.log('a =')
            figureParams.a = Number(prompt());
            break;
        case 'circle':
            console.log('r =')
            figureParams.r = Number(prompt());
            break;
        case 'rhomb':
            console.log('d =')
            figureParams.d = Number(prompt());
            break;
        case 'astroid':
            console.log('r =')
            figureParams.r = Number(prompt());
            break;
    }
    return figureParams;
}
*/
