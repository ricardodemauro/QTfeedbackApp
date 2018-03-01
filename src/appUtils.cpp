#include <src/appUtils.h>

AppUtils::AppUtils(QObject *parent, int fontSize, int secondaryFontSize)
    : QObject(parent),
      m_appFontSize(fontSize),
      m_appSecondaryFontSize(secondaryFontSize)
{
}

uint AppUtils::stringToQtKey(QString text)
{
    const QString key = text;
    QKeySequence sequence = QKeySequence::fromString(key);
    uint keyCode = sequence[0];
    return keyCode;
}

QString AppUtils::getService(int serviceIndex)
{
    return m_xmlService.getService(serviceIndex);
}

QString AppUtils::getFeedbackPageTitle()
{
    return m_xmlService.getFeedbackTitle();
}

QString AppUtils::getFeedbackPageSubtitle()
{
    return m_xmlService.getFeedbackSubtitle();
}

QString AppUtils::getFeedbackPageSubtitle2()
{
    return m_xmlService.getFeedbackSubtitle2();
}

int AppUtils::FontSize()
{
    return m_appFontSize;
}

int AppUtils::SecondaryFontSize()
{
    return m_appSecondaryFontSize;
}
