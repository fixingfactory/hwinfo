# hwinfo
Get Laptop Hardware Information

## Windows

1. Open a Windows Command Prompt
2. Run the following command:
`curl -O https://raw.githubusercontent.com/fixingfactory/hwinfo/main/hwinfowin.bat`
3. if curl is not available, goto https://raw.githubusercontent.com/fixingfactory/hwinfo/main/hwinfowin.bat
4. Copy the contents of https://raw.githubusercontent.com/fixingfactory/hwinfo/main/hwinfowin.bat
5. Open Notepad and paste the contents into the empty file
6. Save the file as `hwinfowin.bat` in the same directory that Command Prompt has opened
7. Run the `hwinfowin.bat`

It will ouput something similar the screenshot below:
![image](https://github.com/fixingfactory/hwinfo/assets/1253988/8b859d24-823c-4bc1-9c58-6972fdd36911)

```
C:\Users\nis\hwinfowin.bat
+--------------+
| Laptop Model |
+--------------+
Name
Latitude E7270

+---------------+
| Laptop Serial |
+---------------+
Serial number: B3MB1G2

+-------------+
| Laptop BIOS |
+-------------+
SMBIOSBIOSVersion
1.12.3

+-------------------+
| Laptop Approx Age |
+-------------------+

BIOS Release Date: 20161211000000.000000+000
Approximate Laptop Age: 7 years

+------------+
| Laptop RAM |
+------------+
The total visible memory size is: 16657448 MB
The total visible memory size is: 15.89 GB

Memory SIMMs/DIMMs details:
BankLabel  Capacity    MemoryType  Speed  TypeDetail
BANK 0     8589934592  0           2133   128
BANK 2     8589934592  0           2133   128

+------------+
| Laptop HDD |
+------------+
Size (GB): 237.861637115479, Free Space (GB): 196.661602020264, Free (%): 82.6789912005807, DeviceID: C:, DriveType: 3

+------------+
| Laptop CPU |
+------------+
CPU: Intel(R) Core(TM) i7-6600U CPU @ 2.60GHz
```
