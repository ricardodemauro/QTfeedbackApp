import QtQuick 2.9
import QtQuick.Controls 2.2
import feedbackapp.backend 1.0

Page {
    width: 600
    height: 400

    header: Label {
        text: qsTr("Service Page")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Label {
        text: qsTr("You are on Service Page.")
        anchors.centerIn: parent
    }

    Button {
        onClicked: function() {
            console.info("button clicked")
        }
    }
}
