#
loadrt stepgen step_type=0,0,0
addf stepgen.make-pulses base-thread
addf stepgen.update-freq servo-thread
addf stepgen.capture-position servo-thread

setp stepgen.0.position-scale $::STEPGEN_0(SCALE)
setp stepgen.0.steplen 1
setp stepgen.0.stepspace 0
setp stepgen.0.dirhold 1
setp stepgen.0.dirsetup 1
setp stepgen.0.maxaccel $::STEPGEN_0(STEPGEN_MAXACCEL)

net lcnc.x_amp-enable  => stepgen.0.enable
net lcnc.x_pos-cmd => stepgen.0.position-cmd
net stepgen.x_pos-fb  <= stepgen.0.position-fb
net stepgen.xstep    <= stepgen.0.step
net stepgen.xdir     <= stepgen.0.dir

setp stepgen.1.position-scale $::STEPGEN_1(SCALE)
setp stepgen.1.steplen 1
setp stepgen.1.stepspace 0
setp stepgen.1.dirhold 1
setp stepgen.1.dirsetup 1
setp stepgen.1.maxaccel $::STEPGEN_1(STEPGEN_MAXACCEL)

net lcnc.y_amp-enable  => stepgen.1.enable
net lcnc.y_pos-cmd => stepgen.1.position-cmd
net stepgen.y_pos-fb  => stepgen.1.position-fb
net stepgen.ydir     <= stepgen.1.dir
net stepgen.ystep    <= stepgen.1.step

setp stepgen.2.position-scale $::STEPGEN_2(SCALE)
setp stepgen.2.steplen 1
setp stepgen.2.stepspace 0
setp stepgen.2.dirhold 1
setp stepgen.2.dirsetup 1
setp stepgen.2.maxaccel $::STEPGEN_2(STEPGEN_MAXACCEL)

net lcnc.z_amp-enable  => stepgen.2.enable
net lcnc.z_pos-cmd => stepgen.2.position-cmd
net stepgen.z_pos-fb  <= stepgen.2.position-fb
net stepgen.zdir     <= stepgen.2.dir
net stepgen.zstep    <= stepgen.2.step

#loadrt sim_parport names=parport.0
#setp parport.0.reset-time 8000
#addf parport.0.read base-thread
#addf parport.0.write base-thread
#addf parport.0.reset base-thread

#net stepgen.xstep           => parport.0.pin-01-out
#setp parport.0.pin-01-out-reset 1
#net stepgen.zstep           => parport.0.pin-02-out
#setp parport.0.pin-02-out-reset 1
#net stepgen.zdir            => parport.0.pin-03-out
#net stepgen.xdir            => parport.0.pin-14-out
