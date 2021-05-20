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


MissionController::_convertToMissionItems
	\-> utilise les données des points QML pou les convertir en class 'MissionItem' pour 	les envoyer par la suite sur le flux
	passe l'argument 'rgMissionItems' qui sera rempli pour être envoyé sur le flux
	le 'QObject' demandé en param semble être le vehicule.
	
PlanManager::writeMissionItems
Vehicle::sendMessageOnLinkThreadSafe
	\-> Envoie les trames




[PlanMasterController::sendToVehicle]TESTING UPLOAD
[MissionController::sendToVehicle]TESTING UPLOAD [1]
[MissionController::sendToVehicle]TESTING UPLOAD [3]
[MissionController::sendItemsToVehicle]TESTING UPLOAD [1]
[PlanManager::writeMissionItems]TESTING UPLOAD [1]
	0: 0x7ffd055b76b8
	1: 0x7ffd055b76b8
	2: 0x7ffd055b76b8
	3: 0x7ffd055b76b8
[PlanManager::_writeMissionItemsWorker]TESTING UPLOAD [1]
[PlanManager::_writeMissionCount]send message on thread safe [1]
	 message: 255 | 190 |  | 0x7ffd055b7480 | 1 | 1 | 4 | 0
[PlanManager::writeMissionItems]TESTING UPLOAD [1]
[PlanManager::_writeMissionItemsWorker]TESTING UPLOAD [1]
[PlanManager::_writeMissionCount]send message on thread safe [1]
	 message: 255 | 190 |  | 0x7ffd055b97d0 | 1 | 1 | 0 | 1
	 
	 

[PlanMasterController::sendToVehicle]TESTING UPLOAD 
[MissionController::sendToVehicle]TESTING UPLOAD [1] 
[MissionController::sendToVehicle]TESTING UPLOAD [3] 
[MissionController::sendItemsToVehicle]TESTING UPLOAD [1] 
[PlanManager::writeMissionItems]TESTING UPLOAD [1] 
	 0 :  0x7fff244fdf30 
	 1 :  0x7fff244fdf30 
	 2 :  0x7fff244fdf30 
	 3 :  0x7fff244fdf30 
[PlanManager::_writeMissionItemsWorker]TESTING UPLOAD [1] 
[PlanManager::_writeMissionCount]send message on thread safe [1] 
	 message:  255  |  190  |  1  |  0x7fff244fdce0  |  1  |  1  |  4  |  0 
[PlanManager::writeMissionItems]TESTING UPLOAD [1] 
[PlanManager::_writeMissionItemsWorker]TESTING UPLOAD [1] 
[PlanManager::_writeMissionCount]send message on thread safe [1] 
	 message:  255  |  190  |  1  |  0x7fff245000c0  |  1  |  1  |  0  |  1 
