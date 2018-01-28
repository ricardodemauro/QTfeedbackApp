import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQml 2.2
import QtQuick.Controls.Styles 1.1
import feedbackapp.static.utils 1.0

Button {
	id: control

    text: "K"

	property int key: Qt.Key_unknown
	property int modifiers: Qt.NoModifier
	property int repeatDelay: 600
	property int repeatInterval: 40

    property bool disabled: false

    signal keyClicked(int key, int modifiers, int timeout)
    signal keyPressed(int key, int modifiers, int timeout)

	focusPolicy: Qt.NoFocus
	state: "normal"
	states: [
		State {
			name: "normal"
            when: (control.repeatInterval <= 0) || (!pressed)
			PropertyChanges {
				target: repeatTrigger
				repeat: false
				interval: 0
				running: false
			}
		},
		State {
			name: "delaying"
			PropertyChanges {
				target: repeatTrigger
				repeat: false
				interval: control.repeatDelay
				running: true
				onTriggered: control.state = "repeating"
			}
		},
		State {
			name: "repeating"
			PropertyChanges {
				target: repeatTrigger
				repeat: true
				running: true
				interval: control.repeatInterval
				onTriggered: control.sendPress()
			}
		}
	]


	Timer {
		id: repeatTrigger
	}

	function sendPress() {
        console.info("sendPress disabled " + disabled + " key " + key + " text " + text)
        if(disabled) {
            return
        }

        if(key != Qt.Key_unknown) {
            keyPressed(key, modifiers, -1)
        }

		if (text) {
            var keyPress = AppUtils.stringToQtKey(text);
            keyPressed(keyPress, modifiers, -1)
		}
	}

	function sendRelease() {
        console.info("sendRelease disabled " + disabled + " key " + key + " text " + text)
        if(disabled) {
            return
        }
        console.log("sendRelease from " + control.text);
	}

	function sendClick() {
        console.info("sendClick disabled " + disabled + " key " + key + " text " + text)
        if(disabled) {
            return
        }
        if(key != Qt.Key_unknown) {
            keyPressed(key, modifiers, -1)
        }
        if (text) {
            var keyClick = AppUtils.stringToQtKey(text);
            keyClicked(keyClick, modifiers, -1)
        }
	}

	onPressedChanged: {
        if (repeatInterval > 0) {
            if (pressed) {
				sendPress();
				state = "delaying";
			}
            else {
				sendRelease();
            }
        }
	}

	onClicked: {
        if (repeatInterval <= 0) {
			sendClick();
        }
	}

    onReleased: { // event missing still not fixed
        state = "normal";
    }
}
