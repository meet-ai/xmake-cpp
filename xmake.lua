
add_rules("mode.debug", "mode.release")
--------------------------------------------------------
add_cxxflags("-std=c++20")
set_policy("build.c++.modules", true)

--add_requires("poco")
add_requires("fmt")
add_requires("spdlog")
add_requires("gtest")
add_requires("gflags")
add_requires("conan::poco/1.13.3",{alias = "poco",configs = {settings = "compiler.cppstd=20"}})
add_requires("conan::matchit/1.0.1",{alias = "matchit",configs = {settings = "compiler.cppstd=20"}})
add_requires("spdlog")
add_requires("toml++")
add_requires("cli11")

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
target("strutil")
    set_kind("moduleonly")
    add_packages("poco")
    add_files("modules/strutil.ixx")

----------------------------
target("main")
    --add_packages("poco")
    add_deps("strutil")
    add_packages("cli11")
    add_packages("spdlog")
    add_packages("poco")
    add_packages("boost_di")
    add_packages("cista")
    add_packages("toml++")
    add_packages("reflect-cpp")
    add_packages("matchit")
    add_packages("poco")

    add_files("src/cmd/main.cpp")
    add_includedirs("src")
    set_kind("binary")
    --add_files("src/config/*.cpp")
