import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQml 2.2
import QtQuick.Controls.Styles 1.1
import feedbackapp.static.utils 1.0

Button {
	id: control

    text: "K"

	property int key: Qt.Key_unknown
	property int repeatDelay: 600
	property int repeatInterval: 40
    property int evtTimeout: -1

    property bool disabled: false

    signal keyClicked(string key, int timeout)
    signal keyPressed(string key, int timeout)

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
        if(disabled) {
            return
        }

        if(key != Qt.Key_unknown) {
            keyPressed(key, evtTimeout)
        }
        else if (text) {
            keyPressed(text, evtTimeout)
		}
	}

	function sendRelease() {
        if(disabled) {
            return
        }
	}

	function sendClick() {
        if(disabled) {
            return
        }
        if(key != Qt.Key_unknown) {
            keyPressed(key, evtTimeout)
        }
        else if (text) {
            keyClicked(text, evtTimeout)
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
