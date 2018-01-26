#include <src/services/appService.h>
#include <src/services/logService.h>
#include <src/thirdpart/csvfile.h>
#include <src/constants.h>

namespace Services {
    void AppService::save()
    {
        LogService::trace("saving model");
        try
        {
            csvfile csv(Constants::FILE_CSV);
            // header
            csv << "X" << "VALUE"        << endrow;
            // Data
            csv <<  1  << "String value" << endrow;
            csv <<  2  << 123            << endrow;
            csv <<  3  << 1.f            << endrow;
            csv <<  4  << 1.2            << endrow;
        }
        catch(const std::exception& ex)
        {
            LogService::trace("Error trying to save model");
            LogService::trace(ex.what());
        }
    }

    Models::FeedbackModel AppService::feedbackModel()
    {
        return m_feedbackModel;
    }

    void AppService::setService(const QString &service)
    {
        m_feedbackModel.setService(service);
    }

    void AppService::setComment(const QString &comment)
    {
        m_feedbackModel.setComment(comment);
    }

    void AppService::setFeedbackRate(const int &feedbackRate)
    {
        m_feedbackModel.setFeedbackRate(feedbackRate);
    }

    void AppService::setTime(const QTime &time)
    {
        m_feedbackModel.setTimestamp(time);
    }
}

