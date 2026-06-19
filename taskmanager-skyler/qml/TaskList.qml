/*
    SPDX-FileCopyrightText: 2012-2013 Eike Hein <hein@kde.org>

    SPDX-License-Identifier: GPL-2.0-or-later
*/

import QtQuick

import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore
import plasma.applet.org.kde.plasma.taskmanager.skyler as TaskManagerApplet

Item {
    id: root

    property bool animating: false

    property int animationsRunning: 0
    onAnimationsRunningChanged: { animating = animationsRunning > 0 }

    required property int count

    readonly property bool vertical: Plasmoid.formFactor === PlasmaCore.Types.Vertical

    readonly property real minimumWidth: rowLayout.children
        .filter(item => item.visible && item.width > 0)
        .reduce((m, item) => Math.min(m, item.width), Infinity)

    readonly property int rows: 1
    readonly property int columns: count

    implicitWidth: Math.max(minimumWidth, rowLayout.width)
    implicitHeight: rowLayout.height

    property alias rowLayout: rowLayout
    property real maxWidth: 0

    Row {
        id: rowLayout
        spacing: 0

        move: Transition {
            NumberAnimation { properties: "x,y"; duration: 400; easing.type: Easing.OutCubic }
        }
    }
}
