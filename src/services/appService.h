#ifndef APPSERVICE_H
#define APPSERVICE_H

#include <src/models/feedbackModel.h>
#include <QTime>

namespace Services
{
    class AppService
	{
	public:
        void save();

        Models::FeedbackModel feedbackModel();

        void setService(const QString &service);
        void setFeedbackRate(const int &feedbackRate);
        void setComment(const QString &comment);
        void setTime(const QTime &time);

        static AppService& getInstance()
        {
            static AppService instance;
            return instance;
        }
	private:

		/*private constructor for singleton service*/
        AppService();

        // Stop the compiler generating methods of copy the object
        AppService(AppService const& copy);               // Not Implemented
        AppService& operator =(AppService const& copy);   // Not Implemented

        Models::FeedbackModel m_feedbackModel;
	};
}

#endif // APPSERVICE_H
