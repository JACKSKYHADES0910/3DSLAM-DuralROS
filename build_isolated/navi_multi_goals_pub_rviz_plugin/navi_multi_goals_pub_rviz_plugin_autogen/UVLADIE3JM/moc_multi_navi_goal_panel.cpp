/****************************************************************************
** Meta object code from reading C++ file 'multi_navi_goal_panel.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.8)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../src/tool/navi_multi_goals_pub_rviz_plugin/src/multi_navi_goal_panel.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'multi_navi_goal_panel.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.8. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_navi_multi_goals_pub_rviz_plugin__MultiNaviGoalsPanel_t {
    QByteArrayData data[27];
    char stringdata0[424];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_navi_multi_goals_pub_rviz_plugin__MultiNaviGoalsPanel_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_navi_multi_goals_pub_rviz_plugin__MultiNaviGoalsPanel_t qt_meta_stringdata_navi_multi_goals_pub_rviz_plugin__MultiNaviGoalsPanel = {
    {
QT_MOC_LITERAL(0, 0, 53), // "navi_multi_goals_pub_rviz_plu..."
QT_MOC_LITERAL(1, 54, 13), // "setMaxNumGoal"
QT_MOC_LITERAL(2, 68, 0), // ""
QT_MOC_LITERAL(3, 69, 10), // "maxNumGoal"
QT_MOC_LITERAL(4, 80, 9), // "writePose"
QT_MOC_LITERAL(5, 90, 19), // "geometry_msgs::Pose"
QT_MOC_LITERAL(6, 110, 4), // "pose"
QT_MOC_LITERAL(7, 115, 8), // "markPose"
QT_MOC_LITERAL(8, 124, 36), // "geometry_msgs::PoseStamped::C..."
QT_MOC_LITERAL(9, 161, 10), // "deleteMark"
QT_MOC_LITERAL(10, 172, 16), // "updateMaxNumGoal"
QT_MOC_LITERAL(11, 189, 13), // "initPoseTable"
QT_MOC_LITERAL(12, 203, 15), // "updatePoseTable"
QT_MOC_LITERAL(13, 219, 9), // "startNavi"
QT_MOC_LITERAL(14, 229, 10), // "cancelNavi"
QT_MOC_LITERAL(15, 240, 7), // "addPose"
QT_MOC_LITERAL(16, 248, 9), // "goalCntCB"
QT_MOC_LITERAL(17, 258, 8), // "statusCB"
QT_MOC_LITERAL(18, 267, 41), // "actionlib_msgs::GoalStatusArr..."
QT_MOC_LITERAL(19, 309, 8), // "statuses"
QT_MOC_LITERAL(20, 318, 10), // "checkCycle"
QT_MOC_LITERAL(21, 329, 12), // "completeNavi"
QT_MOC_LITERAL(22, 342, 9), // "cycleNavi"
QT_MOC_LITERAL(23, 352, 9), // "checkGoal"
QT_MOC_LITERAL(24, 362, 39), // "std::vector<actionlib_msgs::G..."
QT_MOC_LITERAL(25, 402, 11), // "status_list"
QT_MOC_LITERAL(26, 414, 9) // "startSpin"

    },
    "navi_multi_goals_pub_rviz_plugin::MultiNaviGoalsPanel\0"
    "setMaxNumGoal\0\0maxNumGoal\0writePose\0"
    "geometry_msgs::Pose\0pose\0markPose\0"
    "geometry_msgs::PoseStamped::ConstPtr\0"
    "deleteMark\0updateMaxNumGoal\0initPoseTable\0"
    "updatePoseTable\0startNavi\0cancelNavi\0"
    "addPose\0goalCntCB\0statusCB\0"
    "actionlib_msgs::GoalStatusArray::ConstPtr\0"
    "statuses\0checkCycle\0completeNavi\0"
    "cycleNavi\0checkGoal\0"
    "std::vector<actionlib_msgs::GoalStatus>\0"
    "status_list\0startSpin"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_navi_multi_goals_pub_rviz_plugin__MultiNaviGoalsPanel[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      17,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    1,   99,    2, 0x0a /* Public */,
       4,    1,  102,    2, 0x0a /* Public */,
       7,    1,  105,    2, 0x0a /* Public */,
       9,    0,  108,    2, 0x0a /* Public */,
      10,    0,  109,    2, 0x09 /* Protected */,
      11,    0,  110,    2, 0x09 /* Protected */,
      12,    0,  111,    2, 0x09 /* Protected */,
      13,    0,  112,    2, 0x09 /* Protected */,
      14,    0,  113,    2, 0x09 /* Protected */,
      15,    0,  114,    2, 0x09 /* Protected */,
      16,    1,  115,    2, 0x09 /* Protected */,
      17,    1,  118,    2, 0x09 /* Protected */,
      20,    0,  121,    2, 0x09 /* Protected */,
      21,    0,  122,    2, 0x09 /* Protected */,
      22,    0,  123,    2, 0x09 /* Protected */,
      23,    1,  124,    2, 0x09 /* Protected */,
      26,    0,  127,    2, 0x09 /* Protected */,

 // slots: parameters
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::Void, 0x80000000 | 5,    6,
    QMetaType::Void, 0x80000000 | 8,    6,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, 0x80000000 | 8,    6,
    QMetaType::Void, 0x80000000 | 18,   19,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Bool, 0x80000000 | 24,   25,
    QMetaType::Void,

       0        // eod
};

void navi_multi_goals_pub_rviz_plugin::MultiNaviGoalsPanel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<MultiNaviGoalsPanel *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->setMaxNumGoal((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 1: _t->writePose((*reinterpret_cast< geometry_msgs::Pose(*)>(_a[1]))); break;
        case 2: _t->markPose((*reinterpret_cast< const geometry_msgs::PoseStamped::ConstPtr(*)>(_a[1]))); break;
        case 3: _t->deleteMark(); break;
        case 4: _t->updateMaxNumGoal(); break;
        case 5: _t->initPoseTable(); break;
        case 6: _t->updatePoseTable(); break;
        case 7: _t->startNavi(); break;
        case 8: _t->cancelNavi(); break;
        case 9: _t->addPose(); break;
        case 10: _t->goalCntCB((*reinterpret_cast< const geometry_msgs::PoseStamped::ConstPtr(*)>(_a[1]))); break;
        case 11: _t->statusCB((*reinterpret_cast< const actionlib_msgs::GoalStatusArray::ConstPtr(*)>(_a[1]))); break;
        case 12: _t->checkCycle(); break;
        case 13: _t->completeNavi(); break;
        case 14: _t->cycleNavi(); break;
        case 15: { bool _r = _t->checkGoal((*reinterpret_cast< std::vector<actionlib_msgs::GoalStatus>(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 16: _t->startSpin(); break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject navi_multi_goals_pub_rviz_plugin::MultiNaviGoalsPanel::staticMetaObject = { {
    &rviz::Panel::staticMetaObject,
    qt_meta_stringdata_navi_multi_goals_pub_rviz_plugin__MultiNaviGoalsPanel.data,
    qt_meta_data_navi_multi_goals_pub_rviz_plugin__MultiNaviGoalsPanel,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *navi_multi_goals_pub_rviz_plugin::MultiNaviGoalsPanel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *navi_multi_goals_pub_rviz_plugin::MultiNaviGoalsPanel::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_navi_multi_goals_pub_rviz_plugin__MultiNaviGoalsPanel.stringdata0))
        return static_cast<void*>(this);
    return rviz::Panel::qt_metacast(_clname);
}

int navi_multi_goals_pub_rviz_plugin::MultiNaviGoalsPanel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = rviz::Panel::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 17)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 17;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 17)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 17;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
