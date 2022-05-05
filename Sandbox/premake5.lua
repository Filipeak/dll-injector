project "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("%{wks.location}/bin/%{cfg.buildcfg}/%{cfg.system}/%{cfg.architecture}/%{prj.name}")
	objdir ("%{wks.location}/bin-intermediates/%{cfg.buildcfg}/%{cfg.system}/%{cfg.architecture}/%{prj.name}")

	links {
		"DLL Injector"
	}

	files {
		"src/**.h",
		"src/**.cpp"
	}

	includedirs {
		"%{wks.location}/DLL Injector/src"
	}

	filter "system:windows"
		cppdialect "C++14"
		staticruntime "On"
		systemversion "latest"

	filter "configurations:Debug"
		symbols "On"

	filter "configurations:Release"
		optimize "On"