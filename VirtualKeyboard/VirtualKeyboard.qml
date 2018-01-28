import QtQuick 2.7
import "."
import QtTest 1.0
import QtQuick.Window 2.3

Item {
	id: control

	property int keyWidth: Units.gu// / 2
	property int keySpacing: Units.dp * 3

    property bool useLogicalPixelDensity: true
    property real multiplier: 1.0

    property Item target: root

    property int modifiers: Qt.NoModifier

    readonly property real pixelDensity: useLogicalPixelDensity ? Screen.logicalPixelDensity: Screen.pixelDensity

    readonly property real dp: pixelDensity * 25.4 * multiplier / 160
    readonly property real gu: dp * 64

    property int shiftModifier: shiftKey.checked ? Qt.ShiftModifier : Qt.NoModifier
    property int otherModifiers:  controlKey.checked ? Qt.ControlModifier : Qt.NoModifier | alterKey.checked ? Qt.AltModifier : Qt.NoModifier

    property TestEvent evt: TestEvent { }

    function onVirtualKeyClicked(text) {
        console.info("Key clicked " + text)
    }

    function onVirtualKeyPressed(text) {
        console.info("Key pressed " + text)
        target.focus = true
        evt.keyClick(Qt.Key_A, modifiers, 100)
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
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                text: (control.modifiers&Qt.ShiftModifier) ? "!":"1"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
                text: (control.modifiers&Qt.ShiftModifier)?"@" : "2"
                modifiers: control.otherModifiers
				width: control.keyWidth
            }

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
                text: (control.modifiers&Qt.ShiftModifier)?"#":"3"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"$":"4"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"%":"5"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"^":"6"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"&":"7"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"*":"8"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"(":"9"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?")":"0"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: " ⬅ "
				key: Qt.Key_Backspace
				modifiers: control.modifiers
				width: control.keyWidth * 2 + parent.spacing
			}
		}

		Row {
			id: row1
			anchors.horizontalCenter: parent.horizontalCenter
			spacing: parent.spacing

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: " ↹ "
				key: Qt.Key_Tab
				modifiers: control.modifiers
				width: control.keyWidth
				padding: 0
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"Q":"q"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"W":"w"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"E":"e"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"R":"r"
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"T":"t"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"Y":"y"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"U":"u"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"I":"i"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"O":"o"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"P":"p"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
				id: alterKey
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: "Alt"
				key: Qt.Key_Alt
				width: control.keyWidth
				checkable: true
				padding: 0
			}
		}

		Row {
			id: row2
			anchors.horizontalCenter: parent.horizontalCenter
			spacing: parent.spacing

			VirtualKey {
				id: shiftKey
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: " ⇧ "
				key: Qt.Key_Shift
				width: control.keyWidth
				checkable: true
				padding: 0
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"A":"a"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"S":"s"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"D":"d"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"F":"f"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"G":"g"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"H":"h"
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"J":"j"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"K":"k"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"L":"l"
				modifiers: control.modifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: " ↵ "
				key: Qt.Key_Enter
				modifiers: control.modifiers
				width: control.keyWidth * 2 + parent.spacing
				padding: 0
			}
		}

		Row {
			id: row3
			anchors.horizontalCenter: parent.horizontalCenter
			spacing: parent.spacing

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: " ← "
				key: Qt.Key_Left
				modifiers: control.modifiers
				width: control.keyWidth
				padding: 0
			}

			VirtualKey {
				id: controlKey
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: "Ctl"
				key: Qt.Key_Control
				width: control.keyWidth
				checkable: true
				padding: 0
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"Z":"z"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"X":"x"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"C":"c"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"V":"v"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"B":"b"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"N":"n"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: (control.modifiers&Qt.ShiftModifier)?"M":"m"
                modifiers: control.otherModifiers
				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: "  "
				key: Qt.Key_Space
				modifiers: control.modifiers
				width: control.keyWidth * 2 + parent.spacing
			}

			VirtualKey {
                onKeyPressed: function(text) { onVirtualKeyPressed(text) }
                onKeyClicked: function(text) { onVirtualKeyClicked(text) }
				text: " → "
				key: Qt.Key_Right
				modifiers: control.modifiers
				width: control.keyWidth
				padding: 0
			}
		}
	}
}
