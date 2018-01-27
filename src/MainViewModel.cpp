#include "MainViewModel.h"
#include <src/constants.h>
#include <memory>
#include <QCoreApplication>
#include <QDebug>

MainViewModel::MainViewModel(QObject *parent) :
    QObject(parent)
{

}

void MainViewModel::adminClickHandler()
{
    gotoPage(Constants::Pages::Service);
}

void MainViewModel::initHandler()
{
    //m_timer = new QTimer(this);
    //connect(m_timer, SIGNAL(timeout()), this, SLOT(timeElapsedSlot()));
    m_appService.init();
}

void MainViewModel::quitHandler()
{
    QCoreApplication::quit();
}

void MainViewModel::startButtonHandler()
{
    gotoPage(Constants::Pages::Feedback);
}

void MainViewModel::leaveCommentButtonHandler()
{
    gotoPage(Constants::Pages::Comment);
}

void MainViewModel::setSelectedServiceHandler(QString service)
{
    m_feedbackModel.setService(service);
}

void MainViewModel::setFeedbackRateHandler(int feedbackId)
{
    m_feedbackModel.setFeedbackRate(feedbackId);
    gotoPage(Constants::Pages::Thanks);
}

void MainViewModel::onCommentChangedHandler(QString comment)
{
    setComment(comment);
}

void MainViewModel::onLoadThanksPageHandler()
{
    qDebug() << "thanks page loaded";
    //m_timer->start(Constants::TIMER_COUNTDOWN);
}

void MainViewModel::onLoadCommentPageHandler()
{
    qDebug() << "comment page loaded";
}

void MainViewModel::onDoneButtonHandler()
{
    m_appService.addService(m_feedbackModel);

    gotoPage(Constants::Pages::Feedback);
}

QString MainViewModel::currentPage()
{
    switch (m_currentPageIndex)
    {
    case Constants::Pages::Comment:
        return Constants::PAGE_COMMENT;
    case Constants::Pages::Feedback:
        return Constants::PAGE_FEEDBACK;
    case Constants::Pages::Service:
        return Constants::PAGE_SERVICE;
    case Constants::Pages::Thanks:
        return Constants::PAGE_THANKS;
    default:
        return "";
    }
}

QString MainViewModel::comment()
{
    return m_feedbackModel.comment();
}

void MainViewModel::setComment(QString &comment)
{
    m_feedbackModel.setComment(comment);
}

PAGE MainViewModel::currentPageIndex()
{
    return m_currentPageIndex;
}

void MainViewModel::setCurrentPageIndex(const PAGE &page)
{
    int pageIndex = page;
    if(m_currentPageIndex == pageIndex)
        return;

    m_currentPageIndex = pageIndex;
}

//MainViewModel::~MainViewModel()
//{
//    if(m_timer != nullptr)
//        delete m_timer;
//}

void MainViewModel::timeElapsedSlot()
{
    qDebug() << "time elapsed ";
}

void MainViewModel::gotoPage(const PAGE &pageIndex)
{
    setCurrentPageIndex(pageIndex);
    emit currentPageChanged();
}

