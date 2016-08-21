do
local function run(msg, matches, callback, extra)
local data = load_data(_config.moderation.data)
local rules = data[tostring(msg.to.id)]['rules']
local about = data[tostring(msg.to.id)]['description']
local hash = 'group:'..msg.to.id
local group_bye = redis:hget(hash,'bye')
if matches[1] == 'delbye' and not matches[2] and is_owner(msg) then 
    
   redis:hdel(hash,'bye')
        return 'متن خدافظی پاک شد 🗑'
end

local url , res = http.request('http://api.gpmod.ir/time/')
if res ~= 200 then return "No connection" end
local jdat = json:decode(url)

if matches[1] == 'setbye' and is_owner(msg) then
redis:hset(hash,'bye',matches[2])
        return 'متن خدافظی گروه به این تنظیم شد : ✋\n'..matches[2]
end

if matches[1] == 'chat_add_user' or 'chat_add_user_link' or 'channel_invite' and msg.service then
group_bye = string.gsub(group_bye, '{gpname}', msg.to.title)
group_bye = string.gsub(group_bye, '{firstname}', ""..(msg.action.user.first_name or '').."")
 group_bye = string.gsub(group_bye, '{lastname}', ""..(msg.action.user.last_name or '').."")
  group_bye = string.gsub(group_bye, '{username}', "@"..(msg.action.user.username or '').."")
  group_bye = string.gsub(group_bye, '{fatime}', ""..(jdat.FAtime).."")
  group_bye = string.gsub(group_bye, '{entime}', ""..(jdat.ENtime).."")
  group_bye = string.gsub(group_bye, '{fadate}', ""..(jdat.FAdate).."")
  group_bye = string.gsub(group_bye, '{endate}', ""..(jdat.ENdate).."")
  group_bye = string.gsub(group_bye, '{rules}', ""..(rules or '').."")
  group_bye = string.gsub(group_bye, '{about}', ""..(about or '').."")
  group_bye = string.gsub(group_bye, '{id}', ""..msg.to.id.."")
  group_bye = string.gsub(group_bye, '{gpid}', ""..msg.from.id.."")


group_bye = string.gsub(group_bye, '{نام گروه}', msg.to.title)
group_bye = string.gsub(group_bye, '{نام اول}', ""..(msg.action.user.first_name or '').."")
 group_bye = string.gsub(group_bye, '{نام آخر}', ""..(msg.action.user.last_name or '').."")
  group_bye = string.gsub(group_bye, '{نام کاربری}', "@"..(msg.action.user.username or '').."")
  group_bye = string.gsub(group_bye, '{ساعت فارسی}', ""..(jdat.FAtime).."")
  group_bye = string.gsub(group_bye, '{ساعت انگلیسی}', ""..(jdat.ENtime).."")
  group_bye = string.gsub(group_bye, '{تاریخ فارسی}', ""..(jdat.FAdate).."")
  group_bye = string.gsub(group_bye, '{تاریخ انگلیسی}', ""..(jdat.ENdate).."")

 end
return group_bye
end
return {
  patterns = {
  "^[!#/](setbye) +(.*)$",
  "^[!#/](delbye)$",
  "^!!tgservice (chat_add_user)$",
  "^!!tgservice (channel_invite)$",
  "^!!tgservice (chat_add_user_link)$",
  },
  run = run
}
end

-- DiMoN_TM
