import QtQuick 2.7
import QtQuick.Controls 2.0

Button {
	id: control

    text: "K"

	property int key: Qt.Key_unknown
	property int modifiers: Qt.NoModifier
	property int repeatDelay: 600
	property int repeatInterval: 40

    signal keyClicked(string key)
    signal keyPressed(string key)

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
		if (text) {
            var t = text;
            keyPressed(text)
		}
	}

	function sendRelease() {
        //console.log("sendRelease from " + control.text);
	}

	function sendClick() {
        //console.log("sendClick from " + control.text);

        if (text) {
            //console.info("text not null -->" + text)
            var t = text;
            keyClicked(text)
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
