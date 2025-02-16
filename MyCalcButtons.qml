import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts

Item {

    /*** Properties ********************************************************************/

    id: calcButtons

    property int rowCount: 4
    property int colCount: 4

    property real buttonWidth: width * .2
    property real buttonHeight: buttonWidth

    property real rowSpacingAllocation: height - (buttonHeight * rowCount)
    property real colSpacingAllocation: width - (buttonWidth * colCount)

    property real rowSpacing: rowSpacingAllocation / (rowCount - 1)
    property real colSpacing: colSpacingAllocation / (colCount - 1)

    property var buttonsModel: [
        { "buttonText": "7", "buttonTextColor": appTheme.colorBlack, "buttonColor": appTheme.colorGray, "buttonType": "digit" },
        { "buttonText": "8", "buttonTextColor": appTheme.colorBlack, "buttonColor": appTheme.colorGray, "buttonType": "digit" },
        { "buttonText": "9", "buttonTextColor": appTheme.colorBlack, "buttonColor": appTheme.colorGray, "buttonType": "digit" },
        { "buttonText": "÷", "buttonTextColor": appTheme.colorWhite, "buttonColor": appTheme.colorOrange, "buttonType": "operator" },
        { "buttonText": "4", "buttonTextColor": appTheme.colorBlack, "buttonColor": appTheme.colorGray, "buttonType": "digit" },
        { "buttonText": "5", "buttonTextColor": appTheme.colorBlack, "buttonColor": appTheme.colorGray, "buttonType": "digit" },
        { "buttonText": "6", "buttonTextColor": appTheme.colorBlack, "buttonColor": appTheme.colorGray, "buttonType": "digit" },
        { "buttonText": "x", "buttonTextColor": appTheme.colorWhite, "buttonColor": appTheme.colorOrange, "buttonType": "operator" },
        { "buttonText": "1", "buttonTextColor": appTheme.colorBlack, "buttonColor": appTheme.colorGray, "buttonType": "digit" },
        { "buttonText": "2", "buttonTextColor": appTheme.colorBlack, "buttonColor": appTheme.colorGray, "buttonType": "digit" },
        { "buttonText": "3", "buttonTextColor": appTheme.colorBlack, "buttonColor": appTheme.colorGray, "buttonType": "digit" },
        { "buttonText": "-", "buttonTextColor": appTheme.colorWhite, "buttonColor": appTheme.colorOrange, "buttonType": "operator" },
        { "buttonText": "0", "buttonTextColor": appTheme.colorBlack, "buttonColor": appTheme.colorGray, "buttonType": "digit" },
        { "buttonText": "C", "buttonTextColor": appTheme.colorWhite, "buttonColor": appTheme.colorGray1, "buttonType": "clear" },
        { "buttonText": "=", "buttonTextColor": appTheme.colorWhite, "buttonColor": appTheme.colorOrange, "buttonType": "operator" },
        { "buttonText": "+", "buttonTextColor": appTheme.colorWhite, "buttonColor": appTheme.colorOrange, "buttonType": "operator" }
    ]


    /*** Layout ************************************************************************/

    GridLayout {
        rows: calcButtons.rowCount
        rowSpacing: calcButtons.rowSpacing

        columns: calcButtons.colCount
        columnSpacing: calcButtons.colSpacing

        Repeater {

            MyCalcButton {
                implicitWidth: calcButtons.buttonWidth
                implicitHeight: calcButtons.buttonHeight

                buttonText: modelData.buttonText
                buttonTextColor: modelData.buttonTextColor
                buttonColor: modelData.buttonColor

                clickFunction: function() {
                    renderInput(modelData.buttonText, modelData.buttonType)
                }
            }

            model: buttonsModel
        }
    }

    /*** Functions ********************************************************************/
    function renderInput(buttonText, buttonType) {

        switch (buttonType) {
        case 'clear':
            calcInput.inputText = "0"
            break;
        case 'digit':
            var currentInput = calcInput.inputText
            if (currentInput === "0" || currentInput === "Error") {
                calcInput.inputText = ""
            }
            calcInput.inputText = calcInput.inputText + buttonText

            break;
        case 'operator':
            if (calcInput.inputText === "Error") {
                calcInput.inputText = "0"
            }
            handleOperator(buttonText)
            break;
        default:
            break;
        }
    }

    function handleOperator(operator) {
        if (operator === "=") {
            calcInput.inputText = evaluateOperation()
        } else {
            var operation = calcInput.inputText.trim().split(" ")
            if (operation.length === 2) {
                calcInput.inputText = operation[0]
            }

            if (operation.length === 3) {
                let outcome = evaluateOperation()
                calcInput.inputText = outcome

                if (calcInput.inputText === "Error") {
                    return
                }
            }

            calcInput.inputText = calcInput.inputText + " " + operator + " "
        }
    }

    function evaluateOperation() {
        var operation = calcInput.inputText.trim().split(" ")

        if (operation.length === 1) {
            return operation[0]
        }

        let operand1 = parseInt(operation[0])
        let operator = operation[1]
        let operand2 = (operation.length === 2) ? operand1 : parseInt(operation[2])

        switch(operator) {
        case "+":
            return add(operand1, operand2)
        case "-":
            return subtract(operand1, operand2)
        case "x":
            return multiply(operand1, operand2)
        case "÷":
            return divide(operand1, operand2)
        default:
            return ""
        }
    }

    function add(operand1, operand2) {
        return operand1 + operand2
    }

    function subtract(operand1, operand2) {
        return operand1 - operand2
    }

    function multiply(operand1, operand2) {
        return operand1 * operand2
    }

    function divide(operand1, operand2) {
        if (operand2 === 0) {
            return "Error"
        }

        return operand1 / operand2
    }

}
