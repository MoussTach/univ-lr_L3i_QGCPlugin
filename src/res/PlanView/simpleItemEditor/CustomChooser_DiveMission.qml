import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
    id: root
    implicitHeight: 100

    property int row
    signal deleteRow(int row)

    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter

    readOnly: true
    background: Frame {}

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        acceptedButtons: Qt.RightButton

        onClicked: {
            eraseContextMenu.popup(root, 0, mouseArea.mouseY + 10)
        }
    }

    Menu {
        id: eraseContextMenu
        y: root.y
        MenuItem {
            text: qsTr("Delete entry")
            onTriggered: {
                eraseDialog.open()
                eraseContextMenu.close()
            }
        }
        MenuItem {
            text: qsTr("Cancel")
            onTriggered: {
                eraseContextMenu.close()
            }
        }
    }

    Dialog {
        id: eraseDialog
        title: qsTr("Delete entry")
        modal: true
        focus: true

        contentItem: Label {
            id: label
            text: qsTr("Do you really want to erase the entry ?")
        }

        onAccepted: {
            deleteRow(root.row)
        }

        standardButtons: Dialog.Ok | Dialog.Cancel
    }
}