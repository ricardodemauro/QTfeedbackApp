import QtQuick 2.9
import QtQuick.Window 2.10
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import feedbackapp.backend 1.0

ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("FeedbackApp")

    Component.onCompleted: mainVM.initHandler()

    PageMainViewModel {
        id: mainVM
        onCurrentPageChanged: function() {
            stack.replace(Qt.resolvedUrl(mainVM.currentPage));
            console.info("current page " + mainVM.currentPage);
        }
    }

    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            ToolButton {
                text: qsTr("‹")
                enabled: mainVM.canGoBack
                onClicked: mainVM.backPageHandler()
            }
            Label {
                text: mainVM.currentPage
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
            ToolButton {
                text: qsTr(":")
            }
        }
    }

    StackView {
        id: stack
        anchors.fill: parent
        focus: true
        initialItem: {
            Item : Qt.resolvedUrl("ServicePage.qml")
        }
        onCurrentItemChanged: function(){
            console.info("stackview component item changed")
        }
    }
}
