import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Window 2.3
import "VirtualKeyboard"

Page {
    id: page

    property double margin: 20

    property alias comment: commentInput.text

    signal commentTextChanged(string text)
    signal doneClicked()

    Component.onCompleted: commentInput.forceActiveFocus()

    header: Label {
        text: qsTr("Leave Comment Page")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    FocusScope {
        id: root
        width: parent.width - doneButton.width - margin * 3
        height: parent.height / 2
        anchors.left: parent.left
        anchors.leftMargin: margin
        anchors.topMargin: margin
        anchors.top: parent.top

        TextArea {
            id: commentInput
            width: parent.width - doneButton.width - margin * 3
            text: comment
            height: parent.height / 2
            anchors.fill: parent
            placeholderText: "Comment here"
            onTextChanged: commentTextChanged(commentInput.text)

            Keys.onPressed: {
                console.log("Key onpressed " + event.key + " A " + Qt.Key_A);
            }
        }
    }


    Button {
        id: doneButton
        text: qsTr("Done")
        anchors.verticalCenter: commentInput.verticalCenter
        anchors.rightMargin: margin
        anchors.right: parent.right
        onClicked: doneClicked()
    }

    VirtualKeyboard {
        id: virtalKeyboard
        width: parent.width
        height: 180
        keySpacing: 2
        keyWidth: 64
        visible: true
        anchors.bottom: parent.bottom
        target: page
    }
}
