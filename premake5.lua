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

project "DLL Injector"
	location "DLL Injector"
	kind "StaticLib"
	language "C++"

	characterset("MBCS")

	targetdir ("bin/%{cfg.buildcfg}/%{cfg.system}/%{cfg.architecture}/%{prj.name}")
	objdir ("bin-intermediates/%{cfg.buildcfg}/%{cfg.system}/%{cfg.architecture}/%{prj.name}")

	files {
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	filter "system:windows"
		cppdialect "C++14"
		staticruntime "On"
		systemversion "latest"

	filter "configurations:Debug"
		symbols "On"

	filter "configurations:Release"
		optimize "On"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/%{cfg.buildcfg}/%{cfg.system}/%{cfg.architecture}/%{prj.name}")
	objdir ("bin-intermediates/%{cfg.buildcfg}/%{cfg.system}/%{cfg.architecture}/%{prj.name}")

	links {
		"DLL Injector"
	}

	files {
		"%{prj.name}/**.h",
		"%{prj.name}/**.cpp"
	}

	includedirs {
		"DLL Injector/src"
	}

	filter "system:windows"
		cppdialect "C++14"
		staticruntime "On"
		systemversion "latest"

	filter "configurations:Debug"
		symbols "On"

	filter "configurations:Release"
		optimize "On"