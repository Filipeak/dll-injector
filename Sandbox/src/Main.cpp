#include <iostream>

#include "MMInjection.h"

int main()
{
	std::string procName;
	std::string dllPath;

	std::cout << "Enter process name:" << std::endl;
	std::cin >> procName;

	std::cout << "Enter full DLL path:" << std::endl;
	std::cin >> dllPath;

	DWORD procId = GetProcId(procName.c_str());

	if (!procId)
	{
		std::cout << procName << " isn't running!" << std::endl;

		system("PAUSE");

		return 0;
	}

	HANDLE hProc = OpenProcess(PROCESS_ALL_ACCESS, FALSE, procId);

	if (!hProc)
	{
		DWORD err = GetLastError();

		std::cout << "OpenProcess failed:\n" << err << std::endl;

		system("PAUSE");

		return 0;
	}

	if (!ManualMap(hProc, dllPath.c_str()))
	{
		CloseHandle(hProc);

		std::cout << "Something went wrong" << std::endl;

		system("PAUSE");

		return 0;
	}

	CloseHandle(hProc);
}