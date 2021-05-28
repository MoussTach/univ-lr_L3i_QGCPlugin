QMAKE_POST_LINK += && $$QMAKE_COPY $$PWD/deploy/qgroundcontrol-start.sh $$DESTDIR
QMAKE_POST_LINK += && $$QMAKE_COPY $$PWD/deploy/qgroundcontrol.desktop $$DESTDIR
QMAKE_POST_LINK += && $$QMAKE_COPY $$PWD/res/Images/CustomL3i_AppIcon.png $$DESTDIR
