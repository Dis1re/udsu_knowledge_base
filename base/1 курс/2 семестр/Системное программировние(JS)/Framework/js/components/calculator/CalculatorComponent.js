class CalculatorComponent extends Component {
    constructor(options) {
        super(options);
        this.calculator = new Calculator();
    }

    _addEventListeners() {
        const buttons = document.querySelectorAll('.operands');
        buttons.forEach(button => {
            button.addEventListener('click', () => this.operation(button.dataset.operand));
        });
    }

    operation(operand) {
        const A = document.getElementById('a');
        const B = document.getElementById('b');
        const C = document.getElementById('result');

        let a = this.calculator.toValue(A.value);
        let b = this.calculator.toValue(B.value);
        console.log(a, b);
        if (a && b) {
            let c;
            if (operand == 'zero' || operand == 'one') {
                c = this.calculator[operand](null, a);
            } else {
                c = this.calculator[operand](a, b);
            }
            C.value = c.toString();
        }
    }
}