local function history(extra, suc, result)
  for i=1, #result do
    delete_msg(result[i].id, ok_cb, false)
if tonumber(i) > 99 then
    delete_msg(result[i].id, ok_cb, false)
else
if tonumber(i) > 99 then
    delete_msg(result[i].id, ok_cb, false)
else
if tonumber(i) > 99 then
    delete_msg(result[i].id, ok_cb, false)
else
if tonumber(i) > 99 then
    delete_msg(result[i].id, ok_cb, false)
else
if tonumber(i) > 99 then
    delete_msg(result[i].id, ok_cb, false)
else
if tonumber(i) > 99 then
    delete_msg(result[i].id, ok_cb, false)
else
if tonumber(i) > 99 then
    delete_msg(result[i].id, ok_cb, false)
  end
end
end
end
end
end
end
end
  if tonumber(extra.con) == #result then
    send_msg(extra.chatid, '"'..#result..'"done!', ok_cb, false)
  else
    send_msg(extra.chatid, 'done!', ok_cb, false)
  end
end
local function run(msg, matches)
  if matches[1] == 'del all'  then
    if msg.to.type == 'channel' then
      get_history(msg.to.peer_id, 500 + 1 , history , {chatid = msg.to.peer_id, con = 500})
    else
      return "OnLy SuPer GrOups"
    end
  else
    return "@DiMoN_TM"
  end
end

return {
    patterns = {
        '^[!/#](del all)$'
    },
    run = run
}

-- DiMoN_TM
-- TNX pika team
 
