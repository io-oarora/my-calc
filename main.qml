import QtQuick 2.15
import QtQuick.Window 2.15

Window {

    /*** Properties ********************************************************************/

    width: appTheme.appWidth
    height: appTheme.appHeight
    visible: true
    title: qsTr(appTheme.appTitle)

    MyCalcTheme {
        id: appTheme
    }

    /*** Layout ************************************************************************/
    Item {
        anchors.fill: parent

        Rectangle {
            anchors.fill: parent

            color: appTheme.colorTeal
        }

        MyCalcInput {
            id: calcInput

            width: parent.width * .8
            height: parent.height * .125

            anchors {
                top: parent.top
                topMargin: parent.height * .175
                horizontalCenter: parent.horizontalCenter
            }
        }

        MyCalcButtons {
            id: calcButtons

            width: parent.width * .875
            height: parent.height * .5

            anchors {
                bottom: parent.bottom
                bottomMargin: parent.height * .1
                horizontalCenter: parent.horizontalCenter
            }
        }
    }
}
