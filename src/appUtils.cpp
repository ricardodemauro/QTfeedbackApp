#include <src/appUtils.h>


AppUtils::AppUtils(QObject *parent, int fontSize)
    : QObject(parent),
      m_appFontSize(fontSize)
{
}

uint AppUtils::stringToQtKey(QString text)
{
    const QString key = text;
    QKeySequence sequence = QKeySequence::fromString(key);
    uint keyCode = sequence[0];
    return keyCode;
}

int AppUtils::FontSize()
{
    return m_appFontSize;
}
