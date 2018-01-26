#include "navigatemessage.h"

namespace Messages {
    NavigateMessage::NavigateMessage(PAGE page) :
        m_page(page)
    {

    }

    PAGE NavigateMessage::Page()
    {
        return m_page;
    }
}
