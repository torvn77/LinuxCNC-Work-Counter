#
loadrt sim_axis_hardware names=sim-limits
addf sim-limits.update servo-thread

net lcnc.x_joint-pos-fb => sim-limits.Xcurrent-pos
net lcnc.y_joint-pos-fb => sim-limits.Ycurrent-pos
net lcnc.z_joint-pos-fb => sim-limits.Zcurrent-pos sim-limits.Vcurrent-pos
#net lcnc.a_joint-pos-fb => sim-limits.Acurrent-pos

setp sim-limits.Xmaxsw-upper 701.5
setp sim-limits.Xmaxsw-lower $::AXIS_0(MAX_LIMIT)
setp sim-limits.Xminsw-upper $::AXIS_0(MIN_LIMIT)
setp sim-limits.Xminsw-lower -1.5
setp sim-limits.Xhomesw-pos $::AXIS_0(HOME_OFFSET)

setp sim-limits.Ymaxsw-upper 801.5
setp sim-limits.Ymaxsw-lower $::AXIS_1(MAX_LIMIT)
setp sim-limits.Yminsw-upper $::AXIS_1(MIN_LIMIT)
setp sim-limits.Yminsw-lower -1.5
setp sim-limits.Yhomesw-pos $::AXIS_1(HOME_OFFSET)

setp sim-limits.Zmaxsw-upper 1.5
setp sim-limits.Zmaxsw-lower $::AXIS_2(MAX_LIMIT)
setp sim-limits.Zminsw-upper $::AXIS_2(MIN_LIMIT)
setp sim-limits.Zminsw-lower -121.5
setp sim-limits.Zhomesw-pos $::AXIS_2(HOME_OFFSET)

#setp sim-limits.Amaxsw-upper 10000
#setp sim-limits.Amaxsw-lower $::AXIS_3(MAX_LIMIT)
#setp sim-limits.Aminsw-upper $::AXIS_3(MIN_LIMIT)
#setp sim-limits.Aminsw-lower -10000
#setp sim-limits.Ahomesw-pos $::AXIS_3(HOME_OFFSET)

#setp sim-limits.Umaxsw-upper 10000
#setp sim-limits.Umaxsw-lower $::AXIS_4(MAX_LIMIT)
#setp sim-limits.Uminsw-upper $::AXIS_4(MIN_LIMIT)
#setp sim-limits.Uminsw-lower -10000
#setp sim-limits.Uhomesw-pos $::AXIS_4(HOME_OFFSET)

#setp sim-limits.Vmaxsw-upper 10000
#setp sim-limits.Vmaxsw-lower $::AXIS_5(MAX_LIMIT)
#setp sim-limits.Vminsw-upper $::AXIS_5(MIN_LIMIT)
#setp sim-limits.Vminsw-lower -10000
#setp sim-limits.Vhomesw-pos $::AXIS_5(HOME_OFFSET)

############## Probe #######################
setp sim-limits.Vmaxsw-upper 100001
setp sim-limits.Vmaxsw-lower 100000
setp sim-limits.Vminsw-upper -100.0
setp sim-limits.Vminsw-lower -100.1
setp sim-limits.Vhomesw-pos -100000
net hw.probe-in sim-limits.Vminsw-out

############################################

#net hw.all_sw_home          sim-limits.homesw-all
#net hw.all_sw_limit         sim-limits.limitsw-all
#net hw.all_sw_home_limit    sim-limits.limitsw-homesw-all

#net hw.x_sw_lim-max             sim-limits.Xmaxsw-out
#net hw.x_sw_lim-min             sim-limits.Xminsw-out
#net hw.x_sw_lim-both            sim-limits.Xbothsw-out
#net hw.x_sw_home            sim-limits.Xhomesw-out
#net hw.x_sw_home_lim-max        sim-limits.Xmaxsw-homesw-out
net hw.x_sw_home_lim-min        sim-limits.Xminsw-homesw-out
#net hw.x_sw_home_lim-both       sim-limits.Xbothsw-homesw-out

#net hw.y_sw_lim-max             sim-limits.Ymaxsw-out
#net hw.y_sw_lim-min             sim-limits.Yminsw-out
#net hw.y_sw_lim-both            sim-limits.Ybothsw-out
#net hw.y_sw_home            sim-limits.Yhomesw-out
#net hw.y_sw_home_lim-max        sim-limits.Ymaxsw-homesw-out
net hw.y_sw_home_lim-min        sim-limits.Yminsw-homesw-out
#net hw.y_sw_home_lim-both       sim-limits.Ybothsw-homesw-out

#net hw.z_sw_lim-max             sim-limits.Zmaxsw-out
#net hw.z_sw_lim-min             sim-limits.Zminsw-out
#net hw.z_sw_lim-both            sim-limits.Zbothsw-out
#net hw.z_sw_home            sim-limits.Zhomesw-out
net hw.z_sw_home_lim-max        sim-limits.Zmaxsw-homesw-out
#net hw.z_sw_home_lim-min        sim-limits.Zminsw-homesw-out
#net hw.z_sw_home_lim-both       sim-limits.Zbothsw-homesw-out

#net hw.a_sw_lim-max             sim-limits.Amaxsw-out
#net hw.a_sw_lim-min             sim-limits.Aminsw-out
#net hw.a_sw_lim-both            sim-limits.Abothsw-out
#net hw.a_sw_home            sim-limits.Ahomesw-out
#net hw.a_sw_home_lim-max        sim-limits.Amaxsw-homesw-out
#net hw.a_sw_home_lim-min        sim-limits.Aminsw-homesw-out
#net hw.a_sw_home_lim-both       sim-limits.Abothsw-homesw-out

#net hw.u_sw_lim-max             sim-limits.Umaxsw-out
#net hw.u_sw_lim-min             sim-limits.Uminsw-out
#net hw.u_sw_lim-both            sim-limits.Ubothsw-out
#net hw.u_sw_home            sim-limits.Uhomesw-out
#net hw.u_sw_home_lim-max        sim-limits.Umaxsw-homesw-out
#net hw.u_sw_home_lim-min        sim-limits.Uminsw-homesw-out
#net hw.u_sw_home_lim-both       sim-limits.Ubothsw-homesw-out

#net hw.v_sw_lim-max             sim-limits.Vmaxsw-out
#net hw.v_sw_lim-min             sim-limits.Vminsw-out
#net hw.v_sw_lim-both            sim-limits.Vbothsw-out
#net hw.v_sw_home            sim-limits.Vhomesw-out
#net hw.v_sw_home_lim-max        sim-limits.Vmaxsw-homesw-out
#net hw.v_sw_home_lim-min        sim-limits.Vminsw-homesw-out
#net hw.v_sw_home_lim-both       sim-limits.Vbothsw-homesw-out

