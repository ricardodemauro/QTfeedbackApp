#ifndef SERVICEVIEWMODEL_H
#define SERVICEVIEWMODEL_H

#include <QObject>
#include <src/pageViewModelBase.h>

class PageServiceViewModel : 
	public QObject,
    public PageViewModelBase
{
    Q_OBJECT
public:
    explicit PageServiceViewModel(QObject *parent = nullptr);

    Q_INVOKABLE void navigateClickHandler();

signals:

public slots:
};

#endif // SERVICEVIEWMODEL_H
