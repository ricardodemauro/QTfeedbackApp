import QtQuick 2.9
import QtQuick.Window 2.3

import QtQuick.Controls 2.2

import feedbackapp.backend 1.0

Page {
    id: page
    visible: true

    PageServiceViewModel {
        id: svcVM
        selectedFeedback: 1
    }

    header: Label {
        text: "Please choose the service you'r running today:"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Qt.application.font.pixelSize * 2

        padding: 10
    }

    footer: Rectangle {
        id: footerRectangle
        width: parent.width
        height: 50
        color: "white"
        transformOrigin: Item.Center
        anchors.horizontalCenter: parent.horizontalCenter

        Button {
            anchors.horizontalCenterOffset: parent.width * -0.2
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: svcVM.startClickHandler()
            text: "Start"
            highlighted: true
        }
        Button {
            anchors.horizontalCenterOffset: parent.width * 0.2
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: svcVM.quitClickHandler()
            text: "Quit"
        }
    }

    Column {
        anchors.centerIn: parent
        GroupBox {
            Column{
                RadioButton { text: qsTr("Option 1"); checked: svcVM.selectedFeedback == 1; onClicked: function() { svcVM.selectedFeedback = 1 }; }
                RadioButton { text: qsTr("Option 2"); checked: svcVM.selectedFeedback == 2; onClicked: function() { svcVM.selectedFeedback = 2 } }
                RadioButton { text: qsTr("Option 3"); checked: svcVM.selectedFeedback == 3; onClicked: function() { svcVM.selectedFeedback = 3 } }
                RadioButton { text: qsTr("Option 4"); checked: svcVM.selectedFeedback == 4; onClicked: function() { svcVM.selectedFeedback = 4 } }
                RadioButton { text: qsTr("Option 5"); checked: svcVM.selectedFeedback == 5; onClicked: function() { svcVM.selectedFeedback = 5 } }
            }
        }
    }
}
