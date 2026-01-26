Template.prototype.graph2DTemplate = () => `
    <canvas style="margin-left:20px" id="canvas"></canvas>
    <div id="shadow">
        <div id="window">
            <button id="addFunction">Добавить</button>
            <a href="#" class="close">Закрыть окно</a>
            <div id="funcInputs"></div>
        </div>
    </div>  
    <div>
        <a href="#shadow" class="close" style="font-size:20pt">Нарисовать график</a>
    </div>
`;