message("Adding Custom Plugin")

#-- Version control
#   Major and minor versions are defined here (manually)

CUSTOM_QGC_VER_MAJOR = 0
CUSTOM_QGC_VER_MINOR = 0
CUSTOM_QGC_VER_FIRST_BUILD = 0

# Build number is automatic
# Uses the current branch. This way it works on any branch including build-server's PR branches
CUSTOM_QGC_VER_BUILD = $$system(git --git-dir ../.git rev-list $$GIT_BRANCH --first-parent --count)
win32 {
    CUSTOM_QGC_VER_BUILD = $$system("set /a $$CUSTOM_QGC_VER_BUILD - $$CUSTOM_QGC_VER_FIRST_BUILD")
} else {
    CUSTOM_QGC_VER_BUILD = $$system("echo $(($$CUSTOM_QGC_VER_BUILD - $$CUSTOM_QGC_VER_FIRST_BUILD))")
}
CUSTOM_QGC_VERSION = $${CUSTOM_QGC_VER_MAJOR}.$${CUSTOM_QGC_VER_MINOR}.$${CUSTOM_QGC_VER_BUILD}

DEFINES -= GIT_VERSION=\"\\\"$$GIT_VERSION\\\"\"
DEFINES += GIT_VERSION=\"\\\"$$CUSTOM_QGC_VERSION\\\"\"

message(Custom QGC Version: $${CUSTOM_QGC_VERSION})

# Build a single flight stack by disabling APM support
#MAVLINK_CONF = common
#CONFIG  += QGC_DISABLE_APM_MAVLINK
#CONFIG  += QGC_DISABLE_APM_PLUGIN QGC_DISABLE_APM_PLUGIN_FACTORY

# We implement our own PX4 plugin factory
#CONFIG  += QGC_DISABLE_PX4_PLUGIN_FACTORY

# Branding

DEFINES += CUSTOMHEADER=\"\\\"CustomPlugin.h\\\"\"
DEFINES += CUSTOMCLASS=CustomPlugin

TARGET   = L3i_QGroundControl
DEFINES += QGC_APPLICATION_NAME='"\\\"L3i QGroundControl\\\""'

DEFINES += QGC_ORG_NAME=\"\\\"qgroundcontrol.org\\\"\"
DEFINES += QGC_ORG_DOMAIN=\"\\\"org.qgroundcontrol\\\"\"

QGC_APP_NAME        = "L3i QGroundControl"
QGC_BINARY_NAME     = "CustomL3i_QGroundControl"
QGC_ORG_NAME        = "L3i"
QGC_ORG_DOMAIN      = "org.custom"
QGC_ANDROID_PACKAGE = "org.custom.qgroundcontrol"
QGC_APP_DESCRIPTION = "L3i QGroundControl"
QGC_APP_COPYRIGHT   = "Copyright (C) 2020 QGroundControl Development Team. All rights reserved."

# Our own, custom resources
RESOURCES += \
    $$PWD/custom.qrc

QML_IMPORT_PATH += \
   $$PWD/res \
   $$PWD/PlanView

# Our own, custom sources
SOURCES += \
    $$PWD/src/CustomPlugin.cc \
    $$PWD/src/simpleItemEditor/DiveMission_TableModel.cpp \
    $$PWD/src/simpleItemEditor/DiveMission_data.cpp \

HEADERS += \
    $$PWD/src/CustomPlugin.h \
    $$PWD/src/FileIO.h \
    $$PWD/src/simpleItemEditor/DiveMission_TableModel.h \
    $$PWD/src/simpleItemEditor/DiveMission_data.h \

INCLUDEPATH += \
    $$PWD/src \