QT += quick multimedia

CONFIG += c++11 debug_and_release

CONFIG(debug, debug|release) {
    DEFINES -= NO_BUFFER_OUTPUT
} else {
    DEFINES += NO_BUFFER_OUTPUT
}

INCLUDEPATH += $$PWD/ffmpeg/include

LIBS += -L$$PWD/ffmpeg/lib \
        -lavcodec \
        -lavformat \
        -lavutil \
        -lswscale \
        -lswresample \
        -lDwmapi

RC_ICONS += image/music.ico

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

HEADERS += \
    src/audiodecoder.h \
    src/bufferqueue.h \
    src/framelesswindow.h \
    src/imageprovider.h \
    src/lrcdecoder.h \
    src/lyricsmodel.h \
    src/musicplayer.h

SOURCES += \
    src/audiodecoder.cpp \
    src/framelesswindow.cpp \
    src/imageprovider.cpp \
    src/lrcdecoder.cpp \
    src/lyricsmodel.cpp \
    src/main.cpp \
    src/musicplayer.cpp

RESOURCES += \
    qml.qrc \
    image.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target