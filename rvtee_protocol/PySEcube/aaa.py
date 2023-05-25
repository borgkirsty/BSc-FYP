import ctypes

dll_path = "C:\\Users\\borgk\\FYP\\rvtee_protocol\\SEcubeWrapper\\lib\\SEcubeWrapper.dll"
dll = ctypes.CDLL(dll_path, winmode=0x00000008)