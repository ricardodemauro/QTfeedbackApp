#ifndef FEEDBACKMODEL_H
#define FEEDBACKMODEL_H

#include <QString>
#include <QTime>

namespace Models
{
    class FeedbackModel
    {
    public:
        void setTimestamp(const QTime &time);
        void setService(const QString &service);
        void setFeedbackRate(const int &feedbackRate);
        void setComment(const QString &comment);

        QTime time();
        QString service();
        int feedbackRate();
        QString comment();
    private:
        QTime m_time;
        QString m_service;
        int m_feedback_rate;
        QString m_comment;
    };
}


#endif // FEEDBACKMODEL_H
