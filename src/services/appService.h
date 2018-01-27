#ifndef APPSERVICE_H
#define APPSERVICE_H

#include <src/models/feedbackModel.h>
#include <QTime>
#include <QDate>
#include <QUuid>

using namespace Models;

namespace Services
{
    class AppService
	{
    public:
        AppService(QString connectionString);
	public:
        void addService(FeedbackModel &model);
        void init();

    private:
        void save(const QUuid &id, const QDate &date, const QTime &time, FeedbackModel &model);
        QString m_connectionString;
	};
}

#endif // APPSERVICE_H
