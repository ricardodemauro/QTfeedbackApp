import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    id: page

    property double margin: 20

    property alias comment: commentInput.text

    signal commentTextChanged(string text)
    signal doneClicked()

    header: Label {
        text: qsTr("Leave Comment Page")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    TextArea {
        id: commentInput
        width: parent.width - doneButton.width - margin * 3
        text: comment
        height: parent.height / 2
        anchors.left: parent.left
        anchors.leftMargin: margin
        anchors.topMargin: margin
        anchors.top: parent.top
        placeholderText: "Comment here"
        onTextChanged: commentTextChanged(commentInput.text)
    }

    Button {
        id: doneButton
        text: qsTr("Done")
        anchors.verticalCenter: commentInput.verticalCenter
        anchors.rightMargin: margin
        anchors.right: parent.right
        onClicked: doneClicked()
    }


}
