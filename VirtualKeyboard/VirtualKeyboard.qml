import QtQuick 2.7
import QtQuick.Controls 2.2
import "."
import QtTest 1.0
import QtQuick.Window 2.3

Item {
    id: control

    property int keyWidth: Units.gu// / 2
    property int keySpacing: Units.dp * 3

    property bool useLogicalPixelDensity: true
    property real multiplier: 1.0

    property TextArea target: root

    property int modifiers: shiftKey.checked ? Qt.ShiftModifier : Qt.NoModifier

    readonly property real pixelDensity: useLogicalPixelDensity ? Screen.logicalPixelDensity: Screen.pixelDensity

    readonly property real dp: pixelDensity * 25.4 * multiplier / 160
    readonly property real gu: dp * 64

    property int shiftModifier: shiftKey.checked ? Qt.ShiftModifier : Qt.NoModifier

    function onSpacePressed(vk_timeout) {
        target.focus = true
        target.text = target.text + " "
        //evt.keyPress(Qt.Key_Space, Qt.NoModifier, vk_timeout)
    }

    function onSpaceClicked(vk_timeout) {
        target.focus = true
        target.text = target.text + " "
        //evt.keyClick(Qt.Key_Space, Qt.NoModifier, vk_timeout)
    }

    function onBackspacePressed(vk_timeout) {
        target.focus = true
        target.text = target.text.substring(0, target.text.length - 1)
        //evt.keyPress(Qt.Key_Backspace, Qt.NoModifier, vk_timeout)
    }

    function onBackspaceClicked(vk_timeout) {
        target.focus = true
        target.text = target.text.substring(0, target.text.length - 1)
        //evt.keyClick(Qt.Key_Backspace, Qt.NoModifier, vk_timeout)
    }

    function onEnterClicked(vk_timeout) {
        target.focus = true
        target.text = target.text + "\n"
        //evt.keyClick(Qt.Key_Return, Qt.NoModifier, vk_timeout)
    }

    function onEnterPressed(vk_timeout) {
        target.focus = true
        target.text = target.text + "\n"
        //evt.keyPress(Qt.Key_Return, Qt.NoModifier, vk_timeout)
    }

    function onCommaClicked(vk_timeout) {
        target.focus = true
        target.text = target.text + ","
        //evt.keyClick(Qt.Key_Comma, Qt.NoModifier, vk_timeout)
    }

    function onCommaPressed(vk_timeout) {
        target.focus = true
        target.text = target.text + ","
        //evt.keyPress(Qt.Key_Comma, Qt.NoModifier, vk_timeout)
    }

    function onPeriodClicked(vk_timeout) {
        target.focus = true
        target.text = target.text + "."
        //evt.keyClick(Qt.Key_Period, Qt.NoModifier, vk_timeout)
    }

    function onPeriodPressed(vk_timeout) {
        target.focus = true
        target.text = target.text + "."
        //evt.keyPress(Qt.Key_Period, Qt.NoModifier, vk_timeout)
    }

    function onVirtualKeyClicked(vk_clicked, vk_timeout) {
        target.focus = true
        target.text = target.text + vk_clicked
        //evt.keyClick(vk_clicked, Qt.NoModifier, vk_timeout)
    }

    function onVirtualKeyPressed(vk_pressed, vk_timeout) {
        target.focus = true
        target.text = target.text + vk_pressed
        //evt.keyPressChar(vk_pressed, Qt.NoModifier, vk_timeout)
    }

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        spacing: control.keySpacing

        Row {
            id: row0
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: parent.spacing

            VirtualKey {
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier) ? "!":"1"

                width: control.keyWidth
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"@" : "2"

                width: control.keyWidth
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"#":"3"

                width: control.keyWidth
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"$":"4"

                width: control.keyWidth
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"%":"5"

                width: control.keyWidth
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"^":"6"

                width: control.keyWidth
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"&":"7"

                width: control.keyWidth
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"*":"8"

                width: control.keyWidth
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"(":"9"

                width: control.keyWidth
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier) ? ")" : "0"

                width: control.keyWidth
            }
        }

        Row {
            id: row1
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: parent.spacing

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"Q":"q"

                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"W":"w"

                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"E":"e"

                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"R":"r"
                width: control.keyWidth

                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                font.capitalization: Font.MixedCase
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"T":"t"

                width: control.keyWidth
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"Y":"y"

                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"U":"u"

                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"I":"i"

                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"O":"o"

                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"P":"p"

                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                id: backspaceKey
                onKeyPressed: function(vk_clicked, vk_timeout) { onBackspacePressed(vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onBackspaceClicked(vk_timeout) }
                text: " ← "
                evtTimeout: -4
                key: Qt.Key_Backspace

                width: control.keyWidth
            }
        }

        Row {
            id: row2
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: parent.spacing

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"A":"a"

                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"S":"s"

                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"D":"d"

                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"F":"f"

                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"G":"g"

                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"H":"h"
                width: control.keyWidth

                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"J":"j"

                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"K":"k"

                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"L":"l"

                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                id: returnKey
                onKeyPressed: function(vk_clicked, vk_timeout) { onEnterPressed(vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onEnterClicked(vk_timeout) }
                text: "ENTER"
                key: Qt.Key_unknown
                disabled: false
                width: control.keyWidth * 1.5 + parent.spacing
                padding: 0
            }

        }

        Row {
            id: row3
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: parent.spacing

            VirtualKey {
                id: shiftKey
                text: "SHIFT"
                checkable: true
                key: Qt.Key_unknown
                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier) ? "Z" : "z"
                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"X":"x"

                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"C":"c"

                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"V":"v"

                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"B":"b"

                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"N":"n"

                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"M":"m"

                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onCommaPressed(vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onCommaClicked(vk_timeout) }
                text: ","
                key: Qt.Key_Comma
                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                onKeyPressed: function(vk_clicked, vk_timeout) { onPeriodPressed(vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onPeriodClicked(vk_timeout) }
                text: "."
                key: Qt.Key_Period
                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

            VirtualKey {
                id: spaceKey
                onKeyPressed: function(vk_clicked, vk_timeout) { onSpacePressed(vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_timeout) { onSpaceClicked(vk_timeout) }
                text: " SPACE "
                key: Qt.Key_Space
                width: control.keyWidth
                font.capitalization: Font.MixedCase
            }

        }
    }
}
