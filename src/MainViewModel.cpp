#include "MainViewModel.h"
#include <src/constants.h>
#include <memory>
#include <QCoreApplication>
#include <QDebug>

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
    qDebug() << "slot connected";
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
    qDebug() << "user typed in comment box, restarting timer";
    m_feedbackModel.setComment(comment);
    restartTimer();
}

void MainViewModel::onLoadThanksPageHandler()
{
    qDebug() << "thanks page loaded, starting timer";
    restartTimer();
}

void MainViewModel::onLoadCommentPageHandler()
{
    qDebug() << "comment page loaded, restarting timer";
    restartTimer();
}

void MainViewModel::onDoneButtonHandler()
{
    qDebug() << "done button pressed, recording result";
    save();
}

void MainViewModel::onFeedbackPageHandler()
{
    qDebug() << "feedback page loaded, ending timer";
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
    qDebug() << "time elapsed, recording result";
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
    qDebug() << "timer restarted with elapsed time of " << Constants::TIMER_COUNTDOWN;
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
