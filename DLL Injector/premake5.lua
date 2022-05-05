project "DLL Injector"
	kind "StaticLib"
	language "C++"

	characterset("MBCS")

	targetdir ("%{wks.location}bin/%{cfg.buildcfg}/%{cfg.system}/%{cfg.architecture}/%{prj.name}")
	objdir ("%{wks.location}bin-intermediates/%{cfg.buildcfg}/%{cfg.system}/%{cfg.architecture}/%{prj.name}")

	files {
		"src/**.h",
		"src/**.cpp"
	}

	filter "system:windows"
		cppdialect "C++14"
		staticruntime "On"
		systemversion "latest"

	filter "configurations:Debug"
		symbols "On"

	filter "configurations:Release"
		optimize "On"