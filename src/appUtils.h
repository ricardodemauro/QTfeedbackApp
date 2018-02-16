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
    AppUtils(QObject* parent = 0, int fontSize = 32);

    ~AppUtils() {}

    Q_PROPERTY(int FontSize READ FontSize NOTIFY fontSizeChanged)

    Q_INVOKABLE uint stringToQtKey(QString text);

    int FontSize();

signals:
    void fontSizeChanged();

private:
    int m_appFontSize;
};



#endif // APPUTILS_H
