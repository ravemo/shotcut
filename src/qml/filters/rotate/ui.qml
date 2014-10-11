/*
 * Copyright (c) 2013-2014 Meltytech, LLC
 * Author: Dan Dennedy <dan@dennedy.org>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0
import Shotcut.Controls 1.0

Rectangle {
    width: 400
    height: 200
    color: 'transparent'
    Component.onCompleted: {
        if (filter.isNew) {
            // Set default parameter values
            filter.set('transition.fix_rotate_x', 0)
            slider.value = filter.getDouble('transition.fix_rotate_x')
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 8

        RowLayout {
            Label { text: qsTr('Rotation') }
            SliderSpinner {
                id: slider
                Layout.fillWidth: true
                Layout.minimumWidth: 100
                minimumValue: 0
                maximumValue: 360
                decimals: 1
                spinnerWidth: 110
                suffix: qsTr(' degree')
                value: filter.getDouble('transition.fix_rotate_x')
                onValueChanged: filter.set('transition.fix_rotate_x', value)
            }
            UndoButton {
                onClicked: slider.value = 0
            }
        }
        Item {
            Layout.fillHeight: true;
        }
    }
}
