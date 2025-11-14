import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

import OL.Control

Rectangle {
    id: root

    color: "white"

    ColumnLayout {
        anchors.fill: parent

        Item {
            Layout.preferredHeight: Style.statusBarHeight
            Layout.fillWidth: true
        }

        HPContentTitle {
            Layout.preferredHeight: 40
            Layout.fillWidth: true
            Layout.leftMargin: 20
            Layout.rightMargin: 20
        }

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
