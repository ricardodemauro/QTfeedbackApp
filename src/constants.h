#ifndef CONSTANTS_H
#define CONSTANTS_H

#include <QString>

typedef int PAGE;

namespace Constants
{
    const QString PAGE_FEEDBACK = "FeedbackPage.qml";
    const QString PAGE_SERVICE = "ServicePage.qml";
    const QString PAGE_THANKS = "ThanksPage.qml";
    const QString PAGE_COMMENT = "LeaveCommentPage.qml";

	const QString PAGE_VM_MAIN = "MainVM";

    const QString MESSAGE_NAVIGATE = "Nav";

    const std::string FILE_CSV = "feedback.csv";

    const int DEFAULT_SELECTED_FEEDBACK = 1;

    enum Pages
    {
        Service = 0,
        Feedback = 1,
        Thanks = 2,
        Comment = 3
    };
}

#endif // CONSTANTS_H
