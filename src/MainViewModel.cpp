#include "MainViewModel.h"
#include <src/constants.h>
#include <memory>
#include <QCoreApplication>

MainViewModel::MainViewModel(QObject *parent) :
    QObject(parent),
    m_appService(Constants::FILE_CSV)
{
    m_timer = new QTimer(this);
}

void MainViewModel::adminClickHandler()
{
    gotoPage(Constants::Pages::Service);
}

void MainViewModel::initHandler()
{
    connect(m_timer, SIGNAL(timeout()), this, SLOT(timeElapsedSlot()));
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
    m_feedbackModel.setComment(comment);
    restartTimer();
}

void MainViewModel::onLoadThanksPageHandler()
{
    restartTimer();
}

void MainViewModel::onLoadCommentPageHandler()
{
    restartTimer();
}

void MainViewModel::onDoneButtonHandler()
{
    save();
}

void MainViewModel::onFeedbackPageHandler()
{
    stopTimer();
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

MainViewModel::~MainViewModel()
{
    if(m_timer != nullptr)
        delete m_timer;
}

void MainViewModel::timeElapsedSlot()
{
    save();
}

void MainViewModel::gotoPage(const PAGE &pageIndex)
{
    setCurrentPageIndex(pageIndex);
    emit currentPageChanged();
}

void MainViewModel::restartTimer()
{
    m_timer->stop();
    m_timer->start(Constants::TIMER_COUNTDOWN);
}

void MainViewModel::stopTimer()
{
    m_timer->stop();
}

void MainViewModel::save()
{
    stopTimer();

    m_appService.addService(m_feedbackModel);

    QString emptyComment;
    m_feedbackModel.setComment(emptyComment);

    gotoPage(Constants::Pages::Feedback);
}
