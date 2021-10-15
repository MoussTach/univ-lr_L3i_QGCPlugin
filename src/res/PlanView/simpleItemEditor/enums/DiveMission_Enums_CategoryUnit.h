//
// Created by mousstach on 08/06/2021.
//
#pragma once

#include <QObject>

class DiveMission_Enums_CategoryUnit {
    Q_GADGET

private:
    explicit DiveMission_Enums_CategoryUnit() {}

public:
    enum CATEGORY_UNIT {
        T = "Time",
        D = "Distance"
    };
    Q_ENUM(CATEGORY_UNIT)
};