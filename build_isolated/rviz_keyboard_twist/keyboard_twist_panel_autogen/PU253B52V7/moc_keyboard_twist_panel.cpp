/****************************************************************************
** Meta object code from reading C++ file 'keyboard_twist_panel.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.8)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "rviz_keyboard_twist/keyboard_twist_panel.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'keyboard_twist_panel.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.8. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_autolabor_plugin__KeyboardTwistPanel_t {
    QByteArrayData data[8];
    char stringdata0[97];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_autolabor_plugin__KeyboardTwistPanel_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_autolabor_plugin__KeyboardTwistPanel_t qt_meta_stringdata_autolabor_plugin__KeyboardTwistPanel = {
    {
QT_MOC_LITERAL(0, 0, 36), // "autolabor_plugin::KeyboardTwi..."
QT_MOC_LITERAL(1, 37, 12), // "setMaxVLabel"
QT_MOC_LITERAL(2, 50, 0), // ""
QT_MOC_LITERAL(3, 51, 4), // "data"
QT_MOC_LITERAL(4, 56, 12), // "setMaxWLabel"
QT_MOC_LITERAL(5, 69, 7), // "setFlag"
QT_MOC_LITERAL(6, 77, 11), // "updateTopic"
QT_MOC_LITERAL(7, 89, 7) // "sendVel"

    },
    "autolabor_plugin::KeyboardTwistPanel\0"
    "setMaxVLabel\0\0data\0setMaxWLabel\0setFlag\0"
    "updateTopic\0sendVel"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_autolabor_plugin__KeyboardTwistPanel[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    1,   39,    2, 0x09 /* Protected */,
       4,    1,   42,    2, 0x09 /* Protected */,
       5,    1,   45,    2, 0x09 /* Protected */,
       6,    0,   48,    2, 0x09 /* Protected */,
       7,    0,   49,    2, 0x09 /* Protected */,

 // slots: parameters
    QMetaType::Void, QMetaType::Int,    3,
    QMetaType::Void, QMetaType::Int,    3,
    QMetaType::Void, QMetaType::Int,    3,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void autolabor_plugin::KeyboardTwistPanel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<KeyboardTwistPanel *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->setMaxVLabel((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 1: _t->setMaxWLabel((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 2: _t->setFlag((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 3: _t->updateTopic(); break;
        case 4: _t->sendVel(); break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject autolabor_plugin::KeyboardTwistPanel::staticMetaObject = { {
    &rviz::Panel::staticMetaObject,
    qt_meta_stringdata_autolabor_plugin__KeyboardTwistPanel.data,
    qt_meta_data_autolabor_plugin__KeyboardTwistPanel,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *autolabor_plugin::KeyboardTwistPanel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *autolabor_plugin::KeyboardTwistPanel::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_autolabor_plugin__KeyboardTwistPanel.stringdata0))
        return static_cast<void*>(this);
    return rviz::Panel::qt_metacast(_clname);
}

int autolabor_plugin::KeyboardTwistPanel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = rviz::Panel::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 5;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
