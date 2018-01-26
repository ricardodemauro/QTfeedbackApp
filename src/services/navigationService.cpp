#include <src/services/navigationService.h>

namespace Services
{
    NavigationService::NavigationService()
    {

    }

    void NavigationService::unregisterListener(std::string &name)
    {
        m_listeners.erase(name);
    }

    void NavigationService::navigate(Messages::NavigateMessage &message)
    {
        for(std::map<std::string, PageViewModelBase*>::iterator it = m_listeners.begin(); it != m_listeners.end(); ++it)
        {

        }
    }

    void NavigationService::registerListener(std::string & name, void *viewModel)
	{
	}

}
