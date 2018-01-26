#ifndef SERVICEVIEWMODEL_H
#define SERVICEVIEWMODEL_H

#include <QObject>

class ServiceViewModel : public QObject
{
    Q_OBJECT
public:
    explicit ServiceViewModel(QObject *parent = nullptr);

signals:

public slots:
};

#endif // SERVICEVIEWMODEL_H