cmake_minimum_required(VERSION 3.20)
project(SkylerPlasmaTaskManager VERSION 1.0.0)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# ── KDE ECM ──────────────────────────────────────────
find_package(ECM REQUIRED CONFIG)
set(CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR})

# ── Qt ───────────────────────────────────────────────
find_package(Qt6 REQUIRED COMPONENTS Core Qml Quick)

# ── KF6 ──────────────────────────────────────────────
find_package(KF6 REQUIRED COMPONENTS
    Plasma
    I18n
    ConfigGui
    KIOCore
    KIOGui
    KIOFileWidgets
    Notifications
    Service
    WindowSystem
)

# ── Plasma extras ────────────────────────────────────
find_package(PlasmaActivities REQUIRED)      # → Plasma::Activities
find_package(PlasmaActivitiesStats REQUIRED)  # → Plasma::ActivitiesStats
find_package(KSysGuard REQUIRED)              # → KSysGuard::ProcessCore
find_package(LibNotificationManager REQUIRED) # → PW::LibNotificationManager

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
