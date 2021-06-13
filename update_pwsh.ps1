# ===============================================================================================================
# Function: Update to latest Powershell daily executable - CB 2021-06-04
# Sources:
# ===============================================================================================================

Invoke-Expression "& { $(Invoke-RestMethod 'https://aka.ms/install-pscore' ) } -Daily"