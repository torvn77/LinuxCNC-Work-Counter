#
loadusr -W hal_manualtoolchange
net lcnc.tool_change => hal_manualtoolchange.change
net lcnc.tool_changed <= hal_manualtoolchange.changed
net lcnc.tool_number => hal_manualtoolchange.number
