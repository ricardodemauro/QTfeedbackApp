#include <src/services/xmlService.h>
#include <src/constants.h>
#include <QDebug>
#include <QFile>

Services::XmlService::XmlService(QString connectionString) :
    m_connectionString(connectionString)
{

}

Services::XmlService::XmlService() :
    m_connectionString(Constants::FILE_CONFIGURATION)
{

}

void Services::XmlService::init()
{
    if(!m_initialized)
    {
        read();
        m_initialized = true;
    }
}

QString Services::XmlService::getService(const int &index)
{
    init();
    if(index < m_services.size())
    {
        return m_services[index];
    }
    else
    {
        return "Option N";
    }
}

QString Services::XmlService::getFeedbackTitle()
{
    init();
    return m_feedbackTitle;
}

QString Services::XmlService::getFeedbackSubtitle()
{
    init();
    return m_feedbackSubtitle;
}

QString Services::XmlService::getFeedbackSubtitle2()
{
    init();
    return m_feedbackSubtitle2;
}

void Services::XmlService::read()
{
    QFile xmlFile(m_connectionString);
    xmlFile.open(QIODevice::ReadOnly);

    xmlReader.setDevice(&xmlFile);

    if(xmlReader.readNextStartElement() && xmlReader.name() == "configuration")
    {
        if(xmlReader.readNextStartElement() && xmlReader.name() == "services")
        {
            processService();
        }
        if(xmlReader.readNextStartElement() && xmlReader.name()  == "feedback")
        {
            processFeedback();
        }
    }


    if(xmlReader.tokenType() == QXmlStreamReader::Invalid)
    {
        xmlReader.readNext();
    }

    if(xmlReader.hasError())
    {
        xmlReader.raiseError();
        qDebug() << xmlReader.errorString();
    }
}

void Services::XmlService::processService()
{
    if(!xmlReader.isStartElement() || xmlReader.name() != "services")
    {
        return;
    }
    QString serviceName;
    while (xmlReader.readNextStartElement())
    {
        if(xmlReader.name() == "service")
        {
            serviceName = readNextText();
            m_services.push_back(serviceName);
#ifndef USE_READ_ELEMENT_TEXT
            xmlReader.skipCurrentElement();
#endif
        }
        else
        {
            xmlReader.skipCurrentElement();
        }
    }
}

void Services::XmlService::processFeedback()
{
    if(!xmlReader.isStartElement() || xmlReader.name() != "feedback")
    {
        return;
    }
    while (xmlReader.readNextStartElement())
    {
        if(xmlReader.name() == "title")
        {
            m_feedbackTitle = readNextText();
#ifndef USE_READ_ELEMENT_TEXT
            xmlReader.skipCurrentElement();
#endif
        }
        else if(xmlReader.name() == "subtitle")
        {
            m_feedbackSubtitle = readNextText();
#ifndef USE_READ_ELEMENT_TEXT
            xmlReader.skipCurrentElement();
#endif
        }
        else if(xmlReader.name() == "subtitle2")
        {
            m_feedbackSubtitle2 = readNextText();
#ifndef USE_READ_ELEMENT_TEXT
            xmlReader.skipCurrentElement();
#endif
        }
        else
        {
            xmlReader.skipCurrentElement();
        }
    }
}

QString Services::XmlService::readNextText()
{
#ifndef USE_READ_ELEMENT_TEXT
    xmlReader.readNext();
    return xmlReader.text().toString();
#else
    return xmlReader.readElementText();
#endif
}
