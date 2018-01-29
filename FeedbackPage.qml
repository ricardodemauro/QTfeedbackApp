import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2

Page {
    id: pageFeedback

    property double preferredWidthButton: 120
    property double preferredHeightButton: 180

    signal feedbackSelected(real feedbackId)
    signal adminClicked()

    footer: Rectangle {
        id: footerRectangle
        width: parent.width
        height: 50
        transformOrigin: Item.Center
        anchors.horizontalCenter: parent.horizontalCenter

        Button {
            onClicked: adminClicked()
            text: qsTr("Admin")
            anchors.left: parent.left
            anchors.leftMargin: 40
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Label {
        id: labelTitle
        text: qsTr("How likely are you to recommend...")
        anchors.topMargin: parent.height * 0.1
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Qt.application.font.pixelSize * 2
    }

    RowLayout {
        id: layout
        height: 280
        anchors.rightMargin: 15
        anchors.leftMargin: 15
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.left: parent.left


        ImageButton {
            text: qsTr("Extremely likely")
            Layout.preferredHeight: preferredHeightButton
            source: "shared/images/emoji/extremely_likely.png"
            Layout.fillWidth: true
            Layout.preferredWidth: preferredWidthButton
            onClicked: feedbackSelected(1)
        }

        ImageButton {
            text: qsTr("Likely")
            Layout.preferredHeight: preferredHeightButton
            source: "shared/images/emoji/likely.png"
            Layout.fillWidth: true
            Layout.preferredWidth: preferredWidthButton
            onClicked: feedbackSelected(2)
        }
        ImageButton {
            text: qsTr("Likely")
            Layout.preferredHeight: preferredHeightButton
            source: "shared/images/emoji/likely.png"
            Layout.fillWidth: true
            Layout.preferredWidth: preferredWidthButton
            onClicked: feedbackSelected(3)
        }
        ImageButton {
            text: qsTr("Unlikely")
            Layout.preferredHeight: preferredHeightButton
            source: "shared/images/emoji/unlikely.png"
            Layout.fillWidth: true
            Layout.preferredWidth: preferredWidthButton
            onClicked: feedbackSelected(4)
        }
        ImageButton {
            text: qsTr("Extremely unlikely")
            Layout.preferredHeight: preferredHeightButton
            source: "shared/images/emoji/extremely_unlikely.png"
            Layout.fillWidth: true
            Layout.preferredWidth: preferredWidthButton
            onClicked: feedbackSelected(5)
        }
    }

    ImageButton {
        width: 193
        text: "Don't know"
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        source: "shared/images/emoji/dont_know.png"
        height: preferredHeightButton * 0.75
        onClicked: feedbackSelected(6)
    }
}
