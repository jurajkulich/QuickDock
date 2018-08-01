#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "dockwindow.h"
#include "dockwindowtest.h"
#include "panelholder.h"

int main(int argc, char *argv[])
{
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	
	QGuiApplication app(argc, argv);
	
	qmlRegisterType<DockWindow>("io.qt.dock.dockwindow", 1, 0, "DockWindow");
	qmlRegisterType<DockWindowTest>("io.qt.dock.dockwindow", 1, 0, "DockWindowTest");
	qmlRegisterType<PanelHolder>("io.qt.dock.dockwindow", 1, 0, "PanelHolder");
	// qmlRegisterType<DropTile>("io.qt.dock.dockwindow", 1, 0, "DropTile");
	
	QQmlApplicationEngine engine;
	engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
	if (engine.rootObjects().isEmpty())
		return -1;

	
	
	return app.exec();
}
