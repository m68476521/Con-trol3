TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp

RESOURCES += qml.qrc imagen

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

unix: CONFIG += link_pkgconfig
#unix: PKGCONFIG += imagen

#DISTFILES += \
#    components/Beginner.qml \
#    ../../../../../Downloads/xj4crfJ.jpg

#DISTFILES += \
#    imagen/scarface.jpg

#ASSETS =

DISTFILES += \
    components/Beginner.qml \
    imagen/scarface.jpg
