#ifndef MAINVIEWMODEL_H
#define MAINVIEWMODEL_H

#include <QObject>
#include <src/constants.h>
#include <src/pageViewModelBase.h>
#include <src/interfaces/iHandleNavigationViewModel.h>

class PageMainViewModel :
        public QObject,
        public PageViewModelBase,
        public Interfaces::IHandleNavigationViewModel
{
    Q_OBJECT

    Q_PROPERTY(QString currentPage READ currentPage NOTIFY currentPageChanged)

    Q_PROPERTY(PAGE currentPageIndex READ currentPageIndex WRITE setCurrentPageIndex NOTIFY currentPageIndexChanged)

    Q_PROPERTY(bool canGoBack READ canGoBack NOTIFY canGoBackChanged)
public:
    explicit PageMainViewModel(QObject *parent = nullptr);

    Q_INVOKABLE void backPageHandler();

    Q_INVOKABLE void nextPageHandler();

    Q_INVOKABLE void resetPageHandler();

    Q_INVOKABLE void adminClickHandler();

    Q_INVOKABLE void initHandler();

    QString currentPage();

    bool canGoBack();

	PAGE currentPageIndex();
    void setCurrentPageIndex(const PAGE &page);

    void getNavigationMessage(Messages::NavigateMessage &message);
signals:
    void currentPageChanged();
    void currentPageIndexChanged();
    void canGoBackChanged();

private:
	PAGE m_currentPageIndex;

    void gotoPage(const PAGE &pageIndex);

    void registerListenerNavigation();
};

#endif // MAINVIEWMODEL_H
