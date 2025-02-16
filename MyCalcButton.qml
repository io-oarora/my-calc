import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Item {

    /*** Properties ********************************************************************/

    id: calcButton
    scale: calcButtonMa.pressed ? 1.05 : 1

    property string buttonText: "-"
    property color buttonColor: appTheme.colorGray
    property color buttonTextColor: appTheme.colorBlack

    property var clickFunction: undefined

    /*** Layout ************************************************************************/

    Rectangle {
        id: calcButtonBackground
        anchors.fill: parent
        radius: width * .175

        color: calcButton.buttonColor
    }

    DropShadow {
        anchors.fill: calcButtonBackground
        horizontalOffset: 3
        verticalOffset: 3
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: calcButtonBackground
    }

    Label {
        width: parent.width * .55
        height: width
        anchors.centerIn: parent

        minimumPixelSize: 1
        font.pixelSize: 600
        fontSizeMode: Text.Fit

        text: calcButton.buttonText
        color: calcButton.buttonTextColor

        font.weight: Font.Bold
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    MouseArea {
        id: calcButtonMa
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            if (clickFunction) {
                clickFunction()
            }
        }
    }
}
