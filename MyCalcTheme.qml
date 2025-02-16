import QtQuick 2.15
import QtQuick.Window 2.15

QtObject {

    /*** Properties ********************************************************************/

    property color colorBlack: "#000000"
    property color colorGray: "#D9D9D9"
    property color colorGray1: "#A6A6A6"
    property color colorOrange: "#FF914D"
    property color colorTeal: "#03989E"
    property color colorWhite: "#FFFFFF"

    property real appWidth: 9 * appRatioMultiplier
    property real appHeight: 16 * appRatioMultiplier
    property real appRatioMultiplier: 35

    property string appTitle: "My Calc"
}
