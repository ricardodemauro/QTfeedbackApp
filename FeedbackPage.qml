import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    width: parent.width
    height: parent.width

    header: Label {
        text: qsTr("Leave Comment Page")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Label {
        text: qsTr("You are on feedback Page.")
        anchors.centerIn: parent
    }
}
