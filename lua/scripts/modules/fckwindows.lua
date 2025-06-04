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

BOOL GetLongPathNameW(const wchar_t* lpszShortPath, wchar_t* lpszLongPath, int cchBuffer);
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
        ffi.C.CloseHandle(pi.hProcess)
        ffi.C.CloseHandle(pi.hThread)
        -- Return the process ID
        return tonumber(pi.dwProcessId)
    end
end

function windows.getLongPathName(shortPath)
    local buffer = ffi.new("wchar_t[?]", #shortPath + 260)
    local result = ffi.C.GetLongPathNameW(shortPath, buffer, 260)
    if result == 0 then
        error("GetLongPathName failed")
    end
    return ffi.string(buffer, result * 2) -- Convert to Lua string (UTF-16 to UTF-8)
end

return windows
