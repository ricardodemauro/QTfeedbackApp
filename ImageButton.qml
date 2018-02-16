import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.3
import feedbackapp.static.utils 1.0

Item {
    id: button
    width: 30
    height: 100
    property alias text: innerText.text
    property alias source: backgroundImage.source
    property alias textSize: innerText.height
    property alias imageHeigth: backgroundImage.height
    property alias fontSize: innerText.font.pixelSize

    signal clicked
    Image {
        id: backgroundImage
        anchors.bottomMargin: innerText.height
        fillMode: Image.PreserveAspectFit
        anchors.fill: parent
        source: "shared/images/emoji/likely.png"
    }

    ColorOverlay {
        id: overlay
        anchors.fill: backgroundImage
        source: backgroundImage
        opacity: 0
        color: Material.color(Material.Grey)
    }

    Text {
        id: innerText
        height: button.height * 0.35
        text: "Neither likely\nnor unlikely"
        font.pointSize: 18
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.capitalization: Font.MixedCase
    }

    //Mouse area to react on click events
    MouseArea {
        hoverEnabled: true
        anchors.fill: button
        onClicked: { button.clicked();}
        onPressed: overlay.opacity = 0.2
        onReleased: overlay.opacity = 0
    }
}
