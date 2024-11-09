#include <QtCore/QCoreApplication>
#include "rviz_keyboard_twist/keyboard_twist_panel.h"
#include "geometry_msgs/Twist.h"

#include "QHBoxLayout"
#include "QVBoxLayout"

#include "QTimer"

namespace autolabor_plugin {

    KeyboardTwistPanel::KeyboardTwistPanel(QWidget *parent) : rviz::Panel(parent), button_up_(false),
                                                              button_down_(false), button_left_(false),
                                                              button_right_(false), output_topic_("/cmd_vel") {
        QVBoxLayout *panel_layout = new QVBoxLayout;
        // topic
        QHBoxLayout *topic_layout = new QHBoxLayout;
        topic_layout->addWidget(new QLabel("话题名 : "));
        topic_edit_ = new QLineEdit(output_topic_);
        topic_layout->addWidget(topic_edit_);
        // max_v
        QHBoxLayout *linear_speed_layout = new QHBoxLayout;
        linear_speed_layout->addWidget(new QLabel("线速度 : "));
        max_v_slider_ = new QSlider(Qt::Orientation::Horizontal);
        max_v_slider_->setMinimum(0);
        max_v_slider_->setMaximum(10);
        max_v_slider_->setPageStep(1);
        max_v_slider_->setValue(2);
        linear_speed_layout->addWidget(max_v_slider_);
        max_v_label_ = new QLabel("0.2 m/s");
        max_v_ = 0.2;
        max_v_label_->setFixedWidth(60);
        linear_speed_layout->addWidget(max_v_label_);
        // max_w
        QHBoxLayout *angle_speed_layout = new QHBoxLayout;
        angle_speed_layout->addWidget(new QLabel("角速度 : "));
        max_w_slider_ = new QSlider(Qt::Orientation::Horizontal);
        max_w_slider_->setMinimum(0);
        max_w_slider_->setMaximum(10);
        max_w_slider_->setPageStep(1);
        max_w_slider_->setValue(2);
        angle_speed_layout->addWidget(max_w_slider_);
        max_w_label_ = new QLabel("0.2 rad/s");
        max_w_ = 0.2;
        max_w_label_->setFixedWidth(60);
        angle_speed_layout->addWidget(max_w_label_);
        // button
        QHBoxLayout *button_layout = new QHBoxLayout;
        active_box_ = new QCheckBox("激活键盘控制");
        active_box_->setCheckState(Qt::Unchecked);
        send_flag_ = false;
        button_layout->addWidget(active_box_, 1, Qt::AlignCenter);
        // layout
        panel_layout->addLayout(topic_layout);
        panel_layout->addLayout(linear_speed_layout);
        panel_layout->addLayout(angle_speed_layout);
        panel_layout->addLayout(button_layout);
        setLayout(panel_layout);
        // timer
        QTimer *output_timer = new QTimer(this);

        velocity_publisher_ = nh_.advertise<geometry_msgs::Twist>(output_topic_.toStdString(), 1);

        connect(max_v_slider_, SIGNAL(valueChanged(int)), this, SLOT(setMaxVLabel(int)));
        connect(max_w_slider_, SIGNAL(valueChanged(int)), this, SLOT(setMaxWLabel(int)));
        connect(active_box_, SIGNAL(stateChanged(int)), this, SLOT(setFlag(int)));
        connect(topic_edit_, SIGNAL(editingFinished()), this, SLOT(updateTopic()));
        connect(output_timer, SIGNAL(timeout()), this, SLOT(sendVel()));

        output_timer->start(100);
    }

    void KeyboardTwistPanel::load(const rviz::Config &config) {
        Panel::load(config);
        QString topic;
        if (config.mapGetString("Topic", &topic)) {
            topic_edit_->setText(topic);
            updateTopic();
        }
    }

    void KeyboardTwistPanel::save(rviz::Config config) const {
        Panel::save(config);
        config.mapSetValue("Topic", output_topic_);
    }

    void KeyboardTwistPanel::keyPressEvent(QKeyEvent *event) {
        // std::cout << event->timestamp() << "press : " << event->key() << std::endl;
        last_pressed_time_ = ros::Time::now();
        if (!event->isAutoRepeat()) {
            key_pressed_flag_[event->key()] = 1;
            switch (event->key()) {
                case Qt::Key::Key_Up:
                case Qt::Key::Key_W:
                    button_up_ = true;
                    break;
                case Qt::Key::Key_Down:
                case Qt::Key::Key_S:
                    button_down_ = true;
                    break;
                case Qt::Key::Key_Left:
                case Qt::Key::Key_A:
                    button_left_ = true;
                    break;
                case Qt::Key::Key_Right:
                case Qt::Key::Key_D:
                    button_right_ = true;
                    break;
                case Qt::Key::Key_Q:
                    button_left_ = true;
                    button_up_ = true;
                    break;
                case Qt::Key::Key_E:
                    button_right_ = true;
                    button_up_ = true;
                    break;
                case Qt::Key::Key_Z:
                    button_left_ = true;
                    button_down_ = true;
                    break;
                case Qt::Key::Key_C:
                    button_right_ = true;
                    button_down_ = true;
                    break;
                case Qt::Key::Key_0:
                    active_box_->setCheckState(Qt::Unchecked);
                    break;
                default:
                    break;
            }
        }
    }

    bool KeyboardTwistPanel::checkUp() {
        return key_pressed_flag_[Qt::Key::Key_Up] + key_pressed_flag_[Qt::Key::Key_W] +
               key_pressed_flag_[Qt::Key::Key_Q] + key_pressed_flag_[Qt::Key::Key_E] != 0;
    }

    bool KeyboardTwistPanel::checkDown() {
        return key_pressed_flag_[Qt::Key::Key_Down] + key_pressed_flag_[Qt::Key::Key_X] +
               key_pressed_flag_[Qt::Key::Key_Z] + key_pressed_flag_[Qt::Key::Key_C] != 0;
    }

    bool KeyboardTwistPanel::checkLeft() {
        return key_pressed_flag_[Qt::Key::Key_Left] + key_pressed_flag_[Qt::Key::Key_A] +
               key_pressed_flag_[Qt::Key::Key_Q] + key_pressed_flag_[Qt::Key::Key_Z] != 0;
    }

    bool KeyboardTwistPanel::checkRight() {
        return key_pressed_flag_[Qt::Key::Key_Right] + key_pressed_flag_[Qt::Key::Key_D] +
               key_pressed_flag_[Qt::Key::Key_E] + key_pressed_flag_[Qt::Key::Key_C] != 0;
    }

    void KeyboardTwistPanel::keyReleaseEvent(QKeyEvent *event) {
        // std::cout << event->timestamp() << "release : " << event->key() << std::endl;
        if (!event->isAutoRepeat()) {
            key_pressed_flag_[event->key()] = 0;
            switch (event->key()) {
                case Qt::Key::Key_Up:
                case Qt::Key::Key_W:
                    if (!checkUp()) {
                        button_up_ = false;
                    }
                    break;
                case Qt::Key::Key_Down:
                case Qt::Key::Key_S:
                    if (!checkDown()) {
                        button_down_ = false;
                    }
                    break;
                case Qt::Key::Key_Left:
                case Qt::Key::Key_A:
                    if (!checkLeft()) {
                        button_left_ = false;
                    }
                    break;
                case Qt::Key::Key_Right:
                case Qt::Key::Key_D:
                    if (!checkRight()) {
                        button_right_ = false;
                    }
                    break;
                case Qt::Key::Key_Q:
                    if (!checkUp()) {
                        button_up_ = false;
                    }
                    if (!checkLeft()) {
                        button_left_ = false;
                    }
                    break;
                case Qt::Key::Key_E:
                    if (!checkRight()) {
                        button_right_ = false;
                    }
                    if (!checkUp()) {
                        button_up_ = false;
                    }
                    break;
                case Qt::Key::Key_Z:
                    if (!checkLeft()) {
                        button_left_ = false;
                    }
                    if (!checkDown()) {
                        button_down_ = false;
                    }
                    break;
                case Qt::Key::Key_C:
                    if (!checkRight()) {
                        button_right_ = false;
                    }
                    if (!checkDown()) {
                        button_down_ = false;
                    }
                    break;
                default:
                    break;
            }
        }
    }

    void KeyboardTwistPanel::setMaxVLabel(int data) {
        max_v_ = data / 10.0;
        max_v_label_->setText(QString::fromStdString(format_string("%-2.1f m/s", max_v_)));
    }

    void KeyboardTwistPanel::setMaxWLabel(int data) {
        max_w_ = data / 10.0;
        max_w_label_->setText(QString::fromStdString(format_string("%-2.1f rad/s", max_w_)));
    }

    void KeyboardTwistPanel::setFlag(int data) {
        send_flag_ = (data == Qt::Checked);
        if (send_flag_) {
            grabKeyboard();
        } else {
            releaseKeyboard();
        }
    }

    void KeyboardTwistPanel::sendVel() {
        if (ros::ok() && velocity_publisher_) { // 话题存在并且ros启动
            if ((button_up_ || button_down_ || button_left_ || button_right_) &&
                ros::Time::now() - last_pressed_time_ <= ros::Duration(1.0) && send_flag_) {
                double v = 0.0, w = 0.0;
                if (button_up_ != button_down_ && button_up_) {
                    v = max_v_;
                } else if (button_up_ != button_down_ && button_down_) {
                    v = -max_v_;
                }

                if (button_left_ != button_right_ && button_left_) {
                    w = max_w_;
                } else if (button_left_ != button_right_ && button_right_) {
                    w = -max_w_;
                }

                geometry_msgs::Twist msg;
                msg.linear.x = v;
                msg.linear.y = 0;
                msg.linear.z = 0;
                msg.angular.x = 0;
                msg.angular.y = 0;
                msg.angular.z = w;
                velocity_publisher_.publish(msg);

                if (v != 0.0 || w != 0.0) {
                    stop_flag_ = false;
                }
            } else {
                if (!stop_flag_) {
                    geometry_msgs::Twist msg;
                    velocity_publisher_.publish(msg);
                    stop_flag_ = true;
                }
            }
        }
    }

    void KeyboardTwistPanel::updateTopic() {
        QString new_topic = topic_edit_->text();
        if (new_topic != output_topic_) {
            output_topic_ = new_topic;
            if (output_topic_ == "") {
                velocity_publisher_.shutdown();
            } else {
                velocity_publisher_ = nh_.advertise<geometry_msgs::Twist>(output_topic_.toStdString(), 1);
            }
            Q_EMIT configChanged();
        }
    }
}

#include <pluginlib/class_list_macros.h>

PLUGINLIB_EXPORT_CLASS(autolabor_plugin::KeyboardTwistPanel, rviz::Panel)