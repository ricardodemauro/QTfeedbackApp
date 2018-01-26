#include <src/services/navigationService.h>
#include <map>
#include <iostream>
#include <src/interfaces/iHandleNavigationViewModel.h>

namespace Services
{
	NavigationService::NavigationService()
	{

	}


	void NavigationService::navigate(Messages::NavigateMessage &message)
	{
        m_listener.get()->getNavigationMessage(message);
	}

    void NavigationService::registerListener(std::shared_ptr<Interfaces::IHandleNavigationViewModel> &viewModel)
	{
		m_listener = viewModel;
	}

}
