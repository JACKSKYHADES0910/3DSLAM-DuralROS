/****************************************************************************
** Meta object code from reading C++ file 'autolabor_calibration_panel.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.8)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "rviz_autolabor_calibration/autolabor_calibration_panel.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'autolabor_calibration_panel.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.8. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_autolabor_plugin__AutolaborCalibrationPanel_t {
    QByteArrayData data[9];
    char stringdata0[131];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_autolabor_plugin__AutolaborCalibrationPanel_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_autolabor_plugin__AutolaborCalibrationPanel_t qt_meta_stringdata_autolabor_plugin__AutolaborCalibrationPanel = {
    {
QT_MOC_LITERAL(0, 0, 43), // "autolabor_plugin::AutolaborCa..."
QT_MOC_LITERAL(1, 44, 13), // "startDistance"
QT_MOC_LITERAL(2, 58, 0), // ""
QT_MOC_LITERAL(3, 59, 11), // "calDistance"
QT_MOC_LITERAL(4, 71, 10), // "startAngle"
QT_MOC_LITERAL(5, 82, 8), // "calAngle"
QT_MOC_LITERAL(6, 91, 18), // "checkDistanceEmpty"
QT_MOC_LITERAL(7, 110, 4), // "text"
QT_MOC_LITERAL(8, 115, 15) // "checkAngleEmpty"

    },
    "autolabor_plugin::AutolaborCalibrationPanel\0"
    "startDistance\0\0calDistance\0startAngle\0"
    "calAngle\0checkDistanceEmpty\0text\0"
    "checkAngleEmpty"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_autolabor_plugin__AutolaborCalibrationPanel[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   44,    2, 0x09 /* Protected */,
       3,    0,   45,    2, 0x09 /* Protected */,
       4,    0,   46,    2, 0x09 /* Protected */,
       5,    0,   47,    2, 0x09 /* Protected */,
       6,    1,   48,    2, 0x09 /* Protected */,
       8,    1,   51,    2, 0x09 /* Protected */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,    7,
    QMetaType::Void, QMetaType::QString,    7,

       0        // eod
};

void autolabor_plugin::AutolaborCalibrationPanel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<AutolaborCalibrationPanel *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->startDistance(); break;
        case 1: _t->calDistance(); break;
        case 2: _t->startAngle(); break;
        case 3: _t->calAngle(); break;
        case 4: _t->checkDistanceEmpty((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 5: _t->checkAngleEmpty((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject autolabor_plugin::AutolaborCalibrationPanel::staticMetaObject = { {
    &rviz::Panel::staticMetaObject,
    qt_meta_stringdata_autolabor_plugin__AutolaborCalibrationPanel.data,
    qt_meta_data_autolabor_plugin__AutolaborCalibrationPanel,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *autolabor_plugin::AutolaborCalibrationPanel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *autolabor_plugin::AutolaborCalibrationPanel::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_autolabor_plugin__AutolaborCalibrationPanel.stringdata0))
        return static_cast<void*>(this);
    return rviz::Panel::qt_metacast(_clname);
}

int autolabor_plugin::AutolaborCalibrationPanel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = rviz::Panel::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 6;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE