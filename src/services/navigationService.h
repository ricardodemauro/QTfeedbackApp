#ifndef NAVIGATIONSERVICE_H
#define NAVIGATIONSERVICE_H

#include <src/messages/navigateMessage.h>
#include <vector>
#include <QString>
#include <src/interfaces/iHandleNavigationViewModel.h>
#include <memory>

namespace Services
{
    class NavigationService
	{
	public:
		void navigate(Messages::NavigateMessage &message);

        void registerListener(std::shared_ptr<Interfaces::IHandleNavigationViewModel> &viewModel);

        static NavigationService& getInstance()
        {
            static NavigationService instance;
            return instance;
        }
	private:

		/*private constructor for singleton service*/
		NavigationService();

        // Stop the compiler generating methods of copy the object
        NavigationService(NavigationService const& copy);               // Not Implemented
        NavigationService& operator =(NavigationService const& copy);   // Not Implemented

        std::shared_ptr<Interfaces::IHandleNavigationViewModel> m_listener;
	};
}

#endif // NAVIGATIONSERVICE_H
