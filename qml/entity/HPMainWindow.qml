import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

import CCStartup
import OL.Core
import OL.Control

import "agree"
import "content"

AppStartupItem {
    id: root
    asynchronous: true

    Config {
        id: config

        name: "homepage"
        group: "default"

        property ConfigObject system: ConfigObject {
            property bool agreementAccepted: false
        }

        property ConfigObject session: ConfigObject {
        }
    }

    AppStartupComponent {
        id: mainContentComp

        HPMainContent {
            id: content
            anchors.fill: parent

            AgreementPopup {
                id: agreementPopup

                anchors.centerIn: parent
                visible: !config.system.agreementAccepted && root.populate && OLModulePage.isActive

                onAccepted: {
                    config.system.agreementAccepted = true
                }
            }

            Connections {
                target: content.OLModulePage

                function onIsActiveChanged() {
                    if (content.OLModulePage.isActive) {
                        Style.mobile.statusbarTheme = Style.Light
                    }
                }
            }
        }
    }

    onPopulateChanged: {
        if (AppStartupItem.content.OLModulePage.isActive) {
            Style.mobile.statusbarTheme = Style.Light
        }
    }
}
