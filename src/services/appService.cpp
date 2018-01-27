#include <src/services/appService.h>
#include <src/thirdpart/csvfile.h>

#include <QDebug>
#include <QFile>
#include <QFileInfo>

#include <sstream>
#include <iostream>
#include <string>

namespace Services {
    void AppService::save(const QUuid &id, const QDate &date, const QTime &time, FeedbackModel &model)
    {
        qDebug() << "saving model";
        qDebug() << id.toString() << "," << date.toString(Qt::DateFormat::ISODate) << time.toString(Qt::DateFormat::SystemLocaleLongDate) << ",";
        qDebug() << model.service() << "," << model.feedbackRate() << "," << model.comment();

        QFileInfo checkFile(m_connectionString);
        if(checkFile.exists())
        {
             QFile file(m_connectionString);
             if(file.open(QIODevice::WriteOnly | QIODevice::Append))
             {
                 QTextStream ss(&file);

                 ss << id.toString().toUtf8().constData();
                 ss << ",";
                 ss << date.toString(Qt::DateFormat::ISODate).toUtf8().constData();
                 ss << " ";
                 ss << time.toString(Qt::DateFormat::ISODate).toUtf8().constData();
                 ss << ",";
                 ss << model.service().toUtf8().constData();
                 ss << ",";
                 ss << model.feedbackRate();
                 ss << ",";
                 ss << model.comment().toUtf8().constData();
                 ss << "\n";
             }
        }
        else
        {
            qDebug() << "file not found at " << checkFile.absoluteFilePath();
        }
    }

    AppService::AppService(QString connectionString) :
        m_connectionString(connectionString)
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
       QFileInfo checkFile(m_connectionString);
       if(!checkFile.exists())
       {
            QFile data(m_connectionString);
            if(data.open(QFile::WriteOnly | QFile::Truncate))
            {
                QTextStream out(&data);
                out << "Id,Timestamp,Service,Feedback,Comment\n";
                data.close();
            }
       }
    }
}

