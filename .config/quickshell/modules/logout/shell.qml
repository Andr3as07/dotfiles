import QtQuick
import Quickshell

ShellRoot {
	WLogout {
		LogoutButton {
			command: "loginctl lock-session"
			keybind: Qt.Key_K
			text: "Lock"
            icon: "lock"
            index: 0
		}

		LogoutButton {
			command: "loginctl terminate-user $USER"
			keybind: Qt.Key_E
			text: "Logout"
			icon: "logout"
            index: 1
		}

		LogoutButton {
			command: "systemctl suspend"
			keybind: Qt.Key_U
			text: "Suspend"
			icon: "suspend"
            index: 2
		}

		LogoutButton {
			command: "systemctl hibernate"
			keybind: Qt.Key_H
			text: "Hibernate"
			icon: "hibernate"
            index: 3
		}

		LogoutButton {
			command: "systemctl poweroff"
			keybind: Qt.Key_K
			text: "Shutdown"
			icon: "shutdown"
            index: 4
		}

		LogoutButton {
			command: "systemctl reboot"
			keybind: Qt.Key_R
			text: "Reboot"
			icon: "reboot"
            index: 5
		}
	}
}

