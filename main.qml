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
    title: qsTr("AppName")

    Component.onCompleted: mainVM.initHandler()
    visibility: Window.Maximized

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
                text: "‹"
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
        }
    }

    footer: ToolBar {
        RowLayout {
            anchors.fill: parent

            Button {
                onClicked: mainVM.quitHandler()
                text: qsTr("Quit")
                highlighted: true
                anchors.left: parent.left
                anchors.leftMargin: 40
                anchors.verticalCenter: parent.verticalCenter
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
