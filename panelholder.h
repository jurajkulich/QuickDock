#ifndef PANELHOLDER_H
#define PANELHOLDER_H

#include <QObject>
#include <QQuickItem>

class PanelHolder : public QObject
{
		Q_OBJECT 
		
	public:
		explicit PanelHolder(QObject *parent = nullptr);
};

#endif // PANELHOLDER_H
