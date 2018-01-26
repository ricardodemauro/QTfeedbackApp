#ifndef INAVIGATION_SERVICE_H
#define INAVIGATION_SERVICE_H

#include <src/messages/navigateMessage.h>

using namespace Messages;

namespace Interfaces
{
    class INavigationService
    {
    public:
		virtual void navigate(NavigateMessage &message) = 0;

        virtual void registerListener(std::string &name, void *viewModel) = 0;

		virtual void unregisterListener(std::string &name) = 0;
	};
}

#endif // INAVIGATION_SERVICE_H
