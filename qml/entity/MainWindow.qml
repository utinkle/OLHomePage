import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

import CCStartup

AppStartupItem {
    id: root
    asynchronous: true

    AppStartupComponent {
        id: mainContentComp

        Rectangle {
            id: rect1
            anchors.fill: parent
            color: "pink"
        }
    }

    AppStartupComponent {
        id: agreementDialogComp

        Popup {
            id: agreementDialog
            anchors.centerIn: parent
            width: parent.width * 0.6
            height: Math.min(parent.height * 0.8, 500)

            visible: root.populate
            modal: true
            closePolicy: Popup.NoAutoClose
            margins: 20

            background: Rectangle {
                color: "white"
                radius: 16
            }

            enter: Transition {
                NumberAnimation {
                    property: "scale"
                    from: 0.0
                    to: 1.0
                    easing.type: Easing.OutBack
                }
            }

            exit: Transition {
                NumberAnimation {
                    property: "scale"
                    from: 1.0
                    to: 0.0
                    easing.type: Easing.InBack
                }
            }

            ColumnLayout {
                spacing: 20
                anchors.fill: parent

                ColumnLayout {
                    spacing: 20
                    Layout.fillWidth: true

                    Rectangle {
                        id: header
                        Layout.fillWidth: true
                        Layout.preferredHeight: 40

                        radius: 8
                        color: Qt.rgba(0.0, 0.0, 0.0, 0.05)

                        Row {
                            anchors.fill: parent
                            anchors.margins: 10
                            spacing: 6

                            Image {
                                anchors.verticalCenter: parent.verticalCenter
                                source: "qrc:/OLHomePage/resources/OrangeLive.png"
                                sourceSize: Qt.size(24, 24)
                            }

                            Text {
                                anchors.verticalCenter: parent.verticalCenter
                                font.bold: true
                                font.pixelSize: 14
                                text: "橙子工具台"
                            }
                        }
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    color: Qt.rgba(0.0, 0.0, 0.0, 0.05)
                    radius: 8

                    ColumnLayout {
                        anchors.fill: parent

                        ScrollView {
                            id: scrollView
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            Layout.margins: 10
                            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                            ScrollBar.horizontal.interactive: false

                            ColumnLayout {
                                width: scrollView.width
                                spacing: 20

                                Text {
                                    Layout.topMargin: 10
                                    Layout.alignment: Qt.AlignHCenter
                                    text: "欢迎使用「橙子工具台」！"

                                    font.bold: true
                                    font.pixelSize: 16
                                    color: Material.accentColor
                                }

                                Text {
                                    Layout.alignment: Qt.AlignHCenter
                                    text: "在开始前，请花一点时间阅读我们的用户协议\n我们珍视您的信任，并致力于保护您的隐私。"
                                    font.pixelSize: 14
                                    color: Qt.rgba(0, 0, 0, 0.6)
                                }

                                Rectangle {
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: childrenRect.height + 20

                                    color: "transparent"
                                    border.color: Qt.rgba(0.2, 0.2, 0.2, 0.1)
                                    border.width: 1
                                    radius: 8

                                    ColumnLayout {
                                        width: parent.width - 40
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        anchors.top: parent.top
                                        anchors.topMargin: 10
                                        anchors.leftMargin: 20
                                        spacing: 2

                                        Text {
                                            text: "<a href=\"http://test.url\" target=\"_self\">• 用户协议</a>"
                                        }

                                        Text {
                                            text: "<a href=\"http://test.url\" target=\"_self\">• 隐私政策</a>"
                                        }

                                        Text {
                                            text: "<a href=\"http://test.url\" target=\"_self\">• 插件生态与安全</a>"
                                        }

                                        Text {
                                            text: "<a href=\"http://test.url\" target=\"_self\">• 程序如何使用</a>"
                                        }

                                        Text {
                                            text: "<a href=\"http://test.url\" target=\"_self\">• 您的权利与责任</a>"
                                        }

                                    }
                                }
                            }
                        }

                        Rectangle {
                            Layout.preferredHeight: 1
                            Layout.fillWidth: true

                            color: Qt.rgba(0.2, 0.2, 0.2, 0.1)
                        }

                        CheckBox {
                            Layout.leftMargin: 10
                            text: "我已阅读并同意上述内容"
                        }
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50

                    radius: 8
                    color: Qt.rgba(0.0, 0.0, 0.0, 0.05)

                    RowLayout {
                        spacing: 20
                        anchors.fill: parent

                        Item { Layout.fillWidth: true }

                        Button {
                            Layout.alignment: Qt.AlignVCenter

                            text: "同意并继续"
                            font.pixelSize: 12
                            Material.foreground: Material.primary
                            Material.background: Material.accent
                            Material.roundedScale: Material.SmallScale

                            onClicked: {
                                agreementDialog.close()
                            }
                        }

                        Rectangle {
                            color: Qt.rgba(0.2, 0.2, 0.2, 0.6)
                            height: parent.height * 0.8
                            width: 1
                            Layout.alignment: Qt.AlignVCenter
                        }

                        Button {
                            Layout.alignment: Qt.AlignVCenter

                            text: "取消并退出"
                            font.pixelSize: 12
                            Material.roundedScale: Material.SmallScale

                            onClicked: {
                                Qt.quit()
                            }
                        }

                        Item { Layout.fillWidth: true }
                    }
                }
            }
        }
    }
}
