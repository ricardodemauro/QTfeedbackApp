#include "pageMainViewModel.h"
#include <src/constants.h>

PageMainViewModel::PageMainViewModel(QObject *parent) :
    QObject(parent),
    PageViewModelBase("PageMainViewModel"),
    m_currentPageIndex(Constants::Pages::Service)
{

}

QString PageMainViewModel::currentPage()
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

bool PageMainViewModel::canGoBack()
{
    bool _canGoBack = currentPageIndex() > (PAGE)Constants::Pages::Service;
    return _canGoBack;
}

void PageMainViewModel::backPageHandler()
{
    int _currentPage = currentPageIndex();
    switch (_currentPage) {
    case Constants::Pages::Service:
    case Constants::Pages::Feedback:
        break;
    case Constants::Pages::Thanks:
        gotoPage(Constants::Pages::Feedback);
        break;
    case Constants::Pages::Comment:
        gotoPage(Constants::Pages::Thanks);
        break;
    default:
        break;
    }
}

void PageMainViewModel::nextPageHandler()
{
    int _currentPage = currentPageIndex();
    switch (_currentPage) {
    case Constants::Pages::Service:
        gotoPage(Constants::Pages::Feedback);
        break;
    case Constants::Pages::Feedback:
        gotoPage(Constants::Pages::Thanks);
        break;
    case Constants::Pages::Thanks:
        gotoPage(Constants::Pages::Comment);
        break;
    case Constants::Pages::Comment:
        gotoPage(Constants::Pages::Feedback);
        break;
    default:
        break;
    }
}

void PageMainViewModel::resetPageHandler()
{
    gotoPage(Constants::Pages::Service);
}

void PageMainViewModel::adminClickHandler()
{
    gotoPage(Constants::Pages::Service);
}

PAGE PageMainViewModel::currentPageIndex()
{
    return m_currentPageIndex;
}

void PageMainViewModel::setCurrentPageIndex(const PAGE &page)
{
    int pageIndex = page;
    if(m_currentPageIndex == pageIndex)
        return;

    m_currentPageIndex = pageIndex;

    emit currentPageIndexChanged();
}

void PageMainViewModel::gotoPage(const PAGE & pageIndex)
{
    setCurrentPageIndex(pageIndex);
    emit currentPageChanged();
    emit canGoBackChanged();
}
