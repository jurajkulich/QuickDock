#include "draggingwindow.h"
#include <QDebug>

DraggingWindow::DraggingWindow(QWindow* parent)
    : QQuickWindow(parent),
      mPressing(false)
{	
//	setFlags(Qt::SplashScreen | Qt::WindowStaysOnTopHint);
    setWidth(100);
    setHeight(100);
    setMouseGrabEnabled(true);
}

void DraggingWindow::mousePressEvent(QMouseEvent *ev)
{
    qDebug() << "mouse Press";
    mOrigin = ev->pos();
    mPressing = true;
	// qDebug() << "x: " << mOrigin.x();
//    QQuickWindow::mousePressEvent(ev);
}

void DraggingWindow::mouseMoveEvent(QMouseEvent *ev)
{
    if (!mPressing) {
        return;
    }
	
	QPoint dockPosition = position();
	dockPosition += ev->pos() - mOrigin;

	setPosition(dockPosition);
//    qDebug() << "mouse move event";
}

void DraggingWindow::mouseReleaseEvent(QMouseEvent *ev)
{	
    mPressing = false;
}
