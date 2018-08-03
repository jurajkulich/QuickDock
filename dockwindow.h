#ifndef DOCKWINDOW_H
#define DOCKWINDOW_H

#include <QObject>
#include <QQuickItem>
#include <QDebug>

class DockWindow : public QObject
{
		Q_OBJECT 
		
	public:
		explicit DockWindow(QObject *parent = nullptr);
		
	public slots: 
//			void callMeSlot(const QString &slotq) {
//				qDebug() << "Called the C++ slot with message:" << slotq;
//			}
};

#endif // DOCKWINDOW_H
