-- https://v3rmillion.net/showthread.php?tid=1087122
-- Reasons for having so much 'if' is to avoid mistakes
local ui=game:GetService("CoreGui"):FindFirstChild'Discord';if ui then ui:Destroy();end;
local plr=game:GetService'Players'.LocalPlayer
local result
do--Main
    DiscordLib=loadstring(game:HttpGet"https://raw.githubusercontent.com/YoutubeGam/YTV3rmillion/main/scripts/firesignal%20GUI.lua")()
    local win=DiscordLib:Window("YTDevs - discord.gg/Cvxa4FZVUC")
    local serv=win:Server("YTHub", "http://www.roblox.com/asset/?id=247421733")
    Page_2=serv:Channel("Main")
    Page_1=serv:Channel("Settings")
end;

do--function
    function functionfire(what,obj)
        if obj==nil then
            idiot('Invalid instance');
            return
        end;
        if obj.ClassName~='TextButton'and obj.ClassName~='ImageButton' then
            idiot('TextButton and ImageButton only');
            return;
        end;
        if what=='GetConnections' then
            if getconnections==nil then return idiot('Eh... your exploit doesn\'t have this function');end;
            for i,_ in next,{'MouseButton1Click','MouseButton1Up','MouseButton1Down','Activated'}do
                for i,_ in next,getconnections(obj[_])do
                    _:Fire()
                end
            end
        elseif what=='FireSignal' then
            if firesignal==nil then return idiot('Eh... your exploit doesn\'t have this function');end;
            for i,_ in next,{'MouseButton1Click','MouseButton1Up','MouseButton1Down','Activated'}do
                firesignal(obj[_])
            end
        end;
    end
    function idiot(txt)
        DiscordLib:Notification("Notification", txt, "Okay!")
    end;
    function ConvertInstance(txt,result,v)
        if result~=nil then
            for i,_ in pairs(txt:split("."))do
                result=result[_]
            end
            if typeof(result)=='Instance' and v then
                return result
            end;
            idiot('Ok was successfully set')
        else
            idiot('Select service')
        end
    end;
end;

do --Script
    Page_1:Textbox("Object", "Insert the instance here", false,function(_)
        idkname3=_
        ConvertInstance(_,idkname)
    end)
    Page_1:Dropdown('Service:',{'PlayerGui','CoreGui'},function(_)
        if _=='PlayerGui' then
            idkname=plr:FindFirstChild(_)
        elseif _=='CoreGui'then
            idkname=game:GetService(_)
        end;
    end);
    Page_1:Button("Test the instance", function()
        if idkname3==nil then return idiot('Object empty')end
        local s=pcall(function()ConvertInstance(idkname3,idkname,true);end)
        if s then
            idiot('It\'s working')
        else
            idiot('It is not working')
        end
    end)

    Page_2:Dropdown('Function:',{'FireSignal','GetConnections'},function(_)
        idkname2=_
    end);
    Page_2:Button("Enable", function()
        local s,result=pcall(function()return ConvertInstance(idkname3,idkname,true);end)
        if s~=true then return idiot('Test the instance')end;
        if idkname2~=nil then
            functionfire(idkname2,result)
        else
            return idiot('Select a function')
        end
    end)
end;