import QtQuick 2.9
import QtQuick.Window 2.10
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import feedbackapp.backend 1.0

ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 1024
    height: 768
    title: qsTr("AppName")

    PageMainViewModel {
        id: mainVM
        onCurrentPageChanged: view.currentIndex = mainVM.currentPageIndex
    }

    Component.onCompleted: {
        //applicationWindow.showFullScreen()
        applicationWindow.setHeight(800)
        applicationWindow.setWidth(1280)
        mainVM.initHandler()
    }

    header: ToolBar {
        visible: Window.Hidden
        RowLayout {
            anchors.fill: parent
            ToolButton {
                text: "‹"
                enabled: view.currentIndex > 0
                onClicked: view.currentIndex--
                visible: false
            }
            Label {
                text: view.children[view.currentIndex].title
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
            ToolButton {
                text: "›"
                enabled: view.currentIndex + 1 < view.count
                onClicked: view.currentIndex++
                visible: false
            }
        }
    }

    footer: PageIndicator {
        id: indicator

        count: view.count
        currentIndex: view.currentIndex

        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }

    StackLayout {
        id: view
        anchors.fill: parent
        onCurrentIndexChanged: {
            if(view.currentIndex == 1) {
                mainVM.onFeedbackPageHandler()
            }
            else if(view.currentIndex == 2) {
                mainVM.onLoadThanksPageHandler()
            }
            else if(view.currentIndex == 3)
            {
                mainVM.onLoadCommentPageHandler()
                commentPage.comment = ""
                commentPage.loaded()
            }
        }

        ServicePage {
            id: servicePage
            title: qsTr("Service")
            onServiceSelected: function(service) { mainVM.setSelectedServiceHandler(service) }
            onQuitClicked: mainVM.quitHandler()
            onStartClicked: mainVM.startButtonHandler()
        }

        FeedbackPage {
            id: feedbackPage
            title: qsTr("Feedback")
            onAdminClicked: function() { mainVM.adminClickHandler() }
            onFeedbackSelected: function(feedbackId) { mainVM.setFeedbackRateHandler(feedbackId) }
        }

        ThanksPage {
            id: thanksPage
            title: qsTr("Thanks")
            onCommentClicked: mainVM.leaveCommentButtonHandler()
        }

        LeaveCommentPage {
            id: commentPage
            title: qsTr("Comments")
            onDoneClicked: mainVM.onDoneButtonHandler()
            onCommentTextChanged: function(text) { mainVM.onCommentChangedHandler(text) }
        }
    }
}
