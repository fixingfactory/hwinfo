# hwinfo
Get Laptop Hardware Information

## Windows

Open a Windows Command Prompt
* Run the following command:
	* <pre><code id="curl">curl -O https://raw.githubusercontent.com/fixingfactory/hwinfo/main/hwinfowin.bat</code></pre>
		* If curl is not available, go to https://raw.githubusercontent.com/fixingfactory/hwinfo/main/hwinfowin.bat
		* Copy the contents of https://raw.githubusercontent.com/fixingfactory/hwinfo/main/hwinfowin.bat
		* Open Notepad and paste the contents into the empty file
		* Save the file as `hwinfowin.bat` in the same directory that Command Prompt has opened
* Run the `hwinfowin.bat` file

It will ouput something similar the screenshot below:

![hwinfowin](https://github.com/fixingfactory/hwinfo/assets/1253988/ac112301-21c2-441a-9d9e-4ac40b5ab355)

![hwinfowin](https://github.com/fixingfactory/hwinfo/assets/1253988/cc173f6a-fd53-480c-8b54-669c661f3b24)



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
