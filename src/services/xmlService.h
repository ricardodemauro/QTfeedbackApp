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
        QString getFeedbackTitle();
        QString getFeedbackSubtitle();
        QString getFeedbackSubtitle2();
    private:
        QString m_connectionString;
        std::vector<QString> m_services;
        QString m_feedbackTitle;
        QString m_feedbackSubtitle;
        QString m_feedbackSubtitle2;
        bool m_initialized;

        void read();
        void processService();
        void processFeedback();
        QString readNextText();
        QString errorString();

        QXmlStreamReader xmlReader;
	};
}

#endif // XMLSERVICE_H
