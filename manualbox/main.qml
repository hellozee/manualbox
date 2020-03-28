import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
import QtQuick.Dialogs 1.0
import QtQuick.Controls.Styles 1.4

ApplicationWindow {
    width: 800
    height: 600
    visible: true
    title: "ManualBox"

    ColumnLayout{
        spacing: 10
        anchors.fill: parent
        anchors.margins: 10
        RowLayout{

            Image {
                source: "assets/mainicon.png"
                height: 100
            }

            ColumnLayout{
                RowLayout{
                    Text {
                        text: qsTr("Location")
                    }
                    TextField{
                        id: secureFolder
                        Layout.fillWidth: true
                        text: guiController.currentDir
                    }
                    Button{
                        text: qsTr("...")
                        onClicked: folderChooser.open()
                    }
                }

                RowLayout{
                    Text {
                        text: qsTr("Password")
                    }
                    TextField{
                        id: folderPass
                        echoMode: TextField.Password
                        Layout.fillWidth: true
                        text: guiController.currentPass
                    }
                }
            }

            Button{
                id: mountButton
                text: guiController.buttonText
                Layout.minimumHeight: 90
                onClicked:{
                    guiController.currentDir = secureFolder.text
                    guiController.currentPass = folderPass.text
                    guiController.processInput()
                }
            }
        }

        Rectangle{
            Layout.fillHeight: true
            Layout.fillWidth: true
            Text{
                text: guiController.outputContent
            }
            border.width: 1
        }
    }

    FileDialog {
        id: folderChooser
        title: "Please choose a folder"
        folder: shortcuts.home
        onAccepted: {
            secureFolder.text = folderChooser.fileUrl
        }
        onRejected: {
            console.log("Canceled")
        }
        selectFolder: true
    }
}
