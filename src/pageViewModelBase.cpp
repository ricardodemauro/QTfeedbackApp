#include "pageViewModelBase.h"
#include <src/services/navigationService.h>

PageViewModelBase::PageViewModelBase(std::string name) :
    m_name(name)
{

}

void PageViewModelBase::navigateToPage(const PAGE & page)
{
    Messages::NavigateMessage msg(page);
    Services::NavigationService::getInstance().navigate(msg);
}
