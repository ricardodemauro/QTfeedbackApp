#include <src/models/feedbackModel.h>

namespace Models
{

    void FeedbackModel::setService(QString &service)
    {
        m_service = service;
    }

    void FeedbackModel::setFeedbackRate(int &feedbackRate)
    {
        m_feedback_rate = feedbackRate;
    }

    void FeedbackModel::setComment(QString &comment)
    {
        m_comment = comment;
    }

    QString FeedbackModel::service()
    {
        return m_service;
    }

    int FeedbackModel::feedbackRate()
    {
        return m_feedback_rate;
    }

    QString FeedbackModel::comment()
    {
        return m_comment;
    }

}
