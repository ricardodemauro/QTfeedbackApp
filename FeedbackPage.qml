import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import feedbackapp.static.utils 1.0

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
        color: "#00000000"
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

    Rectangle {
        id: rectangle
        height: pageFeedback.height / 4
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.left: parent.left

        ColumnLayout {
            x: 204
            y: 263
            spacing: 2
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            Label {
                id: labelTitle
                text: AppUtils.getFeedbackPageTitle()
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.pointSize: AppUtils.FontSize
            }

            Label {
                id: labelSubtitle
                text: AppUtils.getFeedbackPageSubtitle()
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.pointSize: AppUtils.FontSize
            }

            Label {
                id: labelSubtitle2
                text: AppUtils.getFeedbackPageSubtitle2()
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.pointSize: AppUtils.FontSize
            }
        }
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
            fontSize: AppUtils.SecondaryFontSize
            Layout.preferredHeight: preferredHeightButton
            source: "shared/images/emoji/extremely_likely.png"
            Layout.fillWidth: true
            Layout.preferredWidth: preferredWidthButton
            onClicked: feedbackSelected(1)
        }

        ImageButton {
            text: qsTr("Likely")
            fontSize: AppUtils.SecondaryFontSize
            Layout.preferredHeight: preferredHeightButton
            source: "shared/images/emoji/likely.png"
            Layout.fillWidth: true
            Layout.preferredWidth: preferredWidthButton
            onClicked: feedbackSelected(2)
        }
        ImageButton {
            text: "Neither likely\nnor unlikely"
            fontSize: AppUtils.SecondaryFontSize
            Layout.preferredHeight: preferredHeightButton
            source: "shared/images/emoji/neither_likely_or_unlikely.png"
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
            fontSize: AppUtils.SecondaryFontSize
        }
        ImageButton {
            text: qsTr("Extremely unlikely")
            Layout.preferredHeight: preferredHeightButton
            source: "shared/images/emoji/extremely_unlikely.png"
            Layout.fillWidth: true
            Layout.preferredWidth: preferredWidthButton
            onClicked: feedbackSelected(5)
            fontSize: AppUtils.SecondaryFontSize
        }
    }

    ImageButton {
        width: 200
        height: 180
        text: "Don't know"
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        source: "shared/images/emoji/dont_know.png"
        onClicked: feedbackSelected(6)
        fontSize: AppUtils.SecondaryFontSize
    }
}
