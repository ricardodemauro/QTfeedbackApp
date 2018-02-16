import QtQuick 2.9
import QtQuick.Window 2.3
import feedbackapp.static.utils 1.0
import QtQuick.Controls 2.2

Page {
    id: page
    visible: true
    title: "Service"

    signal serviceSelected(string serviceId)
    signal quitClicked()
    signal startClicked()

    property int selectedService: 0

    Component.onCompleted: function() {
        if(svc1.checked)
            serviceSelected(svc1.text)
        else if(svc2.checked)
            serviceSelected(svc2.text)
        else if(svc3.checked)
            serviceSelected(svc3.text)
        else if(svc4.checked)
            serviceSelected(svc4.text)
        else if(svc5.checked)
            serviceSelected(svc5.text)
    }


    footer: Rectangle {
        id: footerRectangle
        width: parent.width
        height: 80
        transformOrigin: Item.Center
        anchors.horizontalCenter: parent.horizontalCenter

        Button {
            anchors.horizontalCenterOffset: parent.width * -0.2
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: startClicked()
            text: qsTr("Start")
            highlighted: true
        }
        Button {
            anchors.horizontalCenterOffset: parent.width * 0.2
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: quitClicked()
            text: qsTr("Quit")
        }
    }

    Column {
        anchors.centerIn: parent
        GroupBox {
            Column{
                RadioButton { id: svc1; text: qsTr("Option 1"); checked: true; onClicked: serviceSelected(svc1.text); }
                RadioButton { id: svc2; text: qsTr("Option 2"); onClicked: serviceSelected(svc2.text) }
                RadioButton { id: svc3; text: qsTr("Option 3"); onClicked: serviceSelected(svc3.text) }
                RadioButton { id: svc4; text: qsTr("Option 4"); onClicked: serviceSelected(svc4.text) }
                RadioButton { id: svc5; text: qsTr("Option 5"); onClicked: serviceSelected(svc5.text) }
            }
        }
    }

    Label {
        id: labelTitle
        text: qsTr("Please choose the service you're running today:")
        anchors.topMargin: parent.height * 0.1
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: AppUtils.FontSize
    }
}
