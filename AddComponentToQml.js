
var component; 
var panel;

function createPanel(name, parent, x, y) {
    // name = meno komponentu
    // parent = parent vytvoreneho itemu
    // x, y = pozicie itemu v parentovi
    component = Qt.createComponent(name + ".qml");
    panel = component.createObject(parent, {"x": x, "y": y});
}

function createPanel(name, parent, x, y, comp) {
    // comp = meno komponentu pri dynamickom vytvarani objektu v dynamicky vytvorenom objekte :D
    component = Qt.createComponent(name + ".qml");
    panel = component.createObject(parent, {"x": x, "y": y, "type": comp});
}
