
//Graph.ts
import {Point} from '../Math3D/entities';

export type TWIN2D = {
    WIDTH: number;
    HEIGHT: number;
    LEFT: number;
    BOTTOM: number;
}

export type TWIN3D = TWIN2D & {
    CAMERA: Point;
    CENTER: Point;
}
// класс можно использовать в качестве типа данных.

export type TWIN = TWIN2D | TWIN3D;

export type TGraph = {
    id?: string;
    width?: number;
    height?: number;
    WIN: TWIN;
    callbacks: {
        wheel: (event: WheelEvent) => void;
        mousemove: (event: MouseEvent) => void;
        mouseup: () => void;
        mousedown: (event: MouseEvent) => void;
        mouseout: (event) => void;
        wheel: (event) => void;
        // дописать
    };
}

class Graph {
    // в классе необходимо прописать типы его свойств.
    private canvas: HTMLCanvasElement;
    private context: CanvasRenderingContext2D;
    private WIN: TWIN;
    private PI2 = Math.PI * 2;
    constructor({id, width=500, height=500, WIN, callbacks}: TGraph) {
        if (id) {
            this.canvas = document.getElementById(id) as HTMLCanvasElement; // as необходимо использовать минимально в коде
        }   else {
            this.canvas = document.createElement('canvas');
            document.getElementById('body').appendChild(this.canvas);
        }
        this.context = this.canvas.getContext('2D') as CanvasRenderingContext2D;
        this.WIN = WIN;
    }
        // каждый метод классов должен иметь тип возвращаемых значений
        xs(x: number): number {/*...*/}
        ys(x: number): number {{/*...*/}
        // и тд переписать остальные методы
        polygon(points: Omit<Point, 'z'>[], color: '#999', ): void {
            //...
        }
}

//Point.ts
class Point {
    x: number;
    y: number;
    z: number;
    constructor(x=0, y=0, z=0) {
        this.x = x;
        this.y = y;
        this.z = z;
    }
}

//Light.ts
import Point from '...';
class Light extends Point{
    Lumen: number;
    constructor (x: number, y: number, z: number, lumen = 1500) {
        super(x, y, z);
        this.lumen = lumen;
    }
}

 //Polygon.ts
 import Point from '...';

 export type TRGB = {
    r: number;
    g: number;
    b: number;
}

export enum EDistance {
    distance ='distance',
    lumen = 'lumen',
}

class Polygon {
    points: number[];
    color: TRGB;
    center = new Point();
    [EDistance.distance]: number;
    [EDistance.lumen]: number;
    //...
 }

//в Math3D сделать enum ETransform со всеми методами преобрахования (move, rotate, zoom )


// Surface.ts
export type TAnimation = {
    method: ETransform;
    value: number;
    center: Point;
}

class Surface {
    points: Point[];
    edges: Edge[];
    poplygons: Polygon[];
    center: Point;
    animations: TAnimation[];
    //...

    setAnimation (method: ETransform, value: number, center: Point): void {/*...*/}
}

//Math3D.ts
type TMath3D = {
    WIN: TWIN3D;
}
type TMatrix = number[][];
type TVector = number[];
type TShadow = {
    isShadow: boolean;
    dark?: number;
}

export enum ETransform {
    zoom = 'zoom',
    move = 'move',
    rotateOx ='rotateOx',
    rotateOy = 'rotateOy',
    rotateOz = 'rotateOz'
}
[ETransform.zoom](delta: number): TMatrix {}
//...

//Graph3D.tsx
//...
math3D.calcDistance(surface, WIN.CAMERA, EDistance.distance) {/*...*/}

//  дезешечка: 
//     - переписать graph2D, graph3D на ts
