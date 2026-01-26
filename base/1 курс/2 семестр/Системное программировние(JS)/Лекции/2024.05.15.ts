
// AnyType.ts
import {Complex, Vector, Matrix} from '...';
type AnyType = Complex | Vector | Matrix | number;

export default AnyType;

//Vector.ts
class Vector {
    values: AnyType[];
    constructor(value: AnyType[] = []) {
        //...
    }
    //...
}
class Matrix {
    values: AnyType[][];
    constructor(value: AnyType[][] = []) {
        //...
    }
    //...
}

//AnyCalculator.ts
import {ComplexCalculator, VectorCalculator, MatrixCalculator, RealCalculator} from '...';
type AnyCalculator = ComplexCalculator | VectorCalculator | MatrixCalculator | RealCalculator;

export default AnyCalculator;

//ICalculator.ts
export default interface ICalculator<T>{
    add(a: T, b: T): T;
    sub(a: T, b: T): T;
    mult(a: T, b: T): T;
    div(a?: T, b?: T): T | null;
    prod(a: T, b: number): T;
    pow(a: T, b: number): T;
    one(a?: T | number): T;
    //...
}

//RealCalculator.ts
class RealCalculator implements ICalculator<number>{
    add(a: number, b: number): number {
        //...
    }
    //...
}

//VectorCalculator.ts
import Vector from '...';
class VectorCalculator implements ICalculator<Vector>{
    calc: ICalculator<AnyType>;
    constructor(calc: ICalculator<AnyType>){
        this.calc = calc;
    }

    div(a: Vector, b: Vector): Vector | null {
        //...
    }
    //...
}

// Calculator.ts
import {Complex, Vector, Matrix} from '...';
import ICalculator from '...';
class Calculator implements ICalculator<AnyType> {
    complex(re?: number, im?: number): Complex {
        return new Complex(re, im);
    }
    Vector(values?: AnyType[]): Vector {
        return new Vector(values);
    }
    Martix(){
    }
    //...

    getComplex(str: string): Complex {/*...*/}
    getVector(str: string): Vector {/*...*/}
    getMatrix(str: string): Matrix {/*...*/}

    get(elem?: AnyType): ICalculator<AnyType> {
        if (elem instanceof Matrix) {return new MatrixCalculator(this.get(elem.values[0][0]));}
        //...
        return new RealCalculator();
    }

    [EOperand.add](a: AnyType, b: AnyType): AnyType {
        return this.get(a).add(a, b);
    }

    //...
    
}

// ICalculator.ts
//...
export enum EOperand{
    add='add',
    sub='sub',
    //...
}

//useCalculator.ts

export default function useCalculator(
    refA: React.RefObject<HTMLTextAreaElement>, 
    refB: React.RefObject<HTMLTextAreaElement>, 
    refC: React.RefObject<HTMLTextAreaElement>
    ): (operand: EOperand) => void {
        const calc = new Calculator();
        return (operand: EOperand) = {
            if(refA && refB && refC) {
                const A = refA.current?.value || '';
                const B = refB.current?.value || '';
                if (operand === EOperand.prod || operand === EOperand.pow) {
                    refC.current.value = calc[operand](calc.getValue(A), parseFloat(B))?.toString() || '';
                    return;
                }
                reC.current.value = calc[operand](calc.getValue(A), calc.getValue(B))?.toString() || '';
            }
        }
    }

//Calc.tsx

const Calc: React.FC = () => {
    const refA = useRef<HTMLTextAreaElement>(null);
    const refB = useRef<HTMLTextAreaElement>(null);
    const refC = useRef<HTMLTextAreaElement>(null);
    const calc = useCalculator(refA, refB, refC);
    return (<>
        <textarea ref={refA} />
        <textarea ref={refB} />
        <textarea ref={refC} />
        <div>
            <button onClick={() => calc(EOperand.add)}>+</button>
            <button onClick={() => calc(EOperand.sub)}>-</button> 
            //...
        </div>
        </>);
}

export default Calc;

