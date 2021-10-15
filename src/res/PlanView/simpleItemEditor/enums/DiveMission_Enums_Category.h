//
// Created by mousstach on 08/06/2021.
//
#pragma once

#include <QObject>

class DiveMission_Enums_Category : public QObject {
    Q_OBJECT

public:
    enum CATEGORY {
        INSTRUCTION = 0,
        POWER = 1,
        UNIT = 2,
        FACTOR = 3
    };
    Q_ENUM(CATEGORY)

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

public:
    explicit DiveMission_Enums_Category(QObject *parent = nullptr);
    std::String getCategoryName();
};