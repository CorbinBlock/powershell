# ===============================================================================================================
# Function: Provide list of Task scheduler tasks to execute via pwsh CLI - CB 2021-06-04
# Sources: https://docs.microsoft.com/en-us/powershell/module/scheduledtasks/get-scheduledtask?view=windowsserver2019-ps
#$q+2(SmetE*6qaXX
# ===============================================================================================================

# ETL

# $TaskName = "workout_log_etl"
# $TaskName = "stretch_log_etl"
# $TaskName = "call_psql_client"

# Monitoring

# $TaskName = "monitor_top_procs" # Working Set Memory
# $TaskName = "monitor_top_procs_cpu"
# $TaskName = "call_systeminfo_exe"
# $TaskName = "check_pwsh_version_table"

# Updates 

# $TaskName = "call_update_pwsh"
# $TaskName = "update_upgrade_ubuntu"
# $TaskName = "update_windows"


# Start / Stop Processes

# $TaskName = "close_process"
# $TaskName = "open_processes"
# $TaskName = "call_startup_pwsh"
# $TaskName = "power_on_RHEL8_VM1"

# Start array of tasks

# $ScheduledTaskArray = @('workout_log_etl', 'stretch_log_etl', 'call_psql_client') 
# $ScheduledTaskArray = @('update_windows', 'call_update_pwsh')
$ScheduledTaskArray = @('call_systeminfo_exe', 'check_pwsh_version_table','monitor_top_procs_cpu', 'monitor_top_procs') 
        foreach($i in $ScheduledTaskArray) {
            Get-ScheduledTask $i 
            Start-ScheduledTask -TaskName $i
            Get-ScheduledTask $i 
        }


