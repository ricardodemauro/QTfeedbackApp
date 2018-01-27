#include <src/services/appService.h>
#include <src/thirdpart/csvfile.h>
#include <QDebug>

namespace Services {
    void AppService::save(const QUuid &id, const QDate &date, const QTime &time, FeedbackModel &model)
    {
        qDebug() << "saving model";
//        try
//        {
//            csvfile csv(Constants::FILE_CSV);
//            // header
//            csv << "X" << "VALUE"        << endrow;
//            // Data
//            csv <<  1  << "String value" << endrow;
//            csv <<  2  << 123            << endrow;
//            csv <<  3  << 1.f            << endrow;
//            csv <<  4  << 1.2            << endrow;
//        }
//        catch(const std::exception& ex)
//        {
//            qDebug() << "Error trying to save model";
//            qDebug() << ex.what();
//        }
        qDebug() << id.toString() << "," << date.toString(Qt::DateFormat::ISODate) << time.toString(Qt::DateFormat::SystemLocaleLongDate) << ",";
        qDebug() << model.service() << "," << model.feedbackRate() << "," << model.comment();
    }

    AppService::AppService()
    {

    }

    void AppService::addService(FeedbackModel &model)
    {
        QTime time = QTime::currentTime();
        QDate date = QDate::currentDate();
        QUuid id = QUuid::createUuid();
        save(id, date, time, model);
    }

    void AppService::init()
    {

    }
}

