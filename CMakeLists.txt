cmake_minimum_required(VERSION 3.20)
project(SkylerPlasmaTaskManager VERSION 1.0.0)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)

# ── KDE ECM ──────────────────────────────────────────
find_package(ECM REQUIRED CONFIG)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR})

# Set KDE install dirs before any find_package that pulls in GNUInstallDirs
if(NOT DEFINED KDE_INSTALL_PLUGINDIR)
    set(KDE_INSTALL_PLUGINDIR "${CMAKE_INSTALL_PREFIX}/lib/plugins" CACHE PATH "KDE plugin install dir")
endif()
if(NOT DEFINED KDE_INSTALL_QMLDIR)
    set(KDE_INSTALL_QMLDIR "${CMAKE_INSTALL_PREFIX}/lib/qt6/qml" CACHE PATH "QML install dir")
endif()

# Plasma macros set LIBRARY_OUTPUT_DIRECTORY based on CMAKE_LIBRARY_OUTPUT_DIRECTORY
if(NOT DEFINED CMAKE_LIBRARY_OUTPUT_DIRECTORY)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
endif()

# ── Qt ───────────────────────────────────────────────
find_package(Qt6 REQUIRED COMPONENTS Core Qml Quick)

# ── KF6 (separate packages for cleaner dependency management) ──
find_package(KF6 REQUIRED COMPONENTS I18n Notifications Service WindowSystem)
find_package(KF6Config REQUIRED)    # → KF6::ConfigGui
find_package(KF6KIO REQUIRED)       # → KF6::KIOCore KF6::KIOGui KF6::KIOFileWidgets
find_package(Plasma REQUIRED)       # → Plasma::Plasma (standalone, not under KF6)

# ── Plasma extras ────────────────────────────────────
find_package(PlasmaActivities REQUIRED)       # → Plasma::Activities
find_package(PlasmaActivitiesStats REQUIRED)   # → Plasma::ActivitiesStats
find_package(KSysGuard REQUIRED)               # → KSysGuard::ProcessCore
find_package(LibNotificationManager REQUIRED)  # → PW::LibNotificationManager

# ── Build ────────────────────────────────────────────
add_subdirectory(taskmanager-skyler)

# ── Install icontasks-skyler wrapper ─────────────────
plasma_install_package(icontasks-skyler org.kde.plasma.icontasks.skyler)

# ── Status ───────────────────────────────────────────
message(STATUS "")
message(STATUS "Skyler Plasma Task Manager ${PROJECT_VERSION}")
message(STATUS "  Install prefix: ${CMAKE_INSTALL_PREFIX}")
message(STATUS "  Plugin ID:      org.kde.plasma.icontasks.skyler")
message(STATUS "")
