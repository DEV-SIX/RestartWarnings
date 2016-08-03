/*
RESTART WARNINGS BY [EXP] Metalman10
Throws a toast saying server restart is coming and you should log out. Simple stuff
*/
private ["_ServerRestartTimeInMinutes","_time","_timeToRestart","_warnedOne","_WarningTwo","_WarningThree","_warnedOne","_warnedTwo","_warnedThree"];
 
/*
    Restart time in minutes for your server.
*/
 
Server_restart_warnings =
{
    _ServerRestartTimeInMinutes = 240;          // 240 = 4 Hour restarts 180 = 3 Hour restarts
 
    _time = serverTime / 60;
 
    _timeToRestart = ServerRestartTimeInMinutes - _time;
 
    _WarningOne = 15;               // First warning in minutes
    _WarningTwo = 10;        // Second..
    _WarningThree = 5;      // Third..
 
    _warnedOne = false;
    _warnedTwo = false;
    _warnedThree = false;
 
    if ((_timeToRestart <= _WarningOne) && !(_warnedOne)) then
    {
        _warnedOne = true; 
        /*
        [
            "InfoTitleAndText",
            ["Restart Warning", format ["The server will restart in %1 minutes",_WarningOne]]
        ] call ExileClient_gui_toaster_addTemplateToast;
        */
        ["toastRequest",
        ["ErrorTitleAndText",
        ["Restart Warning", format ["The server will restart in %1 minutes",_WarningOne]]]]
        call ExileServer_system_network_send_broadcast;
 
    }; 
 
    if ((_timeToRestart <= _WarningTwo) && !(_warnedTwo)) then
    {
        _warnedTwo = true; 
        /*
        [
            "InfoTitleAndText",
            ["Restart Warning", format ["The server will restart in %1 minutes",_WarningTwo]]
        ] call ExileClient_gui_toaster_addTemplateToast;
        */
        ["toastRequest",
        ["ErrorTitleAndText",
        ["Restart Warning", format ["The server will restart in %1 minutes",_WarningTwo]]]]
        call ExileServer_system_network_send_broadcast;
 
    }; 
 
    if ((_timeToRestart <= _WarningThree) && !(_warnedThree)) then
    {
        _warnedThree = true;
        /* 
        [
            "InfoTitleAndText",
            ["Restart Warning", format ["The server will restart in %1 minutes",_WarningThree]]
        ] call ExileClient_gui_toaster_addTemplateToast;
        */
        ["toastRequest",
        ["ErrorTitleAndText",
        ["Restart Warning", format ["The server will restart in %1 minutes",_WarningThree]]]]
        call ExileServer_system_network_send_broadcast;
    }; 
};
 
[30, Server_restart_warnings, [], true] call ExileServer_system_thread_addtask;
