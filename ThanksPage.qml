import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    id: pageThanks
    title: "Thanks Page"

    signal commentClicked()
    signal loaded()

    Component.onCompleted: loaded()

    Label {
        id: labelTitle
        text: qsTr("If you would like to leave a comment, click the\nbutton below.")
        anchors.topMargin: parent.height * 0.3
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Qt.application.font.pixelSize * 2
    }

    Button {
        id: buttonLeaveComment
        text: qsTr("Leave a comnent")
        anchors.topMargin: parent.height * 0.6
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: commentClicked()
    }
}
