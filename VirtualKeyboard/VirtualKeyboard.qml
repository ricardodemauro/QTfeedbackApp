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

    property int modifiers: shiftKey.checked ? Qt.ShiftModifier : Qt.NoModifier

    readonly property real pixelDensity: useLogicalPixelDensity ? Screen.logicalPixelDensity: Screen.pixelDensity

    readonly property real dp: pixelDensity * 25.4 * multiplier / 160
    readonly property real gu: dp * 64

    property int shiftModifier: shiftKey.checked ? Qt.ShiftModifier : Qt.NoModifier

    property TestEvent evt: TestEvent { }

    function onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) {
        console.info("Key clicked " + text)
        evt.keyClick(vk_pressed, vk_modifiers, vk_timeout)
    }

    function onVirtualKeyPressed(vk_pressed, vk_modifiers, vk_timeout) {
        target.focus = true

        evt.keyPress(vk_pressed, vk_modifiers, vk_timeout)
    }

    function onShiftPressed(vk_clicked, vk_modifiers, vk_timeout) {
        console.info("shift pressed")
        modifiers = modifiers == Qt.ShiftModifier ? Qt.NoModifier : Qt.ShiftModifier
        console.info("shift pressed, modifier -> " + modifiers)
    }

    function onShiftonVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) {
        console.info("shift clicked")
        modifiers = modifiers == Qt.ShiftModifier ? Qt.NoModifier : Qt.ShiftModifier
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
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier) ? "!":"1"

				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"@" : "2"

				width: control.keyWidth
            }

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"#":"3"

				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"$":"4"

				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"%":"5"

				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"^":"6"

				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"&":"7"

				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"*":"8"

				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"(":"9"

				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier) ? ")" : "0"

				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: " ← "
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
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: ""
                key: Qt.Key_unknown
                disabled: true
				modifiers: control.modifiers
				width: control.keyWidth
				padding: 0
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"Q":"q"

				width: control.keyWidth
                font.capitalization: Font.MixedCase
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"W":"w"

				width: control.keyWidth
                font.capitalization: Font.MixedCase
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"E":"e"

				width: control.keyWidth
                font.capitalization: Font.MixedCase
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"R":"r"
				width: control.keyWidth
                font.capitalization: Font.MixedCase
			}

			VirtualKey {
                font.capitalization: Font.MixedCase
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"T":"t"

				width: control.keyWidth
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"Y":"y"

				width: control.keyWidth
                font.capitalization: Font.MixedCase
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"U":"u"

				width: control.keyWidth
                font.capitalization: Font.MixedCase
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"I":"i"

				width: control.keyWidth
                font.capitalization: Font.MixedCase
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"O":"o"

				width: control.keyWidth
                font.capitalization: Font.MixedCase
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"P":"p"

				width: control.keyWidth
                font.capitalization: Font.MixedCase
			}

			VirtualKey {
				id: alterKey
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: ""
                key: Qt.Key_unknown
                disabled: true
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
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) {  }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) {  }
                text: ""
                key: Qt.Key_unknown
				width: control.keyWidth
				checkable: true
				padding: 0
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"A":"a"

				width: control.keyWidth
                font.capitalization: Font.MixedCase
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"S":"s"

				width: control.keyWidth
                font.capitalization: Font.MixedCase
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"D":"d"

				width: control.keyWidth
                font.capitalization: Font.MixedCase
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"F":"f"

				width: control.keyWidth
                font.capitalization: Font.MixedCase
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"G":"g"

				width: control.keyWidth
                font.capitalization: Font.MixedCase
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"H":"h"
				width: control.keyWidth
                font.capitalization: Font.MixedCase
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"J":"j"

				width: control.keyWidth
                font.capitalization: Font.MixedCase
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"K":"k"

				width: control.keyWidth
                font.capitalization: Font.MixedCase
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"L":"l"
				modifiers: control.modifiers
				width: control.keyWidth
                font.capitalization: Font.MixedCase
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: ""
                key: Qt.Key_unknown
                disabled: true
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
                id: shiftKey
                text: "SHIFT"
                checkable: true
                key: Qt.Key_Shift
                disabled: false
                modifiers: control.modifiers
                width: control.keyWidth * 2 + parent.spacing
                padding: 0
                font.capitalization: Font.MixedCase
            }

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"Z":"z"

				width: control.keyWidth
                font.capitalization: Font.MixedCase
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"X":"x"

				width: control.keyWidth
                font.capitalization: Font.MixedCase
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"C":"c"

				width: control.keyWidth
                font.capitalization: Font.MixedCase
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"V":"v"

				width: control.keyWidth
                font.capitalization: Font.MixedCase
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"B":"b"

				width: control.keyWidth
                font.capitalization: Font.MixedCase
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"N":"n"

				width: control.keyWidth
                font.capitalization: Font.MixedCase
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: (control.modifiers & Qt.ShiftModifier)?"M":"m"

				width: control.keyWidth
                font.capitalization: Font.MixedCase
			}

			VirtualKey {
                onKeyPressed: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyPressed(vk_clicked, vk_modifiers, vk_timeout) }
                onKeyClicked: function(vk_clicked, vk_modifiers, vk_timeout) { onVirtualKeyClicked(vk_clicked, vk_modifiers, vk_timeout) }
                text: " SPACE "
				key: Qt.Key_Space
				modifiers: control.modifiers
                width: control.keyWidth * 3 + parent.spacing
                font.capitalization: Font.MixedCase
			}
		}
	}
}
