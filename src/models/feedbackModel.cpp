#include <src/models/feedbackModel.h>

namespace Models
{
void FeedbackModel::setTimestamp(const QTime &time)
{
    m_time = time;
}

void FeedbackModel::setService(const QString &service)
{
    m_service = service;
}

void FeedbackModel::setFeedbackRate(const int &feedbackRate)
{
    m_feedback_rate = feedbackRate;
}

void FeedbackModel::setComment(const QString &comment)
{
    m_comment = comment;
}

QTime FeedbackModel::time()
{
    return m_time;
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
