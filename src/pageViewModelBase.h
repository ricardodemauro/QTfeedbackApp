#ifndef VIEWMODELBASE_H
#define VIEWMODELBASE_H

#include <QObject>
#include <src/constants.h>
#include <src/interfaces/iHandleNavigationViewModel.h>
#include <src/interfaces/iNavigationService.h>
#include <src/messages/navigateMessage.h>

using namespace Interfaces;
using namespace Messages;

class PageViewModelBase
{
public:
	PageViewModelBase(std::string name);

protected:
	void navigateToPage(const PAGE &page);

private:
	std::string m_name;
};

#endif // VIEWMODELBASE_H
