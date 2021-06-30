import QtQuick                      2.11
import QtQuick.Controls             2.4
import QtQuick.Controls.Styles      1.4
import QtQuick.Layouts              1.11

import QGroundControl               1.0
import QGroundControl.ScreenTools   1.0
import QGroundControl.Vehicle       1.0
import QGroundControl.Controls      1.0
import QGroundControl.FactControls  1.0
import QGroundControl.Palette       1.0

Rectangle {
    width:  availableWidth
    height: customEditorColumn.height + plannedAutonomousMissionSection.height
    color:  qgcPal.windowShadeDark
    radius: _radius

    property real _margin:                  ScreenTools.defaultFontPixelHeight / 2
    property var  _controllerVehicle:       missionItem.masterController.controllerVehicle
    property real _radius:                  ScreenTools.defaultFontPixelWidth / 2

    QGCPalette { id: qgcPal; colorGroupEnabled: enabled }

    Column {
        id:                 customEditorColumn
        anchors.left:       parent.left
        anchors.right:      parent.right
        anchors.top:        parent.top

        ColumnLayout {
            id: realItemEditor

            //Se lance automatiquement quand le composant est chargé.
            Component.onCompleted: {
                var itemEditor;
                var ChargedItemEditor;

                itemEditor = Qt.createComponent("qrc:/qml/RealSimpleItemEditor.qml");
                if (itemEditor.status != Component.Ready) {
                    console.debug("[realItemEditor] not ready yet");
                    if (itemEditor.status == Component.Error) {
                        console.debug("[realItemEditor] Error: " + itemEditor.errorString());
                    }
                }

                ChargedItemEditor = itemEditor.createObject(realItemEditor);
                if (ChargedItemEditor == null) {
                    console.debug("[realItemEditor] Error creating object");
                }
            }
        }

        SectionHeader {
            id:                 plannedAutonomousMissionSection
            anchors.margins:    _margin
            anchors.left:       parent.left
            anchors.right:      parent.right
            text:               qsTr("Autonomous dive planning")
            visible:            (_controllerVehicle.vehicleTypeString === "Sub")
            checked:            false
        }

        ColumnLayout {
            anchors.margins:    _margin
            anchors.left:       parent.left
            anchors.right:      parent.right
            visible:            plannedAutonomousMissionSection.checked && (_controllerVehicle.vehicleTypeString === "Sub")

            QGCLabel {
                text:               qsTr("Open the planning window")
                Layout.fillWidth:   true
                font.pointSize:     ScreenTools.smallFontPointSize
            }

            QGCButton {
                id:                 openPlanningAutonomousMission
                text:               qsTr("Dive mission")
                Layout.fillWidth:   true

                onClicked: {
                    var autonomousMissionWindow;
                    var chargedAutonomousMissionWindow;

                    autonomousMissionWindow = Qt.createComponent("qrc:/qml/CustomWindow_DiveMission.qml");
                    if (autonomousMissionWindow.status != Component.Ready) {
                        console.debug("[autonomousMissionWindow] not ready yet");
                        if (autonomousMissionWindow.status == Component.Error) {
                            console.debug("[autonomousMissionWindow] Error: " + autonomousMissionWindow.errorString());
                        }
                    }

                    chargedAutonomousMissionWindow = autonomousMissionWindow.createObject(plannedAutonomousMissionSection);
                    if (chargedAutonomousMissionWindow == null) {
                        console.debug("[autonomousMissionWindow] Error creating object");
                    }

                    chargedAutonomousMissionWindow.show();
                }
            }
        }
    }
}