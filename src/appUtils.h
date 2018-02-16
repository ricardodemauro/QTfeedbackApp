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
    AppUtils(QObject* parent = 0, int fontSize = 32, int secondaryFontSize = 28);

    ~AppUtils() {}

    Q_PROPERTY(int FontSize READ FontSize NOTIFY fontSizeChanged)
    Q_PROPERTY(int SecondaryFontSize READ SecondaryFontSize NOTIFY secondaryFontSizeChanged)

    Q_INVOKABLE uint stringToQtKey(QString text);

    int FontSize();

    int SecondaryFontSize();

signals:
    void fontSizeChanged();
    void secondaryFontSizeChanged();

private:
    int m_appFontSize;
    int m_appSecondaryFontSize;
};



#endif // APPUTILS_H
