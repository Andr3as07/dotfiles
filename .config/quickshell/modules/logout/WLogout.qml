import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Wayland

Variants {
	id: root
    property int activeIndex: 0
	property color backgroundColor: "#282a36"
	property color buttonColor: "#44475a"
    property color buttonHoverColor: "#6272a4"
    property color textColor: "#fff"
	default property list<LogoutButton> buttons


	model: Quickshell.screens
	PanelWindow {
		id: w

        property int buttonSize: Math.min(width, height) * 0.2
		property var modelData
		screen: modelData

		exclusionMode: ExclusionMode.Ignore
		WlrLayershell.layer: WlrLayer.Overlay
		WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive

		color: "transparent"

		contentItem {
            focus: true
            Keys.onPressed: event => {
                if (event.key == Qt.Key_Escape) {
                    Qt.quit();
                } else if (event.key === Qt.Key_Left) {
                    root.activeIndex = (root.activeIndex - 1 + buttons.length) % buttons.length;
                } else if (event.key === Qt.Key_Right) {
                    root.activeIndex = (root.activeIndex + 1) % buttons.length;
                } else if (event.key === Qt.Key_Up) {
                    // Assuming 3 columns
                    root.activeIndex = (root.activeIndex - 3 + buttons.length) % buttons.length;
                } else if (event.key === Qt.Key_Down) {
                    root.activeIndex = (root.activeIndex + 3) % buttons.length;
                } else if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter || event.key === Qt.Key_Space) {
                    if (buttons[root.activeIndex]) {
                        buttons[root.activeIndex].exec();
                    }
                } else {
                    for (let i = 0; i < buttons.length; i++) {
                        let button = buttons[i];
                        if (event.key == button.keybind) button.exec();
                    }
                }
            }
        }

		anchors {
			top: true
			left: true
			bottom: true
			right: true
		}

		Rectangle {
			color: backgroundColor;
            anchors.fill: parent

			MouseArea {
				anchors.fill: parent
                onClicked: Qt.quit()


				GridLayout {
					anchors.centerIn: parent

                    columns: 3
                    rows: 2
					columnSpacing: 8
                    rowSpacing: 8


                    width: w.buttonSize * columns + columnSpacing * (columns - 1)
					height: w.buttonSize * rows + rowSpacing * (rows - 1)

					Repeater {
						model: buttons
                        delegate: Rectangle {
                            id: btn
                            required property LogoutButton modelData;
                            property int index: modelData.index
                            property bool selected : index === root.activeIndex

							Layout.fillWidth: true
							Layout.fillHeight: true

							color:  selected ? buttonHoverColor : buttonColor
                            radius: selected ? (w.buttonSize * 0.45) : (w.buttonSize * 0.1)

                            Behavior on radius {
                                NumberAnimation {
                                    duration: 300
                                    easing.type: Easing.InOutBack
                                }
                            }

                            Behavior on color {
                                ColorAnimation {
                                    duration: 300
                                    easing.type: Easing.InOutBack
                                }
                            }

							MouseArea {
								id: ma
								anchors.fill: parent
								hoverEnabled: true
                                onClicked: modelData.exec()
                                onEntered: root.activeIndex = index
							}

							Image {
								id: icon
								anchors.centerIn: parent
								source: `icons/${modelData.icon}.png`
								width: parent.width * 0.30
                                height: parent.width * 0.30
                                scale: selected ? 1.3 : 1

                                Behavior on scale {
                                    NumberAnimation {
                                        duration: 300
                                        easing.type: Easing.InOutBack
                                    }
                                }
							}

							// Text {
							// 	anchors {
							// 		top: icon.bottom
							// 		topMargin: 15
							// 		horizontalCenter: parent.horizontalCenter
							// 	}
							//
							// 	text: modelData.text
							// 	font.pointSize: 20
							// 	color: textColor
							// }
						}
					}
				}
			}
		}
	}
}

