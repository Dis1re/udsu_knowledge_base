Template.prototype.calculatorTemplate = () => `
    <div>
        <div>
            <textarea placeholder="0" id="a" class="numbers"></textarea>
            <textarea placeholder="0" id="b" class="numbers"></textarea>
        </div>

        <div>
            <textarea placeholder="result" id="result" class="numbers" style="width: 500px" disabled></textarea>
        </div>
    </div>
    <div>
        <button class="operands btn operation" data-operand="add"> Add </button>
        <button class="operands btn operation" data-operand="sub"> Sub </button>
        <button class="operands btn operation" data-operand="mult"> Mult </button>
    </div>
    <div>
        <button class="operands btn operation" data-operand="div"> Div </button>
        <button class="operands btn operation" data-operand="prod"> Prod </button>
        <button class="operands btn operation" data-operand="pow"> Pow </button>
        </div>
    <div>
        <button class="operands btn operation" data-operand="one"> One </button>
        <button class="operands btn operation" data-operand="zero"> Zero </button>
    </div>
`;