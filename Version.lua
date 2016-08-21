--[[writed by @sina021
DiMoN_TM]]--
do
function run(msg, matches)
	if matches[1]:lower() == 'mid' and msg.reply_id then
	return msg.reply_id
	end
if matches[1] == "setversion" and is_sudo(msg) then
local version = matches[2]
redis:set('bot:version',version)
return ' done!'
end
if matches[1] == 'clean ver' and is_sudo(msg) then
    local hash = ('bot:version')
    redis:del(hash)
return ' done!'
end
	if matches[1]:lower() == 'ver' then
local gethash = redis:get('bot:version')
	fwd_msg(get_receiver(msg), gethash, ok_cb, false)
elseif not gethash then
    return ' not set!'
end
end
return {
	patterns = {
		"^([Vv]er)$",
		   	"^([Ss]etversion) (.*)$",
               "^([Mm]id)$",
                    "^([Cc]lean ver)$",
	},
	run = run 
} 
end
--[[writed by @sina021
DiMoN_TM]]--
---   |  \    |     |  - _
---   |    \  |     |      -
---   |      \|     | _  -

