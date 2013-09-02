# Add more folders to ship with the application, here
folder_01.source = qml/petn9
folder_01.target = qml
DEPLOYMENTFOLDERS = folder_01

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

QT += sql

#defines
#NO_RANDOM_WORLDS = true
NEW_DB = true
ALLOW_JP = true #If you set unset this, then remember to alter debian/rules file override_dh_gencontrol
!isEmpty(NO_RANDOM_WORLDS) {
    DEFINES += NO_RANDOM_WORLDS
}
!isEmpty(NEW_DB) {
    DEFINES += NEW_DB
}
!isEmpty(ALLOW_JP) {
    DEFINES += ALLOW_JP
}


symbian:TARGET.UID3 = 0xE0DDC984

# Smart Installer package's UID
# This UID is from the protected range and therefore the package will
# fail to install if self-signed. By default qmake uses the unprotected
# range value if unprotected UID is defined for the application and
# 0x2002CCCF value if protected UID is given to the application
#symbian:DEPLOYMENT.installer_header = 0x2002CCCF

# Allow network access on Symbian
symbian:TARGET.CAPABILITY += NetworkServices

# If your application uses the Qt Mobility libraries, uncomment the following
# lines and add the respective components to the MOBILITY variable.
# CONFIG += mobility
# MOBILITY +=

# Speed up launching on MeeGo/Harmattan when using applauncherd daemon
CONFIG += qdeclarative-boostable

# Add dependency to Symbian components
# CONFIG += qt-components

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    databasemanager.cpp \
    appsettings.cpp \
    manager.cpp

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

include(models/models.pri)
include(qtdeclarative-helper/declarativelist.pri)

OTHER_FILES += \
    qtc_packaging/debian_harmattan/rules \
    qtc_packaging/debian_harmattan/README \
    qtc_packaging/debian_harmattan/manifest.aegis \
    qtc_packaging/debian_harmattan/copyright \
    qtc_packaging/debian_harmattan/compat \
    qtc_packaging/debian_harmattan/changelog \
    qtc_packaging/debian_harmattan/control \
    qtc_packaging/debian_harmattan/controljp \
    models/models.pri \
    qtdeclarative-helper/declarativelist.pri \
    petn9.sql \
    petn980.png \
    petn964.png \
    petn9.desktop \
    petn9_harmattan-ja_JP.desktop \
    petn9_harmattan.desktop \
    i18n/tr_jp.qm \
    i18n/tr_en.qm \
    images/hamburger.png

HEADERS += \
    databasemanager.h \
    appsettings.h \
    manager.h

RESOURCES += \
    petn9.qrc \
    images.qrc \
    translations.qrc
