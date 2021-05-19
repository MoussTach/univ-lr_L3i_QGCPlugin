# univ-lr_L3i_QGCPlugin


~/Ressources/qgroundcontrol.qrc/qml/MissionCommandTreeEditorTestWindow.qml
	\-> arbre de mission

~/Ressources/qgroundcontrol.qrc/qml/MissionSettingsEditor.qml
	\-> "Mission Start"

Waypoint:
Le point sur la map est dans:
~/Ressources/qgroundcontrol.qrc/qml/QGroundControl/Controls/SimpleItemMapVisual.qml
alors que son editeur est dans
~/Ressources/qgroundcontrol.qrc/qml/SimpleItemEditor.qml

            SectionHeader {
                id:             plannedAutonomousMissionSection
                anchors.left:   parent.left
                anchors.right:  parent.right
                text:           qsTr("Autonomous dive planning")
                visible:        (_controllerVehicle.vehicleTypeString === "Sub")
                checked:        false
            }

            ColumnLayout {
                anchors.left:   parent.left
                anchors.right:  parent.right
                spacing:        _margin
                visible:        plannedAutonomousMissionSection.checked && (_controllerVehicle.vehicleTypeString === "Sub")

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
                        mainWindow.showMessageDialog(qsTr("testing"), qsTr("[%1]".arg("test")))
                    }
                }
            }
            
            

Upload est dans :
~/Ressources/qgroundcontrol.qrc/qml/PlanView.qml:251
Cette fonction sert de check avant de l'envoyer sur le rover

PlanManager::writeMissionItems
