
add_rules("mode.debug", "mode.release")
-----------------------------
--package("prometheus")
--    add_deps("cmake")
--    add_deps("civetweb")
--    set_sourcedir(path.join(os.scriptdir(), "3rdparty/prometheus-cpp-1.1.0"))
--    on_install(function (package)
--        local configs = {}
--        table.insert(configs, "-DCMAKE_BUILD_TYPE=" .. (package:debug() and "Debug" or "Release"))
--        table.insert(configs, "-DBUILD_SHARED_LIBS=" .. (package:config("shared") and "ON" or "OFF"))
--        import("package.tools.cmake").install(package, configs)
--    end)
--    on_test(function (package)
--        --assert(package:has_cfuncs("add", {includes = "foo.h"}))
--    end)
--package_end()
--package("matchit")
--    add_deps("cmake")
--    set_sourcedir(path.join(os.scriptdir(), "3rdparty/matchit"))
--    on_install(function (package)
--        local configs = {}
--        table.insert(configs, "-DCMAKE_BUILD_TYPE=" .. (package:debug() and "Debug" or "Release"))
--        table.insert(configs, "-DBUILD_SHARED_LIBS=" .. (package:config("shared") and "ON" or "OFF"))
--        import("package.tools.cmake").install(package, configs)
--    end)
--
--    on_test(function (package)
--        --assert(package:has_cfuncs("add", {includes = "foo.h"}))
--    end)
--
--    on_fetch(function (package)
--          local result = {}
--          result.links = "matchit"
--          result.includedirs = package:installdir("include")
--          result.linkdirs = package:installdir("lib")
--          return result
--      end)
--package_end()

--------------------------------------------------------
add_cxxflags("-std=c++20")

add_requires("zlib")
add_requires("expat",{system=false})
add_requires("civetweb",{system=false})
--add_requires("poco")
add_requires("fmt")
add_requires("spdlog")
--add_requires("apr")
add_requires("conan::matchit/1.0.1", {alias = "matchit", configs = {}})
--add_includedirs("/usr/include", "/usr/local/include")
--add_ldflags( "-ldl", "-latomic")
add_requires("gtest")
add_requires("gflags")

add_requires("abseil")
add_requires("microsoft-proxy")
--add_requires("prometheus")
--
--
----------------------------private packages
--
--
--
--
--
--
----------------------------
target("main")
    --add_packages("poco")
    add_packages("matchit")
    add_packages("fmt")
    add_packages("spdlog")
    add_packages("prometheus-cpp")
    add_packages("abseil")
    add_packages("microsoft-proxy")

-- cpp
    add_files("src/cmd/main.cpp|omain.cpp")

--
    add_includedirs("src")
-- lib include


--link
--  add_syslinks("pthread")

    set_kind("binary")
