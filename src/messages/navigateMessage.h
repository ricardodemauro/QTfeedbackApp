#ifndef NAVIGATEMESSAGE_H
#define NAVIGATEMESSAGE_H

#include <qstring.h>
#include <src/constants.h>

namespace Messages {
	class NavigateMessage
	{
	public:
		NavigateMessage(PAGE pageName);
		PAGE Page();

	private:
		PAGE m_page;
	};
}


#endif // NAVIGATEMESSAGE_H
