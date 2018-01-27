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
        AppService();
	public:
        void addService(FeedbackModel &model);
        void init();

    private:
        void save(const QUuid &id, const QDate &date, const QTime &time, FeedbackModel &model);
	};
}

#endif // APPSERVICE_H
