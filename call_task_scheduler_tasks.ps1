# ===============================================================================================================
# Function: Provide list of Task scheduler tasks to execute via pwsh CLI - CB 2021-06-04
# Sources: https://docs.microsoft.com/en-us/powershell/module/scheduledtasks/get-scheduledtask?view=windowsserver2019-ps
# ===============================================================================================================

# Get-ScheduledTask

 # task_name = "call_check_pwsh_version"
# $task_name = "call_stop_processes_pwsh"
# $task_name = "call_startup_pwsh"


# Start array of tasks

# $ScheduledTaskArray = @('call_monitor_top_procs_memory', 'call_monitor_top_procs_cpu')
# $ScheduledTaskArray = @('call_systeminfo_exe', 'call_check_pwsh_version')
# $ScheduledTaskArray = @('call_stop_processes_pwsh')
  $ScheduledTaskArray = @('call_update_pwsh')
  # $ScheduledTaskArray = @('check_sql04_all' ,'check_util_all')
# $ScheduledTaskArray = @('call_stopwatch_pwsh')
# $ScheduledTaskArray = @('call_check_local_dir')
# $ScheduledTaskArray = @('check_atrnc_dir')
 # $ScheduledTaskArray = @('call_stop_processes_pwsh')
        foreach($i in $ScheduledTaskArray) {
            Get-ScheduledTask $i
            Start-ScheduledTask -TaskName $i
            Get-ScheduledTask $i
        }