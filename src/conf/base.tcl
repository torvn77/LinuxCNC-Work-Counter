#
loadrt trivkins
loadrt $::EMCMOT(EMCMOT) base_period_nsec=$::EMCMOT(BASE_PERIOD) traj_period_nsec=$::EMCMOT(TRAJ_PERIOD) servo_period_nsec=$::EMCMOT(SERVO_PERIOD) num_joints=$::TRAJ(AXES) num_dio=$::EMCMOT(NUM_DIO) num_aio=$::EMCMOT(NUM_AIO)
addf motion-command-handler servo-thread
addf motion-controller servo-thread

net lcnc.x_amp-enable   <= axis.0.amp-enable-out
net lcnc.x_pos-cmd      <= axis.0.motor-pos-cmd
net stepgen.x_pos-fb    => axis.0.motor-pos-fb
net lcnc.x_joint-pos-fb <= axis.0.joint-pos-fb

net lcnc.y_amp-enable   <= axis.1.amp-enable-out
net lcnc.y_pos-cmd      <= axis.1.motor-pos-cmd
net stepgen.y_pos-fb    => axis.1.motor-pos-fb
net lcnc.y_joint-pos-fb <= axis.1.joint-pos-fb

net lcnc.z_amp-enable   <= axis.2.amp-enable-out
net lcnc.z_pos-cmd      <= axis.2.motor-pos-cmd
net stepgen.z_pos-fb    => axis.2.motor-pos-fb
net lcnc.z_joint-pos-fb <= axis.2.joint-pos-fb

net hw.x_sw_home_lim-min => axis.0.home-sw-in axis.0.neg-lim-sw-in
net hw.y_sw_home_lim-min => axis.1.home-sw-in axis.1.neg-lim-sw-in
net hw.z_sw_home_lim-max => axis.2.home-sw-in axis.2.pos-lim-sw-in

net lcnc.estop_out             <= iocontrol.0.user-enable-out
net lcnc.estop_out             => iocontrol.0.emc-enable-in
net lcnc.tool_change           <= iocontrol.0.tool-change
net lcnc.tool_changed          => iocontrol.0.tool-changed
net lcnc.tool_prepare-loopback <= iocontrol.0.tool-prepare
net lcnc.tool_prepare-loopback => iocontrol.0.tool-prepared
net lcnc.tool_number           <= iocontrol.0.tool-prep-number

net lcnc.spindle_cmd-rpm     <= motion.spindle-speed-out
#net lcnc.spindle_cmd-rpm-abs <= motion.spindle-speed-out-abs
#net lcnc.spindle_cmd-rps     <= motion.spindle-speed-out-rps
#net lcnc.spindle_cmd-rps-abs <= motion.spindle-speed-out-rps-abs

net hw.probe-in            => motion.probe-input

net lcnc.spindle_at-speed    => motion.spindle-at-speed
sets lcnc.spindle_at-speed true
