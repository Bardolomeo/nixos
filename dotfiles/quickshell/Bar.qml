// Bar.qml
import Quickshell
import QtQuick.Layouts

Scope {
  // no more time object

  Variants {
    model: Quickshell.screens

		
		PanelWindow {
			id: bar
			required property var modelData
			screen: modelData

			anchors {
				top: true
				left: true
				right: true
			}

			implicitHeight: 40
			color: "black"
			
					ClockWidget { anchors.centerIn: parent }
				
			}
	}
}
