import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls

Item {

    /*** Properties ********************************************************************/

    id: calcInput

    property string inputText: "0"
    /*** Layout ************************************************************************/

    Label {
        anchors.fill: parent

        minimumPixelSize: 1
        font.pixelSize: 600
        fontSizeMode: Text.Fit

        text: calcInput.inputText
        color: appTheme.colorWhite

        font.weight: Font.Bold
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
    }
}
