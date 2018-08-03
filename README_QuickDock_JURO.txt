https://github.com/yuro8/QuickDock

Listview je pouzity preto lebo je to jediny layout spolu s gridviewom kde mozeme presuvat panely pomocou indexu
Nevyhody: nemozeme vytiahnut konkretny panel bez toho aby sa znicil - zmenit parenta
Ak zmenime parenta urciteho panelu model listviewu ho stale obsahuje - v listviewe je prazdne miesto bez neho a pri presune ostatnych panelov je stale zobrazovany ako volne miesto
Ak zmenime parenta  urciteho panelu a vymazeme ho z modelu (remove) zmizne panel aj tak
Ak chceme najprv pridat parenta do druheho modelu, prikaz insert panel taktiez zdestruuje a potom znovu vytvori

Mozne dalsie riesenia:
Palinov napad: 
Pouzit QML iba na zobrazenie objektov a vysielanie signalov a v C++ riadit logiku
Ak QML panel zaregistruje pohyb, odosleme signal do triedy ktora posunie ostatne prvky podla potreby

Prepisat model tak aby panely kopiroval a nie destruoval, pripadne destruoval az po skoprovani


Panely:
DockWindow
DockWindowTest
DropTile

PanelHolder - sluzi ako holder pre panely, po vytvoreni v sebe vytvori panel pozadovaneho typu cez JS 
PanelWrapper - tvori delegate pre panely, obsahuje MouseAreu pre pohyb panelov  v docku
DraggableItemDropArea - tvori drop areu v docku, taktiez ukazuje miesto (cierny obldznik) kam je panel tahany
PanelHolderUndocked - PanelHolder s pridanou MouseArea 

AddComponentToQml - JS kod, implementacia vkladania qml suborov (Da sa prepisat aj do samotneho QML)


