
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

--------------------------------------------------------
add_cxxflags("-std=c++17")

add_requires("zlib")
add_requires("expat",{system=false})
add_requires("civetweb",{system=false})
add_requires("poco")
add_requires("fmt")
add_requires("spdlog")
add_requires("apr")
add_includedirs("/usr/include", "/usr/local/include")
--add_ldflags( "-ldl", "-latomic")
add_requires("gtest")
add_requires("gflags")

add_requires("abseil")
add_requires("grpc")
add_requires("protobuf-cpp")
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
    add_packages("expat")
    add_packages("civetweb")
    add_packages("poco")
    add_packages("fmt")
    add_packages("spdlog")
    add_packages("grpc")
    add_packages("protobuf-cpp")
    add_packages("prometheus-cpp")
    add_packages("abseil")

-- cpp
    add_files("src/cmd/main.cpp|omain.cpp")
    add_files("proto/*.cc")
    add_files("proto/message.pb.grpc.cc")

--
    add_includedirs("src")
    add_includedirs("proto")

-- lib include


--link
--  add_rpathdirs("/usr/local/cuda-10.2/targets/x86_64-linux/lib/")
--  add_linkdirs("/usr/local/cuda-10.2/targets/x86_64-linux/lib/")
--  add_links("cudart")
--  add_linkdirs("/Users/meetai/.xmake/packages/g/grpc/v1.46.3/4890cb8637fd4f3ab06e1263224fdd77/lib")
  add_linkdirs("/root/.xmake/packages/g/grpc/v1.46.3/8486e91ff6b74d5e8937b7a7afaa36c1/lib/")
  add_links("protobuf")
  add_links("protoc")
  add_links("grpc++")
  add_links("absl_time")
  add_links("absl_city", "absl_raw_logging_internal", "absl_flags_config", "absl_scoped_set_env", "absl_flags_usage", "absl_strings_internal", "absl_failure_signal_handler", "absl_flags_parse", "absl_statusor", "absl_flags_marshalling", "absl_cord", "absl_exponential_biased", "grpc++", "protobuf-lite", "absl_examine_stack", "grpc++_unsecure", "absl_random_internal_distribution_test_util", "absl_bad_any_cast_impl", "gpr", "absl_leak_check", "absl_cordz_sample_token", "absl_cordz_functions", "absl_str_format_internal", "absl_random_internal_randen_slow", "grpc++_reflection", "absl_int128", "absl_cordz_info", "absl_flags_commandlineflag", "grpc++_alts", "absl_leak_check_disable", "absl_cord_internal", "absl_stacktrace", "absl_spinlock_wait", "absl_status", "absl_symbolize", "z", "grpc_unsecure", "absl_random_internal_platform", "absl_cordz_handle", "absl_flags_commandlineflag_internal", "absl_flags_program_name", "absl_random_seed_gen_exception", "absl_raw_hash_set", "absl_malloc_internal", "absl_bad_optional_access", "absl_flags_usage_internal", "re2", "absl_graphcycles_internal", "crypto", "absl_debugging_internal", "absl_base", "upb", "address_sorting", "absl_random_internal_randen", "absl_throw_delegate", "absl_strerror", "grpc", "absl_strings", "absl_flags_reflection", "absl_random_internal_randen_hwaes", "grpc_plugin_support", "absl_flags", "absl_flags_private_handle_accessor", "absl_random_internal_randen_hwaes_impl", "absl_random_internal_pool_urbg", "absl_flags_internal", "absl_random_distributions", "absl_time_zone", "absl_hashtablez_sampler", "absl_random_seed_sequences", "grpc++_error_details", "absl_low_level_hash", "absl_random_internal_seed_material", "protobuf", "protoc", "ssl", "cares", "absl_bad_variant_access", "absl_civil_time", "absl_synchronization", "absl_demangle_internal", "absl_periodic_sampler", "grpcpp_channelz", "absl_hash", "absl_log_severity", "absl_time")
  add_links("gpr")
  add_links("grpc")

--  add_syslinks("pthread")

    set_kind("binary")
