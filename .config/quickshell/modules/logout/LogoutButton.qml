import QtQuick
import Quickshell.Io

Item {
	id: button
    
    signal hovered(int index)
    
    required property string command
	required property string text
	required property string icon
	required property int index
    property var keybind: null

	readonly property var process: Process {
		command: ["sh", "-c", button.command]
	}

	function exec() {
		process.startDetached();
		Qt.quit();
    }
}
