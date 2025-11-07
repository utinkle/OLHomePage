import QtQuick
import QtQuick.Controls

import OL.Core

ScrollView {
    id: root

    property string textSource

    TextArea {
        id: textArea

        leftInset: 10
        rightInset: 10
        topInset: 10
        bottomInset: 10

        clip: true
        readOnly: true
        wrapMode: TextArea.NoWrap
        activeFocusOnPress: false
        background: null
        textFormat: TextEdit.RichText
    }

    FileIO {
        id: fileIO

        source: textSource
        onSourceChanged: {
            textArea.text = fileIO.read()
        }
    }
}
