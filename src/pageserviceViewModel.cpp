#include "pageServiceViewModel.h"
#include <QCoreApplication>
#include <src/constants.h>
//#include <src/services/appService.h>
#include <QString>

PageServiceViewModel::PageServiceViewModel(QObject *parent) :
	QObject(parent),
    PageViewModelBase("PageServiceViewModel"),
    m_questionText("Hello world"),
    m_selectedFeedback(Constants::DEFAULT_SELECTED_FEEDBACK)
{

}

void PageServiceViewModel::startClickHandler()
{
    //Services::AppService::getInstance().setService(QString::number(m_selectedFeedback));

    navigateToPage(Constants::Pages::Feedback);
}

void PageServiceViewModel::quitClickHandler()
{
    QCoreApplication::quit();
}

void PageServiceViewModel::setSelectedFeedback(int &feedback)
{
    if(m_selectedFeedback == feedback)
        return;

    m_selectedFeedback = feedback;
    emit selectedFeedbackChanged();
}

int PageServiceViewModel::selectedFeedback()
{
    return m_selectedFeedback;
}

QString PageServiceViewModel::questionText()
{
    return m_questionText;
}
