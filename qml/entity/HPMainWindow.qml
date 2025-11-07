import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

import CCStartup
import OL.Core

AppStartupItem {
    id: root
    asynchronous: true

    AppStartupComponent {
        id: mainContentComp

        Rectangle {
            id: rect1
            anchors.fill: parent
            color: "pink"

            AgreementPopup {
                id: agreementPopup

                anchors.centerIn: parent
                visible: root.populate && OLModulePage.isActive
            }
        }
    }
}
