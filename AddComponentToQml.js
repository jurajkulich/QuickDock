
var component; 
var panel;

function createPanel(name, parent, x, y) {
    // name = meno dynamicky pridaneho komponentu
    // parent = parent vytvoreneho itemu
    // x, y = pozicie itemu v parentovi
    component = Qt.createComponent(name + ".qml");
    panel = component.createObject(parent, {"x": x, "y": y});
}

function createPanel(name, parent, x, y, comp) {
    // comp = meno dynamicky vytvaraneho komponentu v dynamicky vytvorenom komponente :D
    component = Qt.createComponent(name + ".qml");
    panel = component.createObject(parent, {"x": x, "y": y, "type": comp});
}
