#ifndef NAVIGATIONSERVICE_H
#define NAVIGATIONSERVICE_H

#include <src/pageViewModelBase.h>
#include <src/messages/navigateMessage.h>
#include <map>

namespace Services
{
    class NavigationService
	{
	public:
		void navigate(Messages::NavigateMessage &message);

        void registerListener(std::string &name, void *viewModel);

		void unregisterListener(std::string &name);

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

		std::map<std::string, PageViewModelBase*> m_listeners;
	};
}

#endif // NAVIGATIONSERVICE_H
