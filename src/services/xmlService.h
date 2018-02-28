#ifndef XMLSERVICE_H
#define XMLSERVICE_H

#include <src/models/feedbackModel.h>
#include <QXmlStreamReader>

using namespace Models;

namespace Services
{
    class XmlService
	{
    public:
        XmlService(QString connectionString);
        XmlService();
	public:
        void init();
        QString getService(const int &index);
    private:
        QString m_connectionString;
        std::vector<QString> m_services;
        bool m_initialized;

        void read();
        void processService();
        QString readNextText();
        QString errorString();

        QXmlStreamReader xmlReader;
	};
}

#endif // XMLSERVICE_H
