#ifndef SRC_KEYBOARD_TWIST_PANEL_H
#define SRC_KEYBOARD_TWIST_PANEL_H

#include "string"
#include "map"

#include "ros/ros.h"
#include "rviz/panel.h"

#include "QSlider"
#include "QLabel"
#include "QKeyEvent"
#include "QCheckBox"
#include "QLineEdit"
#include "QString"

namespace autolabor_plugin {
    class KeyboardTwistPanel : public rviz::Panel {

    Q_OBJECT
    public:
        KeyboardTwistPanel(QWidget *parent = 0);

        virtual void load(const rviz::Config &config);

        virtual void save(rviz::Config config) const;

        virtual void keyPressEvent(QKeyEvent *event);

        virtual void keyReleaseEvent(QKeyEvent *event);

    protected Q_SLOTS:

        void setMaxVLabel(int data);

        void setMaxWLabel(int data);

        void setFlag(int data);

        void updateTopic();

        void sendVel();

    protected:
        QLineEdit *topic_edit_;
        QLabel *max_v_label_;
        QLabel *max_w_label_;
        QSlider *max_v_slider_;
        QSlider *max_w_slider_;
        QCheckBox *active_box_;

    private:
        QString output_topic_;
        bool send_flag_;
        bool stop_flag_;
        double max_v_, max_w_;
        bool button_up_, button_down_, button_left_, button_right_;
        std::map<int, int> key_pressed_flag_;

        ros::NodeHandle nh_;
        ros::Publisher velocity_publisher_;
        ros::Time last_pressed_time_;

    private:
        template<typename ...Args>
        inline std::string format_string(const char *format, Args... args) {
            constexpr size_t oldlen = BUFSIZ;
            char buffer[oldlen];

            size_t newlen = snprintf(&buffer[0], oldlen, format, args...);
            newlen++;

            if (newlen > oldlen) {
                std::vector<char> newbuffer(newlen);
                snprintf(newbuffer.data(), newlen, format, args...);
                return std::string(newbuffer.data());
            }
            return buffer;
        }

        bool checkUp();

        bool checkDown();

        bool checkLeft();

        bool checkRight();
    };
}


#endif //SRC_KEYBOARD_TWIST_PANEL_H
