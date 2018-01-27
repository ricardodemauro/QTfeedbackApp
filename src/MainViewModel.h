#ifndef MAINVIEWMODEL_H
#define MAINVIEWMODEL_H

#include <QObject>
#include <QTimer>
#include <src/constants.h>
#include <src/services/appService.h>
#include <src/models/feedbackModel.h>

class MainViewModel : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString currentPage READ currentPage NOTIFY currentPageChanged)

    Q_PROPERTY(int currentPageIndex READ currentPageIndex NOTIFY currentPageIndexChanged)

public:
    explicit MainViewModel(QObject *parent = nullptr);

    Q_INVOKABLE void adminClickHandler();

    Q_INVOKABLE void initHandler();

    Q_INVOKABLE void quitHandler();

    Q_INVOKABLE void startButtonHandler();

    Q_INVOKABLE void leaveCommentButtonHandler();

    Q_INVOKABLE void setSelectedServiceHandler(QString service);

    Q_INVOKABLE void setFeedbackRateHandler(int feedbackId);

    Q_INVOKABLE void onCommentChangedHandler(QString comment);

    Q_INVOKABLE void onDoneButtonHandler();

    Q_INVOKABLE void onLoadThanksPageHandler();

    Q_INVOKABLE void onLoadCommentPageHandler();

    QString currentPage();

	PAGE currentPageIndex();
    void setCurrentPageIndex(const PAGE &page);

//    ~MainViewModel();

public slots:
    void timeElapsedSlot();

signals:
    void currentPageChanged();

    void currentPageIndexChanged();

    void pageTimeout(int value);

private:
	PAGE m_currentPageIndex;

    Services::AppService m_appService;

    Models::FeedbackModel m_feedbackModel;

    //QTimer *m_timer;

    void gotoPage(const PAGE &pageIndex);
};

#endif // MAINVIEWMODEL_H
