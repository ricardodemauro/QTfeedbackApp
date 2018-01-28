#ifndef APPUTILS_H
#define APPUTILS_H

#include <QObject>
#include <QJSValue>
#include <QQmlEngine>
#include <QKeySequence>

class AppUtils : public QObject
{
    Q_OBJECT
public:
    AppUtils(QObject* parent = 0)
        : QObject(parent)
    {
    }

    ~AppUtils() {}

    Q_INVOKABLE uint stringToQtKey(QString text)
    {
        const QString key = text;
        QKeySequence sequence = QKeySequence(key);
        uint keyCode = sequence[0];
        return keyCode;
    }
};

static QObject *appUtilsSingletonProvider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    AppUtils *example = new AppUtils();
    return example;
}

#endif // APPUTILS_H
