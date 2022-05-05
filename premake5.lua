workspace "DLL Injector"
	startproject "Sandbox"

	configurations
	{
		"Debug_32",
		"Release_32",
		"Debug_64",
		"Release_64"
	}

	filter "configurations:*32"
		architecture "x86"

	filter "configurations:*64"
		architecture "x86_64"