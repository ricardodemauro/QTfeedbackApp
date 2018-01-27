#ifndef FEEDBACKMODEL_H
#define FEEDBACKMODEL_H

#include <QString>
#include <QTime>

namespace Models
{
    class FeedbackModel
    {
    public:
        void setService(QString &service);
        void setFeedbackRate(int &feedbackRate);
        void setComment(QString &comment);

        QString service();
        int feedbackRate();
        QString comment();
    private:
        QString m_service;
        int m_feedback_rate;
        QString m_comment;
    };
}


#endif // FEEDBACKMODEL_H
