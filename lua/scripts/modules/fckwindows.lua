local ffi = require("ffi")

ffi.cdef [[
typedef void* HANDLE;
typedef unsigned long DWORD;
typedef int BOOL;
typedef const char* LPCSTR;
typedef char* LPSTR;
typedef void* LPVOID;

typedef unsigned char BYTE;
typedef BYTE* LPBYTE;

typedef struct _STARTUPINFOA {
  DWORD cb;
  LPSTR lpReserved;
  LPSTR lpDesktop;
  LPSTR lpTitle;
  DWORD dwX;
  DWORD dwY;
  DWORD dwXSize;
  DWORD dwYSize;
  DWORD dwXCountChars;
  DWORD dwYCountChars;
  DWORD dwFillAttribute;
  DWORD dwFlags;
  short wShowWindow;
  short cbReserved2;
  LPBYTE lpReserved2;
  HANDLE hStdInput;
  HANDLE hStdOutput;
  HANDLE hStdError;
} STARTUPINFOA, *LPSTARTUPINFOA;

typedef struct _PROCESS_INFORMATION {
  HANDLE hProcess;
  HANDLE hThread;
  DWORD dwProcessId;
  DWORD dwThreadId;
} PROCESS_INFORMATION, *LPPROCESS_INFORMATION;

BOOL CreateProcessA(
  LPCSTR lpApplicationName,
  LPSTR lpCommandLine,
  LPVOID lpProcessAttributes,
  LPVOID lpThreadAttributes,
  BOOL bInheritHandles,
  DWORD dwCreationFlags,
  LPVOID lpEnvironment,
  LPCSTR lpCurrentDirectory,
  LPSTARTUPINFOA lpStartupInfo,
  LPPROCESS_INFORMATION lpProcessInformation
);

BOOL CloseHandle(HANDLE hObject);
BOOL GetExitCodeProcess(HANDLE hProcess, DWORD* lpExitCode);
DWORD WaitForSingleObject(HANDLE hHandle, DWORD dwMilliseconds);
]]

local windows = {}

function windows.createProcess(command)
    local si = ffi.new("STARTUPINFOA")
    si.cb = ffi.sizeof(si)

    local pi = ffi.new("PROCESS_INFORMATION")
    local commandLine = ffi.new("char[?]", #command + 1, command)

    local success = ffi.C.CreateProcessA(nil, -- lpApplicationName
    commandLine, -- lpCommandLine
    nil, -- lpProcessAttributes
    nil, -- lpThreadAttributes
    false, -- bInheritHandles
    0, -- dwCreationFlags
    nil, -- lpEnvironment
    nil, -- lpCurrentDirectory
    si, -- lpStartupInfo
    pi -- lpProcessInformation
    )

    if success == 0 then
        error("CreateProcess failed")
    else
        -- Return the process ID
        --return tonumber(pi.dwProcessId)

        -- Wait until the process exits
        local waitResult = ffi.C.WaitForSingleObject(pi.hProcess, 0xFFFFFFFF) -- INFINITE
        if waitResult ~= 0 then
            error("WaitForSingleObject failed")
        end

        -- Return command exit code
        local exitCode = ffi.new("DWORD[1]")
        if ffi.C.GetExitCodeProcess(pi.hProcess, exitCode) == 0 then
            error("GetExitCodeProcess failed")
        end
        ffi.C.CloseHandle(pi.hProcess)
        ffi.C.CloseHandle(pi.hThread)
        --return tonumber(exitCode[0])
        return tonumber(exitCode[0]) == 0 -- Return true if exit code is 0 (success)
    end
end

return windows
