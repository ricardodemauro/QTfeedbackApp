#ifndef IHANDLE_NAVIGATION_VM_H
#define IHANDLE_NAVIGATION_VM_H

#include <src/messages/navigateMessage.h>

namespace Interfaces
{
    class IHandleNavigationViewModel
    {
    public:
        virtual void getNavigationMessage(Messages::NavigateMessage &message) = 0;
	};
}

#endif // IHANDLE_NAVIGATION_VM_H
