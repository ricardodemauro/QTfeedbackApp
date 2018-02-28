#include <src/services/xmlService.h>
#include <src/constants.h>
#include <QDebug>
#include <QFile>

Services::XmlService::XmlService(QString connectionString) :
    m_connectionString(connectionString)
{

}

Services::XmlService::XmlService() :
    m_connectionString(Constants::FILE_SERVICES)
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
    if(!m_initialized)
    {
        init();
    }
    if(index < m_services.size())
    {
        return m_services[index];
    }
    else
    {
        return "Option N";
    }
}

void Services::XmlService::read()
{
    QFile xmlFile(m_connectionString);
    xmlFile.open(QIODevice::ReadOnly);

    xmlReader.setDevice(&xmlFile);

    if(xmlReader.readNextStartElement() && xmlReader.name() == "services")
    {
        processService();
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

QString Services::XmlService::readNextText()
{
#ifndef USE_READ_ELEMENT_TEXT
    xmlReader.readNext();
    return xmlReader.text().toString();
#else
    return xmlReader.readElementText();
#endif
}
