#ifndef DOCKWINDOW_H
#define DOCKWINDOW_H

#include <QObject>
#include <QQuickItem>

class DockWindow : public QObject
{
		Q_OBJECT 
		
	public:
		explicit DockWindow(QObject *parent = nullptr);
};

#endif // DOCKWINDOW_H
