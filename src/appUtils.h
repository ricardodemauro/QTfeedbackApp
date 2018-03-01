#ifndef APPUTILS_H
#define APPUTILS_H

#include <QObject>
#include <QJSValue>
#include <QQmlEngine>
#include <QKeySequence>
#include <src/services/xmlService.h>

class AppUtils : public QObject
{
    Q_OBJECT
public:
    AppUtils(QObject* parent = 0, int fontSize = 32, int secondaryFontSize = 28);

    ~AppUtils() {}

    Q_PROPERTY(int FontSize READ FontSize NOTIFY fontSizeChanged)
    Q_PROPERTY(int SecondaryFontSize READ SecondaryFontSize NOTIFY secondaryFontSizeChanged)

    Q_INVOKABLE uint stringToQtKey(QString text);

    Q_INVOKABLE QString getService(int serviceIndex);

    Q_INVOKABLE QString getFeedbackPageTitle();

    Q_INVOKABLE QString getFeedbackPageSubtitle();

    Q_INVOKABLE QString getFeedbackPageSubtitle2();

    int FontSize();

    int SecondaryFontSize();

signals:
    void fontSizeChanged();
    void secondaryFontSizeChanged();

private:
    int m_appFontSize;
    int m_appSecondaryFontSize;
    Services::XmlService m_xmlService;
};



#endif // APPUTILS_H
