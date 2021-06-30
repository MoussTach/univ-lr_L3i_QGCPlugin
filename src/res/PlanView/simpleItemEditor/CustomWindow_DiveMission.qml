import QtQuick                      2.15
import QtQuick.Controls             2.15
import QtQuick.Window               2.15
import QtQuick.Controls.Styles      1.4
import QtQuick.Layouts              1.11
import Qt.labs.qmlmodels            1.0

import QGroundControl               1.0
import QGroundControl.ScreenTools   1.0 //
import QGroundControl.Vehicle       1.0
import QGroundControl.Controls      1.0 //
import QGroundControl.FactControls  1.0 //
import QGroundControl.Palette       1.0

import DiveMissionModel             1.0

ApplicationWindow {
    id:             diveMissionWindow
    title:          qsTr("Dive mission")
    visible:        true
    width:          640
    height:         400
    modality:       Qt.ApplicationModal
    color:          qgcPal.windowShadeDark

    //property var  _controllerVehicle:       missionItem.masterController.controllerVehicle

    QGCPalette { id: qgcPal; colorGroupEnabled: enabled }

    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            Label {
                text: qsTr("Fill with instruction for this waypoint")
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
            ToolButton {
                text: qsTr("+")
                onClicked: {
                    console.debug("[DiveMissionWindow] btn +");
                    tableView.model.insertRows(tableView.model.rowCount(), 1);
                }
            }
            ToolButton {
                text: qsTr("-")
                onClicked: {
                    console.debug("[DiveMissionWindow] btn -");
                    tableView.model.removeRows(tableView.model.rowCount() - 1 /*tableView.currentRow*/, 1);
                }
            }
        }
    }

    HorizontalHeaderView {
        id: horizontalHeader
        syncView: tableView

        anchors.left: tableView.left
        anchors.right: tableView.right

        Component.onCompleted: {
            console.debug("[DiveMissionWindow] emit HorizontalHeaderView completed ");
        }
    }

    TableView {
        id:             tableView
        model:          DiveMissionModel {}

        height: parent.height - horizontalHeader.height
        anchors.top: horizontalHeader.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        boundsBehavior: Flickable.StopAtBounds

        columnWidthProvider: function () {
            return tableView.width / tableView.model.columnCount();
        }

        delegate: DelegateChooser {
            DelegateChoice {
                column: 0
                delegate: TextField {
                    palette.text: qgcPal.text
                    text: display
                    background: Rectangle {
                        color: qgcPal.windowShadeDark
                        border.color: qgcPal.text
                        border.width: 1
                    }

                    onEditingFinished: {
                        var index = tableView.model.index(row, column)
                        tableView.model.setData(index, text)
                    }
                }
            }

            DelegateChoice {
                column: 1
                delegate: TextField {
                    palette.text: qgcPal.text
                    text: display
                    background: Rectangle {
                        color: qgcPal.windowShadeDark
                        border.color: qgcPal.text
                        border.width: 1
                    }

                    onEditingFinished: {
                        var index = tableView.model.index(row, column)
                        tableView.model.setData(index, text)
                    }
                }
            }

            DelegateChoice {
                column: 2
                delegate: TextField {
                    palette.text: qgcPal.text
                    text: display
                    background: Rectangle {
                        color: qgcPal.windowShadeDark
                        border.color: qgcPal.text
                        border.width: 1
                    }

                    onEditingFinished: {
                        var index = tableView.model.index(row, column)
                        tableView.model.setData(index, text)
                    }
                }
            }

            DelegateChoice {
                column: 3
                delegate: TextField {
                    palette.text: qgcPal.text
                    text: display
                    background: Rectangle {
                        color: qgcPal.windowShadeDark
                        border.color: qgcPal.text
                        border.width: 1
                    }

                    onEditingFinished: {
                        var index = tableView.model.index(row, column)
                        tableView.model.setData(index, text)
                    }
                }
            }
        }

        Component.onCompleted: {
            console.debug("[DiveMissionWindow] emit tableView completed ");
        }
    }

    Component.onCompleted: {
        console.debug("[DiveMissionWindow] emit completed ");
    }

    onClosing: {
        console.debug("[DiveMissionWindow] destroy ");
        diveMissionData.setData("test", tableView.model.getData())

    }
}