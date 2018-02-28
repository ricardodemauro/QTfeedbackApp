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
        pageSelectService(svc1.checked, svc1.text)
        pageSelectService(svc2.checked, svc2.text)
        pageSelectService(svc3.checked, svc3.text)
        pageSelectService(svc4.checked, svc4.text)
        pageSelectService(svc5.checked, svc5.text)
        pageSelectService(svc6.checked, svc6.text)
        pageSelectService(svc7.checked, svc7.text)
        pageSelectService(svc8.checked, svc8.text)
        pageSelectService(svc9.checked, svc9.text)
        pageSelectService(svc10.checked, svc10.text)
    }

    function pageSelectService(isChecked, value) {
        console.info("init page checked and value " + isChecked + " " + value)
        if(isChecked) {
            serviceSelected(value)
        }
    }


    footer: Rectangle {
        id: footerRectangle
        width: parent.width
        height: 80
        color: "#00000000"
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
        anchors.topMargin: 20
        anchors.top: labelTitle.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        GroupBox {
            Column{
                RadioButton { id: svc1; text: AppUtils.getService(0); checked: true; onClicked: pageSelectService(svc1.checked, svc1.text); }
                RadioButton { id: svc2; text: AppUtils.getService(1); onClicked: pageSelectService(svc2.checked, svc2.text); }
                RadioButton { id: svc3; text: AppUtils.getService(2); onClicked: pageSelectService(svc3.checked, svc3.text); }
                RadioButton { id: svc4; text: AppUtils.getService(3); onClicked: pageSelectService(svc4.checked, svc4.text); }
                RadioButton { id: svc5; text: AppUtils.getService(4); onClicked: pageSelectService(svc5.checked, svc5.text); }
                RadioButton { id: svc6; text: AppUtils.getService(5); onClicked: pageSelectService(svc6.checked, svc6.text); }
                RadioButton { id: svc7; text: AppUtils.getService(6); onClicked: pageSelectService(svc7.checked, svc7.text); }
                RadioButton { id: svc8; text: AppUtils.getService(7); onClicked: pageSelectService(svc8.checked, svc8.text) }
                RadioButton { id: svc9; text: AppUtils.getService(8); onClicked: pageSelectService(svc9.checked, svc9.text) }
                RadioButton { id: svc10; text: AppUtils.getService(9); onClicked: pageSelectService(svc10.checked, svc10.text) }
            }
        }
    }

    Label {
        id: labelTitle
        text: qsTr("Please choose the service you're running today:")
        anchors.topMargin: parent.height * 0.08
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: AppUtils.FontSize
    }
}
