//
// Created by mousstach on 08/06/2021.
//
#pragma once

#include <QObject>

class DiveMission_Enums_CategoryInstruction {
    Q_GADGET

private:
    explicit DiveMission_Enums_CategoryInstruction() {}

public:
    enum CATEGORY_INSTRUCTION {
        TU = "Throttle up",
        TD = "Throttle down",
        RD = "Reach point",
        YR = "Yaw right",
        YL = "Yaw left",
        FF = "Forward",
        FB = "Backward",
        LR = "Lateral right",
        LL = "Lateral left",
        WT = "Wait"
    };
    Q_ENUM(CATEGORY_INSTRUCTION)
};